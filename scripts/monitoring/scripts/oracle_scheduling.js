import { duration, options, estimateGas, timeConverter, writePid } from '../utils/helper.js';
import { send_alert_mail } from '../services/mail_service.js';
import { 
    pushMessage,
    getQueueUrl,
    listQueues,
    readMessage,
    getQueueLength
} from '../services/queue_service.js';

const Web3 = require('web3');
const read = require('read-yaml');
const chalk = require('chalk');
let asyncLoop = require('node-async-loop')
let logger = require('../utils/logger.js').logger;
let config = read.sync('config.yml');

///////////////////////
///// Global variables
///////////////////////

let web3;
let polyUsdOracleABI;
let polyUSDOracle, owner;
let timeSchedules = new Array();
const DEFAULT_GAS_PRICE = 10000000000;
const hoursInWeek = 7 * 24;
let selected_network = process.argv.slice(2)[0];
let schedule = process.argv.slice(2)[1];
let span = process.argv.slice(2)[2];


// set the provider you want from Web3.providers
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

logger.info(`Choosen network is ${chalk.blue(`${selected_network.toUpperCase()}`)} & choosen scheduling period is is ${chalk.blue(`${schedule.toUpperCase()}`)}`);
logger.info(`WebSocket instance for web3 is created successfully..`);
logger.info(`Current process id ${process.pid}`);

try {
    polyUsdOracleABI = JSON.parse(require('fs').readFileSync('../../build/contracts/MockPolyOracle.json').toString()).abi;
} catch(error) {
    logger.error(` Unable to read the contract ABI or application doesn't have the build folder`, error);
}

async function setup() {
    try {
        polyUSDOracle = new web3.eth.Contract(polyUsdOracleABI, config.properties[`${selected_network}`].contract_address);
        polyUSDOracle.setProvider(web3.currentProvider);
        logger.info(`Creating contract instance of address: ${config.properties[`${selected_network}`].contract_address}...`);
    }catch(err){
      logger.error(err.message);
      console.log('\x1b[31m%s\x1b[0m',"There was a problem getting the contracts. Make sure they are deployed to the selected network.");
      return;
    }

    let accounts = await web3.eth.getAccounts();
    owner = accounts[0];
    writePid("scheduler_pid", process.pid);
    logger.info(`Everything set-up well, owner who will call the functions : ${owner}`);
    await check_scheduler_status();
}

async function check_scheduler_status() {
        logger.info(`Checking the status of the scheduling....`);
        let len = await getQueueLength(config.aws_sqs_settings.queue_1);
        let lastUpdate = await polyUSDOracle.methods.latestUpdate().call();
        if (lastUpdate == 0) {
            logger.info(`This is the first time to intiate the scheduling at the time ${timeConverter(Math.floor(Date.now()/1000))}`);
            await scheduling(0);
        } else {
            if (len <=8 && len > 0) {
                let data = await readMessage(config.aws_sqs_settings.queue_1, 10);
                // JSON.parse(data[len-1].Body).scheduleTime
                let hoursLeft = (parseInt(JSON.parse(data[len-1].Body).scheduleTime) - Math.floor(Date.now()/1000))/(24*60*60);
                let timeLeft = parseInt(JSON.parse(data[len-1].Body).scheduleTime) - Math.floor(Date.now()/1000);
                send_alert_mail("Schedule POLYUSD oracle calls", `only ${hoursLeft} hrs left`);
                logger.info(`Scheduling the oracle calls only ${hoursLeft} hrs left`);
                await scheduling(timeLeft);
            } else {
                if (len == 0) {
                    logger.info(`ALERT - scheduled calls are ended. Please schedule calls as quick as possible`);
                    send_alert_mail("No calls are left", `ALERT - scheduled calls are ended. Please schedule calls as quick as possible`);
                    await scheduling(0);
                } else {
                    logger.info("Calls are already scheduled .....");
                    process.exit(0); 
                }
            }
            
        }

}

async function scheduling(timeLeft) {
    let noOftiers;
    if (span == "hours_span")
        noOftiers= Math.floor((((parseInt(config.oracle_scheduling[`${schedule}`])) * getHours(schedule)) / parseInt(config.oracle_scheduling[`${span}`])));
    if(span == "minutes_span") 
        noOftiers= Math.floor((((parseInt(config.oracle_scheduling[`${schedule}`])) * getHours(schedule) * 60) / parseInt(config.oracle_scheduling[`${span}`])));
    let tiers = new Array();
    let value = parseFloat(config.oracle_scheduling.estimated_value)*noOftiers;
    logger.info(`Scheduling the call for no. of tiers: ${chalk.green(`${noOftiers}`)} it will cost the estimated value in ETH is : ${chalk.green(`${value}`)}`);
    for (let i = 0; i < noOftiers; i++) {
        tiers.push((Math.floor(Date.now()/1000) + (i*parseInt(config.oracle_scheduling[`${span}`])* getSeconds(span))+ timeLeft));
    }
    if (await polyUSDOracle.methods.owner().call() != owner || await polyUSDOracle.methods.admin(owner).call()) {
        (async() => {
            logger.error("Unauthorized Access");
            await send_alert_mail("Unauthorized Access", "Some one unauthorized address trying to scheduling the calls");
            process.exit(0);
        })
    } else {
        logger.info(`Calling the scheduler function of the ${config.properties[`${selected_network}`].contract_name}...`);
        let schedulingCalls = polyUSDOracle.methods.schedulePriceUpdatesFixed(tiers);
        let GAS = await estimateGas(schedulingCalls, owner, 1.2, web3.utils.toWei(value.toString()));
        if (await web3.eth.getBalance(owner) > web3.utils.toWei(value.toString()) + (GAS * DEFAULT_GAS_PRICE)) {
            try {
                logger.info(`Estimated gas usage for this scheduling is: ${chalk.yellow(`${GAS}`)}`);
                await schedulingCalls.send({from: owner, gas:GAS, value: web3.utils.toWei(value.toString()), gasPrice: DEFAULT_GAS_PRICE})
                .on('receipt', async(receipt) => {
                    logger.info(`Congratulations! The transaction was successfully completed TxHash: ${receipt.transactionHash}`);
                    logger.info("Successfully scheduled the calls...");
                    /// Parsing the logs and storing the data
                    for (let i = 1; i < receipt.events.LogNewOraclizeQuery.length; i++) {
                        timeSchedules.push({scheduleTime: receipt.events.LogNewOraclizeQuery[i].returnValues._time, queryId: receipt.events.LogNewOraclizeQuery[i].returnValues._queryId});
                    }
                    logger.info(`Pushing the messages to FIFO queue`);
                    asyncLoop(timeSchedules, async(data, next) => {
                        let result = await pushMessage(config.aws_sqs_settings.queue_1, data.scheduleTime, data.queryId);
                        if (result == null || result == undefined) {
                            (async() => {
                                logger.error(`Not able to write in a queue possibly a connection problem with SQS service of Amazon`);
                                await send_alert_mail("Not able to write in a queue", `Pushing the message in a queue is giving the error`);
                                return;
                            })
                        } else {
                            return next(null);
                        }
                    });
                })
                .on('error', async(error) => {
                    logger.error("Error in transaction", error);
                    await send_alert_mail("Call scheduling is fail", error.message);
                    return;
                });
            } catch(error) {
                logger.error("Tx failure of scheduling calls", error);
                return;
            }
            
            // logging the IDS
            for (let i = 0; i < timeSchedules.length; i++) {
                logger.info(timeSchedules[i]);
            }
        } else {
            (async() => {
                logger.info(`caller ${owner} doesn't have sufficient ETH balance to initiate the tx.`);
                await send_alert_mail("ETH lackness", `Caller ${owner} doesn't have sufficient ETH balance to initiate the tx.`);
                return;
            })
        }   
    }
    
}


process.on('unhandledRejection', async(reason, promise) => {
    logger.error(`Unhandled Rejection at: ${reason.stack}`);
    await send_alert_mail("Unhandeled error introduce", `${reason.stack}`);
  })


function getHours(schedule) {
    if(schedule === "weekly") {
        return 7*24;
    }
    if(schedule === "daily") {
        return 24;
    }
    if(schedule === "monthly") {
        return 7*30*24;
    }
}

function getSeconds(span) {
    if (span === "hours_span") {
        return 60*60;
    }
    if(span === "minutes_span") {
        return 60;
    }
}

setup();

/////////////////////
/// Helper Functions
/////////////////////

