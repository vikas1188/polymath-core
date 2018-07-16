const DevPolyToken = artifacts.require('./helpers/PolyTokenFaucet.sol')
const MockPolyOracle = artifacts.require('./mocks/MockPolyOracle.sol');
let PolymathAccount;
const Web3 = require('web3')
web3 = new Web3(new Web3.providers.HttpProvider('http://localhost:8545'))

module.exports = function (deployer, network, accounts) {

  if (network === 'development') {
    web3 = new Web3(new Web3.providers.HttpProvider('http://localhost:8545'))
    PolymathAccount = accounts[0]
  } 


  return deployer.deploy(DevPolyToken, {from: PolymathAccount})
  .then(() => {
  return deployer.deploy(MockPolyOracle, { from: PolymathAccount })
  .then(() => {
      console.log(`*** MockPolyOracle Address: ${MockPolyOracle.address} ***`);
    })
  })

}