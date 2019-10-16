'use strict';

import configuration from './configuration';

(async () => {
    const app = require('./server').app;

    app.listen(configuration.server.port, () => {
        console.log(`server listening on ${configuration.server.host}:${configuration.server.port} with environment ${configuration.environment}`);
    });
})();