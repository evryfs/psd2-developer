'use strict';

import uuid from 'uuid';

export default function() {
    return async (context, next) => {
        try {
            await next();
        } catch(error) {
            context.status = error.status || 500;
            context.body = {
                id: uuid.v4(),
                code: "ERROR",
                system: 'tpp-reverse-proxy',
                status: context.status,
                message: error.message
            }
            
            context.app.emit('error', error, context);
        }
    };
}