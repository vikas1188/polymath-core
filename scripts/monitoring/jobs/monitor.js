import { timeConverter, readPid } from '../utils/helper.js';
const cron = require('node-cron');
const shell = require('shelljs');
let logger = require('../utils/logger.js').logger;

var job = cron.schedule('*/2 * * * *', async() => {
    logger.info(`Calling the script in every 2 minutes, current time is: ${timeConverter(Math.floor(Date.now()/1000))}`);
    let pid = readPid("monitor_pid");
    if (pid) {
        logger.info(`Process is running cool with process id: ${pid}`);
    } else {
        logger.info(`Initiating the monitoring process...`);
        shell.exec(`npm run monitor-oracle:local`);
    }
},false);

job.start();