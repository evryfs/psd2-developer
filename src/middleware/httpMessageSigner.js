'use strict';

import _ from 'lodash';
import * as fs from 'fs';
import * as crypto from 'crypto';
import * as jsprim from 'jsprim';
import * as pem from 'pem';
import configuration from '../configuration';

export default function(options) {
    // Middleware
    return async (ctx, next) => {
        

        if (!configuration.httpMessageSigner.enabled) {
            return next();
        }

        // Set algorithm
        let algorithm = options.algorithm;

        // Find Public Key
        let privateKeyPath ='';
        let publicKeyPath = '';
		let host = configuration.proxy.options.host;
		process.argv.forEach(function (val, index, array) {
			console.log(index + ': ' + val);
			if (val.startsWith("privateKey")) {
                privateKeyPath = val.substr("privateKey".length+1)
            }
            if (val.startsWith("publicKey")) {
                publicKeyPath = val.substr("publicKey".length+1)
            }
            if (val.startsWith("host")) {
                host = val.substr("host".length+1)
            }
		});
		console.log("\x1b[33m%s\x1b[0m", `> ${ctx.method} ${host}${ctx.path}`)


        if (_.isNil(algorithm) || _.toLower(algorithm) !== 'rsa-sha256') {
            ctx.throw(500, `${algorithm} is not supported`);
        }        

        console.log('  request:');

        // Set the Date header value if not already present
        if (_.isNil(ctx.request.header['date'])) {
            let date = jsprim.rfc1123(new Date());;
            ctx.request.header.date = date;
            console.log("    date: " + date);
        }

        // Update Host header
        ctx.request.header.host = host.replace(/(^\w+:|^)\/\//, '');

        // We need to add a Digest and Content-Length work for PUT and POST requests with a payload
        if ((ctx.method === 'POST' || ctx.method === 'PUT') && ctx.is('application/json') && !_.isNil(ctx.request.body)) {
            const body = JSON.stringify(ctx.request.body);
            
            console.log(`     body: ${body.replace(new RegExp('(.{80})', 'g'), '$1\n           ')}`);

            // Set Content-Length
            const contentLength = Buffer.byteLength(body);
            if (_.isNil(ctx.request.header['content-length'])) {
                ctx.request.header['content-length'] = contentLength;
            }
            console.log("    content-length: " + ctx.request.header['content-length']);

            // Set Digest
            const bin = crypto.createHash('sha256').update(body, 'utf8').digest('bin');
            const digest = Buffer.from(bin).toString('base64');
            if (_.isNil(ctx.request.header['digest'])) {
                ctx.request.header['digest'] = `SHA-256=${digest}`;                
            }
            console.log("    digest: " + ctx.request.header['digest']);
        }

        // We need to collect the configured headers
        let configuredSignatureHeaders = options.headers.berlinGroup;
        

        // We need to resolve which supported headers are available out of those provided in the request
        let resolvedHeaders = []; 

        // Now that we know the configured headers, let's resolve the headers we find in the request
        _.forEach(configuredSignatureHeaders, function(entry) {
            if (entry === '(request-target)') {
                resolvedHeaders.push('(request-target)');
            } else if (_.has(ctx.request.header, entry)) {
                resolvedHeaders.push(entry);
            }
        });

        console.log('public path' , publicKeyPath)
        console.log('private path' , privateKeyPath)
        let publicKey = fs.readFileSync(publicKeyPath, 'ascii');
		const certificateInfo = await resolveCertificateInfo(publicKey);

        let certificate = getCertificate(certificateInfo, privateKeyPath);

        let publicKeyString = publicKey;

        publicKeyString = publicKeyString.replace('-----BEGIN CERTIFICATE-----', '');
        publicKeyString = publicKeyString.replace('-----END CERTIFICATE-----', '');
        publicKeyString = publicKeyString.replace(/\n/g, '');
        publicKeyString = publicKeyString.replace(/\r/g, '');

        ctx.request.header['tpp-signature-certificate'] = publicKeyString;

        console.log('  certificate: ')

        if (certificate == null) {
            throw new Error("unable to resolve certificate from " + publicKeyPath )
        }

        console.log("    serial: " + certificate.serial);
        console.log("    issuer: " + certificate.issuer);
        console.log("    subject: " + certificate.subject);

        const privateKey = fs.readFileSync(privateKeyPath, 'ascii');

        // Set Signature Parameters
        console.log("  signature: ");
        let parameters = {
            algorithm: _.toLower(algorithm),
            headers: resolvedHeaders.join(' '),
            signature: sign(ctx, publicKey, privateKey, algorithm, resolvedHeaders)
        };

        parameters.keyId = `SN=${certificate.serial},CA=${certificate.issuer}`
        

        console.log(`    keyId: ${parameters.keyId}`)
        console.log(`    algorithm: ${parameters.algorithm}`)
        console.log(`    headers: ${parameters.headers}`)

        ctx.request.header['signature'] = formatSignature(parameters);

        console.log(`    encrypted value:`)
        console.log(`      ${parameters.signature.replace(new RegExp('(.{80})', 'g'), '$1\n      ')}`) // add a line break after every 80 characters
       
        await next();
    };
};

const parseCertificateFromHeader = function(certificate){
    let result = '-----BEGIN CERTIFICATE-----\n';
    let next = 64;
    if(certificate){
        while (next < certificate.length) {
            result += certificate.substring(next-64, next);
            result +='\n';
            next += 64;
        }
        const remaining = 64 - (next - certificate.length);
        console.log('next', next, 'remaining', remaining, 'length', certificate.length)
        result += certificate.substring(certificate.length - remaining, certificate.length);
    }
    result +=  '\n-----END CERTIFICATE-----';
    return result;

}

let getCertificate = (certificateInfo, privateKeyPath) => {
    // Build serial
    const serial = formatSerialNumber(certificateInfo.serial);

    // Resolve values used for Distinguished Name (DN) as described by RFC 4514
    let resolvedIssuerProperties = new Map();
    _.forOwn(certificateInfo.issuer, function(value, key) {
        if (!_.isEmpty(value)) {
            let abbreviation = getDistinguishedNameAbbreviationFromPropertyName(key);

            if (abbreviation != undefined) {
                resolvedIssuerProperties[abbreviation] = value;
            }
        }
    });

    const issuer = getRfc2253Issuer(resolvedIssuerProperties);

    const privateKey = fs.readFileSync(privateKeyPath, 'ascii');

    return {
        serial: serial,
        issuer: issuer,
        subject: "resolve not implemented",
        privateKey: privateKey
    }
}

/**
 * Sorts the DN by the order derived from RFC 4514
 * 
 * @param {*} source 
 */
const getRfc2253Issuer = (source) => {
    // order these properties in accordance with RFC 4514 (CN, O, OU, L, S, C) and build our issuer value
    const keys = Object.keys(source);
    const sortedKeys = ['CN', 'O', 'OU', 'L', 'S', 'C'].filter((key)=>{
        return keys.includes(key);
    });
    return sortedKeys.map(function(key){ 
        return key+'='+source[key]
    }).join(",");
};

/**
 * Gets the distinguished name abbreviations from full X.500 attribute 
 * type names
 * 
 * @param {*} propertyName 
 */
let getDistinguishedNameAbbreviationFromPropertyName = (propertyName) => {
    if (propertyName === 'commonName') return 'CN';
    if (propertyName === 'organization') return 'O';
    if (propertyName === 'organizationUnit') return 'OU';
    if (propertyName === 'locality') return 'L';
    if (propertyName === 'state') return 'S';
    if (propertyName === 'country') return 'C';

    return undefined;
}

/**
 * Extract the certificate information from a PEM-formatted certificate
 * 
 * @param {*} certificate
 */
let resolveCertificateInfo = (certificate) => {
    let certificateInfo = new Promise((resolve, reject) => {
        pem.readCertificateInfo(certificate, function(error, result) {
            if (error) {
                console.log(`    error reading certificate info: ${error}`)

                reject(error)
            } else {
                resolve(result);
            }
        });
    });

    return certificateInfo;   
};

/**
 * Extract the certificate information from a PEM-formatted certificate
 *
 * @param {*} certificate
 */
let resolvePublicKey = (certificate) => {
    let publicKeyPem = new Promise((resolve, reject) => {
        pem.getPublicKey(certificate, function(error, result) {
            if (error) {
                console.log(`    error reading certificate info: ${error}`)

                reject(error)
            } else {
                resolve(result);
            }
        });
    });

    return publicKeyPem;
};

/**
 * Resolves a header values from the provided context
 * 
 * @param {*} ctx the context 
 * @param {*} key the header key to resolve
 */
let getRequestHeaderValue = (ctx, key) => {
    switch (key) {
        case '(request-target)':
            let value = _.toLower(ctx.method) + ' ' + ctx.path

            if (!_.isEmpty(ctx.request.querystring)) {
                value = `${value}?${ctx.request.querystring}`;
            }

            return value;
        default:
            return ctx.request.header[key];
    }
}

/**
 * Format the serial number in uppercase hexadecimal without octet separators 
 * or the least-significant bit
 * 
 * @param {*} serial the serial number to format
 */
let formatSerialNumber = (serial) => {
    const hexRegExp = new RegExp('0[xX][0-9a-fA-F]+', 'g');
    const hexMatch = serial.match(hexRegExp);

    if (hexMatch && hexMatch.length === 1) {
        console.log(`    matches 0[xX][0-9a-fA-F]+`);
    
        const result = _.toUpper(hexMatch[0].slice(2, hexMatch[0].length));
        return result;
    } else {
        const result = _.toUpper(serial.replace(new RegExp(':', 'g'), ''));

        let resultWithOutLeadingZero = result.replace(/^0+/, '');

        return resultWithOutLeadingZero;
    }
}

let formatSignature = (parameters) => {
    var params = ["keyId", "algorithm", "headers", "signature"]

    var parameterStrings = params.map(function(key) {
        return `${key}="${parameters[key]}"`;
    });

    var result = parameterStrings.join(",");

    return result;
}

/**
 * Signs and verifies a message using the provided key
 * 
 * @param {*} ctx  the context
 * @param {*} certificate the public certificate used to verify the signature
 * @param {*} privateKey the private key used to sign
 * @param {*} algorithm the algorithm used to sign
 * @param {*} headers the HTTP headers to use to construct the signing string
 */
let sign = (ctx, certificate, key, algorithm, headers) => {

    let headersWithValues = headers.map(function(value) {
        let keyValue = _.toLower(value) + ": " + getRequestHeaderValue(ctx, value);

        return keyValue;
    });

    var signingString = headersWithValues.join('\n');

    console.log('    signing string: ')
    console.log(`      ${signingString.replace(new RegExp('\\n', 'g'), '\n      ')}`)

    var signer = crypto.createSign(algorithm)
    signer.update(signingString);
    var signed = signer.sign(key, 'base64');

    var verifier = crypto.createVerify(algorithm);
    verifier.update(signingString);
    var valid = verifier.verify(certificate, signed, 'base64')

    console.log("    crypto verifier: " + valid)

    return signed;
}