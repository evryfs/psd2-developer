'use strict';

export default function() {
    return async (context, next) => {
        const start = Date.now();

        await next();

        const ms = Date.now() - start;
        
        context.set('X-Response-Time', `${ms}ms`);
    };
}