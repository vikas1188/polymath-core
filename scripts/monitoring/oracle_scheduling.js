let Web3 = require('web3');
let read = require('read-yaml');
const chalk = require('chalk');
let config = read.sync('scripts/monitoring/config.yml');

import { duration } from '../../test/helpers/utils';

let polyUsdOracleABI;
let polyUSDOracle, owner;

// set the provider you want from Web3.providers
const web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:8545"));

try {
    polyUsdOracleABI = JSON.parse(require('fs').readFileSync('./build/contracts/MockPolyOracle.json').toString()).abi;
} catch(error) {
    console.log(chalk.red(` Unable to read the contract ABI or application doesn't have the build folder`));
}

async function setup() {
    try {
        polyUSDOracle = new web3.eth.Contract(polyUsdOracleABI, config.properties.ganache.contract_address);
        polyUSDOracle.setProvider(web3.currentProvider);
    }catch(err){
      console.log(err)
      console.log('\x1b[31m%s\x1b[0m',"There was a problem getting the contracts. Make sure they are deployed to the selected network.");
      return;
    }

    let accounts = await web3.eth.getAccounts();
    owner = accounts[0];

    console.log(`Everything set-up well`);
    scheduling();
}

setup();

async function scheduling() {
    let timeScheduling = [Math.floor(Date.now()/1000)+ duration.minutes(1), Math.floor(Date.now()/1000)+ duration.minutes(2), Math.floor(Date.now()/1000)+ duration.minutes(3)];
    await polyUSDOracle.methods.schedulePriceUpdatesFixed(timeScheduling).send({from: owner, gas:5000000, value: web3.utils.toWei("1.5")});
}





/////////////////////
/// Helper Functions
/////////////////////



