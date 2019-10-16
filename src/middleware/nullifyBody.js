'use strict';

import _ from 'lodash';

export default function() {
    return async (ctx, next) => {
        // We've tried two middlewares to parse the content body of a request or reponse; koa-body and koa-bodyparser. Unluckily both 
        // of these has a very similar bug; they'll create an empty Object ('{}') for GET, HEAD and DELETE requests, regardless of their 
        // strict mode setting.
        // 
        // Now this doesn't play very well with koa-proxy's getParsedBody(ctx) function, as it'll end up trying to convert this empty object 
        // to a string for GET, HEAD or DELETE requests when you're missing a Content-Type header. This string naturally becomes the 
        // 15-byte '[object Object]'. 
        //
        // ref. https://github.com/dlau/koa-body/blob/master/index.js line 141
        // and  https://github.com/dlau/koa-body/blob/master/index.js line 84
        //
        // as such .. let's safe guard and nullify the body if this happens
        if (!_.isNil(JSON.stringify(ctx.request.body)) && ["GET", "HEAD", "DELETE"].indexOf(ctx.method.toUpperCase()) > -1) {
            ctx.request.body = null;
        }

        await next();
    };
}