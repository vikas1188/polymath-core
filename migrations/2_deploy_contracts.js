const CappedSTO = artifacts.require('./CappedSTO.sol')

const Web3 = require('web3')

module.exports = function (deployer, network, accounts) {
  // Ethereum account address hold by the Polymath (Act as the main account which have ownable permissions)
  let PolymathAccount;
  if (network === 'kovan') {
    web3 = new Web3(new Web3.providers.HttpProvider('https://kovan.infura.io/g5xfoQ0jFSE9S5LwM1Ei'))
  } else if (network === 'mainnet') {
    web3 = new Web3(new Web3.providers.HttpProvider('https://mainnet.infura.io/g5xfoQ0jFSE9S5LwM1Ei'))
  }
  
  PolymathAccount = accounts[0];

  // POLYMATH NETWORK Configuration :: DO THIS ONLY ONCE
  // A) Deploy the PolymathRegistry contract
  return deployer.deploy(CappedSTO, PolymathAccount, PolymathAccount, {from: PolymathAccount}).then(() => {
    return CappedSTO.deployed();
  }).then(() => {
    console.log('\n');
    console.log(`
    ----------------------- Polymath Network Smart Contracts: -----------------------
    CappedSTO:                     ${CappedSTO.address}
    ---------------------------------------------------------------------------------
    `);
    console.log('\n');
  });
}