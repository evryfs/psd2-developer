'use strict';

import fs from 'fs';
import path from 'path';
import Koa from 'koa';
import rfs from 'rotating-file-stream';
import middleware from './middleware';
import configuration from './configuration';
import bunyan from 'bunyan';
import koaBunyanLogger from 'koa-bunyan-logger';
import koaBody from 'koa-body';
import koaCors from 'koa-cors';
import koaProxy from 'koa-proxy';
import convert from 'koa-convert';

const app = new Koa();

process.argv.forEach(function (val, index, array) {
    if (val.startsWith("host")) {
        configuration.proxy.options.host = val.substr("host".length+1)
    }
});

app.use(koaBody({ 
    strict: true,
    encoding: 'utf-8'
}));

app.use(convert(koaCors()))

var logDirectory = path.join(__dirname, 'logs')

fs.existsSync(logDirectory) || fs.mkdirSync(logDirectory)

var accessLogStream = rfs('access.log', {
    interval: '1d', // rotate daily
    path: logDirectory
});



app.use(koaBunyanLogger({
    name: 'tpp-reverse-proxy',
    level: 'debug',
    serializers: {
        req: function (req) {
            if (!req || !req.connection)
                return req;

            return {
                method: req.method,
                url: req.url,
                headers: req.headers,
                body: req.body,
                remoteAddress: req.connection.remoteAddress,
                remotePort: req.connection.remotePort
            }
        },
        res: bunyan.stdSerializers.res,
        err: bunyan.stdSerializers.err
    },
    stream: accessLogStream
}));

app.use(koaBunyanLogger.requestLogger()),

app.use(koaBunyanLogger.requestIdContext({
    header: 'X-Request-ID'
}));

app.use(koaBunyanLogger.timeContext());

app.use(middleware());

app.use(koaProxy(configuration.proxy.options));

export { app }