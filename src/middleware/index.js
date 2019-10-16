'use strict';

import compose from 'koa-compose';
import handleError from './handleError';
import responseTime from './responseTime';
import httpMessageSigner from './httpMessageSigner';
import configuration from '../configuration';
import nullifyBody from './nullifyBody';

export default function() {
    return compose([
        handleError(),
        responseTime(),
        httpMessageSigner(configuration.httpMessageSigner.options),
        nullifyBody()
    ]);
}