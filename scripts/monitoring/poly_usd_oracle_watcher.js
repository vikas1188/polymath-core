import { duration } from '../../test/helpers/utils';

let Web3 = require('web3');
let read = require('read-yaml');
const chalk = require('chalk');
let config = read.sync('scripts/monitoring/config.yml');
let polyUsdOracleABI;
let polyUSDOracle;
let web3;
let fromBlock = 0;
let lastUpdate;
let lastPrice;

let ValidRequestIds = new Array();
let queryData = new Array();
let selected_network = process.argv.slice(2)[0];

try {
    polyUsdOracleABI = JSON.parse(require('fs').readFileSync('./build/contracts/MockPolyOracle.json').toString()).abi;
} catch(error) {
    console.log(chalk.red(` Unable to read the contract ABI or application doesn't have the build folder`));
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


// contract Instance
function setup(){
    try {
        polyUSDOracle = new web3.eth.Contract(polyUsdOracleABI, config.properties[`${selected_network}`].contract_address);
        polyUSDOracle.setProvider(web3.currentProvider);
    }catch(err){
      console.log(err)
      console.log('\x1b[31m%s\x1b[0m',"There was a problem getting the contracts. Make sure they are deployed to the selected network.");
      return;
    }

    console.log(`Everything set-up well`);
    eventWatcher();
}


setup();

async function subscribe(eventName, filter) {
    try {
        await polyUSDOracle.events[`${eventName}`]({
            filter:filter,
            fromBlock:fromBlock
        }, function(error, event) {
        })
        .on('data', function(event){
            console.log(event); // same results as the optional callback above
            let eventData = {};
            eventData.timestamp = event.returnValues._time;
            eventData.queryId = event.returnValues._queryId;
            eventData.query = event.returnValues._query;
            ValidRequestIds.push(eventData);
            fromBlock = event.blockNumber;
        })
        .on('changed', function(event){
            // remove event from local database
        })
        .on('error', console.error);
    } catch(error) {
        console.error(`Event "${eventName}" subscription failed`, e)
        return false
    }
}


async function eventWatcher() {
    await subscribe("LogNewOraclizeQuery", {});
}


async function watchPriceUpdate(eventName, filter) {
    try {
        await polyUSDOracle.events[`${eventName}`]({
            filter:filter,
            fromBlock:fromBlock
        }, function(error, event) {
            if(error)
                console.error(error);
        })
        .on('data', async(event)=> {
            let currentTime = event.returnValues._time;
            if (await check_Invalid_Id(event.returnValues._queryId)) {
                console.log(`Next call for the timestamp: ${ValidRequestIds[0].timestamp}`);
                let value = ValidRequestIds[0].timestamp;
                if ( ValidRequestIds[0].timestamp <= currentTime + duration.minutes(5) || ValidRequestIds[0].timestamp >= currentTime + duration.minutes(5)) {
                    ValidRequestIds = ValidRequestIds.filter(item => item.timestamp != value);
                } else {
                    alert("");
                }
            } else {
                alert("");
            }
            
        })
        .on('changed', function(event){
            // remove event from local database
        })
        .on('error', console.error);
    } catch(error) {
        console.error(`Event "${eventName}" subscription failed`, e)
        return false
    }
}


async function check_scheduled_call() {
    let _priceAndTime = await polyUSDOracle.methods.getPriceAndTime().call();
    if (_priceAndTime[1] >= lastUpdate + duration.hours(config.properties[`${selected_network}`].threshold_time)) {
        lastUpdate = _priceAndTime[1];
        lastPrice = _priceAndTime[0];
    } else {
        alert("");
    }
}



async function check_Invalid_Id(id) {
    return await polyUSDOracle.methods.ignoreRequestIds(id).call();
}


async function alert(message) {
    // Put the AWS settings of SES here
}








