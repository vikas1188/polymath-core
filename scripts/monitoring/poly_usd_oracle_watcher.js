let Web3 = require('web3');
let read = require('read-yaml');
let config = read.sync('./config.yml');
let polyUsdOracleABI;
let polyUSDOracle;

let selected_network = config.choosen-net;

try {
    polyUsdOracleABI = JSON.parse(require('fs').readFileSync("../../build/contracts/MockPolyOracle.json").toString()).abi;
} catch(error) {
    console.log(` Unable to read the contract ABI or application doesn't have the build folder`.red);
}

if (typeof web3 !== 'undefined') {
    web3 = new Web3(web3.currentProvider);
  } else {
    // set the provider you want from Web3.providers
    web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:8545"));
}

// contract Instance

function setup(){
    try {
        polyUSDOracle = new web3.eth.Contract(polyUsdOracleABI, config.properties.selected_network.contract-address);
        polyUSDOracle.setProvider(web3.currentProvider);
    }catch(err){
      console.log(err)
      console.log('\x1b[31m%s\x1b[0m',"There was a problem getting the contracts. Make sure they are deployed to the selected network.");
      return;
    }
}


setup();

async function watcher() {

    await polyUSDOracle.methods.event('LogPriceUpdated', {
        fromBlock:
        toBlock:
    }, function(error, event) {

    })
    .on('data', function(event) {

    })
    .on('changed', function(event){
        // remove event from local database
    })
    .on('error', console.error);
}




