const actualOwner = "0x00e13f97e1980126cbe90F21B9C1b853878031Dd"; //Replace this
const CountTransferManagerFactory = artifacts.require("./CountTransferManagerFactory.sol");
const LockUpTransferManagerFactory = artifacts.require('./LockUpTransferManagerFactory.sol');
const BlacklistTransferManagerFactory = artifacts.require('./BlacklistTransferManagerFactory.sol');
const polymathRegistry = "0xdfabf3e4793cd30affb47ab6fa4cf4eef26bbc27";
const CountTransferManagerLogic = "0xefe0078e83cfbd370234f4bd44cba5d64e2ffd5c";
const BlacklistTransferManagerLogic = "0x69ef8253d25dac109111b8a0461b023f81105652";
const LockUpTransferManagerLogic = "0x99630c1ca698b0b8da9fbbc9e467d620b13d2550";
let ctm;
let btm;
let ltm;
let unusedAddresses = [];

contract("Deploying remaining contracts", async (accounts) => {
    describe("and also transfering ownership", async () => {
        it("Deploying CountTransferManagerFactory", async () => {
            ctm = await CountTransferManagerFactory.new(0, CountTransferManagerLogic, polymathRegistry, true, {
                gas: 6000000
            });
            console.log("CountTransferManagerFactory", ctm.address);
        });
        it("Deploying BlacklistTransferManagerFactory", async () => {
            btm = await BlacklistTransferManagerFactory.new(0, BlacklistTransferManagerLogic, polymathRegistry, true, {
                gas: 6000000
            });
            console.log("BlacklistTransferManagerFactory", btm.address);
        });
        it("Deploying LockUpTransferManagerFactory", async () => {
            ltm = await LockUpTransferManagerFactory.new(0, LockUpTransferManagerLogic, polymathRegistry, true, {
                gas: 6000000
            });
            console.log("LockUpTransferManagerFactory", ltm.address);
        });
        it("Transferring ownerships of newly deployed contracts", async () => {
            ctm.transferOwnership(actualOwner, { gas: 1500000 });
            btm.transferOwnership(actualOwner, { gas: 1500000 });
            ltm.transferOwnership(actualOwner, { gas: 1500000 });
            console.log("New contract deployment and transfer ownership completed successfully");
        });
    });
});
