import { duration, options, estimateGas, writePid } from '../utils/helper.js';
import { send_alert_mail } from '../services/mail_service.js';
import {  
    getQueueUrl,
    listQueues,
    readMessage,
    getQueueLength,
    deleteMessage
} from '../services/queue_service.js';

let Web3 = require('web3');
let read = require('read-yaml');
const chalk = require('chalk');
let config = read.sync('config.yml');
let logger = require('../utils/logger.js').logger;
////////////////////////
//// Global variables
///////////////////////

let polyUsdOracleABI;
let polyUSDOracle;
let web3;
let lastUpdate;
let lastPrice;
let owner;

let ValidRequestIds = new Array();
let queryData = new Array();
let selected_network = process.argv.slice(2)[0];

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
    writePid("monitor_pid", process.pid);
    logger.info(`Everything set-up well, owner who will call the functions : ${owner}`);
    eventWatcher();
}


async function eventWatcher() {
    await watchPriceUpdate("LogPriceUpdated", {});
}


async function watchPriceUpdate(eventName, filter) {
    try {
        await polyUSDOracle.events[`${eventName}`]({
            filter:filter,
            fromBlock:0
        }, async(error, event) => {
            if(error) {
                logger.error(`Error in filtering the logs :${error}`);
                await alert(`Error in filtering the logs`, `${error}`);
            } else {
                logger.info(`Successfully filtering the logs....`);
            }
        })
        .on('data', async(event)=> {
            let currentTime = event.returnValues._time;
            if (event.returnValues._queryId === "0x0000000000000000000000000000000000000000000000000000000000000000") {
                logger.info("Manually transaction performed by the owner");
            } else {
                if (!await check_Invalid_Id(event.returnValues._queryId)) {
                    logger.info(`Latest queryId is: ${event.returnValues._queryId} and timestamp is: ${event.returnValues._time}`);
                    let messageData = await readMessage(config.aws_sqs_settings.queue_1,1);
                    if (JSON.parse(messageData[0].Body).queryId == undefined) {
                        logger.error(`Reading the undefined value`);
                        await alert(`Reading the undefined value`, `readMessage and event data does not match. High chances is that the queue order is get wrong try to fix this manually`);                        
                    }
                    let _id = JSON.parse(messageData[0].Body).queryId;
                    logger.info(`Processing the queryId comes from queue: ${chalk.green(`${_id}`)}....`);
                    logger.info(`Data retrieve from the blockchain: ${chalk.yellow(`${event.returnValues._queryId}`)}`);
                    logger.info(`Timestamp for the corresponding Id is :${await polyUSDOracle.methods.requestIds(event.returnValues._queryId).call()}`);
                    if (_id === event.returnValues._queryId) {
                        logger.info(`${_id} is successfully match...`);
                        let messageId = await deleteMessage(config.aws_sqs_settings.queue_1, messageData[0].ReceiptHandle);
                        if (!messageId) {
                            logger.error(`Error in deleting the Id: ${_id}. If it will not be resolved then it will mess the queue series so please try to delete this queue manually with in 3 hours`);
                            await alert(`Connection problem with sqs instance`,`Error in deleting the Id: ${_id}. If it will not be resolved then it will mess the queue series so please try to delete this queue manually with in 3 hours`);
                        } 
                    } else {
                        logger.error(`readMessage and event data does not match. High chances is that the queue order is get wrong try to fix this manually`);
                        await alert(`queue order is mis match`, `readMessage and event data does not match. High chances is that the queue order is get wrong try to fix this manually`);
                    }
                } else {
                    logger.error(`Ignore Id is executing. There was some error in executing the setRequestIgnoreIds`);
                    await alert("In-valid queryId", "Invalid request Id processed");
                }
            }
            
            
        })
        .on('changed', function(event){
            // remove event from local database
        })
        .on('error', async(error) => {
            logger.error(error.message);
            await alert(`Getting error in catching the event`, `${error.message}`);
        });
    } catch(error) {
        logger.error(`Event "${eventName}" subscription failed: ${error.message}`);
        await alert(`Event "${eventName}" subscription failed`, `${error.message}`);
    }
}




async function check_Invalid_Id(id) {
    return await polyUSDOracle.methods.ignoreRequestIds(id).call();
}


async function alert(message, custom) {
    return await send_alert_mail(message, custom);
}


process.on('unhandledRejection', async(reason, promise) => {
    logger.error(`Unhandled Rejection at: ${reason.stack}`);
    await alert("Unhandeled error introduce", `${reason.stack}`);
});


setup();






