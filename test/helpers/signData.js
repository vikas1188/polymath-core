const ethers = require("ethers");
const utils = ethers.utils;
const ethUtil = require("ethereumjs-util");
const Web3 = require("web3");
let BN = Web3.utils.BN;

//this, _investor, _fromTime, _toTime, _validTo
function signData(tmAddress, investorAddress, fromTime, toTime, expiryTime, restricted, validFrom, validTo, nonce, pk) {
    let packedData = utils
        .solidityKeccak256(
            ["address", "address", "uint256", "uint256", "uint256", "bool", "uint256", "uint256", "uint256"],
            [tmAddress, investorAddress, fromTime, toTime, expiryTime, restricted, validFrom, validTo, nonce]
        )
        .slice(2);
    packedData = new Buffer(packedData, "hex");
    packedData = Buffer.concat([new Buffer(`\x19Ethereum Signed Message:\n${packedData.length.toString()}`), packedData]);
    packedData = web3.utils.sha3(`0x${packedData.toString("hex")}`, { encoding: "hex" });
    return ethUtil.ecsign(new Buffer(packedData.slice(2), "hex"), new Buffer(pk, "hex"));
}

// sign data for verify tranfer function
function signDataVerifyTransfer (tmAddress, fromAddress, toAddress, amount, account) {

    console.log("1");
    let packedData = utils
        .solidityKeccak256(
            ["address", "address", "address", "uint256"],
            [tmAddress, fromAddress, toAddress, amount]
        )
        .slice(2);

    console.log("2");
    packedData = new Buffer(packedData, "hex");
    console.log("3");
    packedData = Buffer.concat([new Buffer(`\x19Ethereum Signed Message:\n${packedData.length.toString()}`), packedData]);
    console.log("4");
    packedData = web3.utils.sha3(`0x${packedData.toString("hex")}`, { encoding: "hex" });

    console.log("5 " + account);
    console.log("data is " + packedData);
    // return web3.eth.sign(account,packedData);
    return web3.eth.sign(packedData, account, function (err, result) { console.log(err, result); });
}

module.exports = {
    signData, signDataVerifyTransfer
};
