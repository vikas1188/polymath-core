import { purgeQueue } from '../services/queue_service.js';
// Load the config file and read it in JSON format using the read-ymal
let read = require('read-yaml');
let config = read.sync('config.yml');
let logger = require('../utils/logger.js').logger;


async function cleanQueue() {
    logger.info(`Purging the queue....`);
    logger.info(await purgeQueue(config.aws_sqs_settings.queue_1));
    process.exit(0);
}

process.on('unhandledRejection', (reason, promise) => {
    logger.error(`Unhandled Rejection at: ${reason.stack}`);
});


cleanQueue();