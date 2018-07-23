import { timeConverter, readPid } from '../utils/helper.js';
const cron = require('node-cron');
const shell = require('shelljs');
let logger = require('../utils/logger.js').logger;

var job = cron.schedule('*/5 * * * *', async() => {
    let pid = readPid("scheduler_pid");
    if (pid) {
        logger.info(`Shutting down the current process id: ${pid}`);
        shell.exec(`kill ${pid}`);
    }
    logger.info(`Calling the script in every 3 hours, current time is: ${timeConverter(Math.floor(Date.now()/1000))}`);
    shell.exec(`npm run oracle-scheduling:local`);
},false);

job.start();