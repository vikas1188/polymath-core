import { duration, timeConverter, writePid } from '../utils/helper.js';
import { send_alert_mail } from '../services/mail_service.js';
let Web3 = require('web3');
let read = require('read-yaml');
let chalk = require('chalk');
let config = read.sync('config.yml');
let logger = require('../utils/logger.js').logger;


////////////////////////
//// Global variables
///////////////////////
let polyUsdOracleABI;
let polyUSDOracle;
let owner;
let web3;
let bufferInMins = 5;
let selected_network = process.argv.slice(2)[0];
let span = process.argv.slice(2)[1];

try {
    polyUsdOracleABI = JSON.parse(require('fs').readFileSync('../../build/contracts/MockPolyOracle.json').toString()).abi;
} catch(error) {
    logger.error(chalk.red(` Unable to read the contract ABI or application doesn't have the build folder`));
}

if (typeof web3 !== 'undefined') {
    web3 = new Web3(web3.currentProvider);
  } else {
    // set the provider you want from Web3.providers
    if (selected_network === "ganache") {
        web3 = new Web3(new Web3.providers.WebsocketProvider("ws://localhost:8545"));
    }
    else if (selected_network === "ropsten") {
        web3 = new Web3(new Web3.providers.WebsocketProvider('wss://ropsten.infura.io/ws'));
    }
    else if (selected_network === "kovan") {
        web3 = new Web3(new Web3.providers.WebsocketProvider('wss://kovan.infura.io/ws'));
    }
    else if (selected_network === "mainnet") {
        web3 = new Web3(new Web3.providers.WebsocketProvider('wss://mainnet.infura.io/ws'));
    }
}

logger.info(`Choosen network is ${chalk.blue(`${selected_network.toUpperCase()}`)} & webSocket instance for web3 is created successfully..`)
logger.info(`Current process id ${process.pid}`);

// contract Instance
async function setup() {
    try {
        polyUSDOracle = new web3.eth.Contract(polyUsdOracleABI, config.properties[`${selected_network}`].contract_address);
        polyUSDOracle.setProvider(web3.currentProvider);
        logger.info(`Creating contract instance of address: ${config.properties[`${selected_network}`].contract_address}...`);
    }catch(err){
      console.log(err)
      console.log('\x1b[31m%s\x1b[0m',"There was a problem getting the contracts. Make sure they are deployed to the selected network.");
      return;
    }

    let accounts = await web3.eth.getAccounts();
    owner = accounts[0];
    writePid("stale_pid", process.pid);
    logger.info(`Everything set-up well, owner who will call the functions : ${owner}`);
    check_price_stale();
}

async function check_price_stale() {
    logger.info(`Checking the price status.....`);
    let _priceAndTime = await polyUSDOracle.methods.getPriceAndTime().call();
    if (_priceAndTime[1] == 0) {
        logger.info(`Calls are not scheduled yet! Please schedule the calls first`);
        process.exit(0);
    }
    if(span === "hours_span") {
        if (_priceAndTime[1] >= (Math.floor(Date.now()/1000) - (duration.hours(config.oracle_scheduling.hours_span) + duration.minutes(5)))) {
            logger.info(`Price is updating according to schedule calls latest price is: ${chalk.green(web3.utils.fromWei(_priceAndTime[0]))} and time is ${chalk.green(timeConverter(_priceAndTime[1]))}`);
            logger.info(`We are in good position`);
            process.exit(0);
        } else {
            logger.info(`Price got stale last update time is: ${chalk.red(timeConverter(_priceAndTime[1]))} and last price is: ${chalk.red(web3.utils.fromWei(_priceAndTime[0]))}`);
            await send_alert_mail("Price got stale", `Last update time is: ${timeConverter(_priceAndTime[1])} and last price is: ${web3.utils.fromWei(_priceAndTime[0])}. Please quickly resolve the staling problem`);
            process.exit(0);
        }
    }
    else if (span === "minutes_span") {
        if (_priceAndTime[1] >= (Math.floor(Date.now()/1000) - (duration.minutes(config.oracle_scheduling.minutes_span) + duration.minutes(5)))) {
            logger.info(`Price is updating according to schedule calls latest price is: ${chalk.green(web3.utils.fromWei(_priceAndTime[0]))} and time is ${chalk.green(timeConverter(_priceAndTime[1]))}`);
            logger.info(`We are in good position`);
            process.exit(0);
        } else {
            logger.info(`Price got stale last update time is: ${chalk.red(timeConverter(_priceAndTime[1]))} and last price is: ${chalk.red(web3.utils.fromWei(_priceAndTime[0]))}`);
            await send_alert_mail("Price got stale", `Last update time is: ${timeConverter(_priceAndTime[1])} and last price is: ${web3.utils.fromWei(_priceAndTime[0])}. Please quickly resolve the staling problem`);
            process.exit(0);
        }
    } 
}

process.on('unhandledRejection', async(reason, promise) => {
    logger.error(`Unhandled Rejection at: ${reason.stack}`);
    await send_alert_mail("Unhandeled error introduce", `${reason.stack}`);
});


setup();
