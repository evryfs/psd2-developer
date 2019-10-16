'use strict';

const configuration = Object.freeze({
  environment: process.env.NODE_ENV || 'development',
  server: {
    host: '0.0.0.0',
    port: process.env.NODE_PORT || process.env.PORT || 8731
  },
  httpMessageSigner: {
    enabled: true,
    options: {
      algorithm: 'RSA-SHA256',
      headers: {
        berlinGroup: [ 'date', 'digest', 'x-request-id', 'psu-id', 'psu-corporate-id', 'tpp-redirect-uri' ]
      }
    }
  },
  proxy: {
    options: {
      /*
       * PSD2
       * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
      host:	'', // set by input when starting reverse-proxy
      map: /(.*?)/,
      match: /^(?!\/ignore\.html)/,
      jar: true,
      suppressRequestHeaders: ['accept-encoding'],
      suppressResponseHeaders: undefined,
      followRedirect: true,
      requestOptions: {
        followAllRedirects: true,
        followOriginalHttpMethod: false,
        agentOptions: {
          rejectUnauthorized: false
        }
      }
    }
  }
});

export default configuration;