import { timeConverter, readPid } from '../utils/helper.js';
const cron = require('node-cron');
const shell = require('shelljs');
let logger = require('../utils/logger.js').logger;


var job = cron.schedule('*/1 * * * *', async() => {
    let pid = readPid("stale_pid");
    if (pid) {
        logger.info(`Shutting down the process id: ${pid}`);
        shell.exec(`kill ${pid}`);
    }
    logger.info(`Calling the script in every 3 hours, current time is: ${timeConverter(Math.floor(Date.now()/1000))}`);
    shell.exec(`npm run stalePrice:local`);
},false);

job.start();