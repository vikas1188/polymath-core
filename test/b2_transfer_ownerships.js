const actualOwner = "0xa22d152d855d80f4d88e5e483c30b87161019d3a";
const cont = artifacts.require("./Ownable.sol");
let addresses = [
    // "0x59c4b5907207e9bf50f9ad5738874e7fb15b25b5",
    // "0xeb4c8c9d71cbe60ca0e688e4e70c5ab22abb72a4",
    // "0x550fc7d520f596bfdf75dca4d9f5f3c0c6020212",
    // "0x7c64e9cfc397db2da3213a172d783f1b9c30d7ef",
    // "0x80ae6e1b6dc661d21ee1680bd5ff919f0400f17d",
    // "0x5fafcfc0afd80d2f95133170172b045024ca8fd1",
    // "0x5732ee7ef44dc5ab7b7cbac8ada5268c96895ca5",
    // "0x156389b30ae9e5ca8ec9e55ff529738480e42214",
    // "0x02d5fc70e37249adec988a9c4ac5fb5a833b0cca",
    // "0x4428b48df87f69867b90b53c9aa0b08105413ee6",
    // "0xc8015b63667a3ea098da25cb09f6a762cdec9da6",
    // "0x3e600da7559eaac823207289fd7cdfca290be5f5",
    "0x638c7c3984f7bbbfd0621751b4c93d26343da3c5",
    "0x7bEf7515bd5E590e622F273482a0c5bbC7543088",
    "0xD9d396e57C707aDFA719B937bd5Ae8107B05B7Af",
    "0xA8e0a4E7f0cdECF43AFbA0360B6f64412Df2e6B0"
];
let unusedAddresses = [];

contract("Transferring ownerships of old contracts", async (accounts) => {
    describe("Please hold on", async () => {
        it("It shouldn't take long", async () => {
            for(let i = 0; i < addresses.length; i++) {
                let instance = await cont.at(addresses[i]);
                try {
                    // let data = await instance.owner();
                    // console.log(data, addresses[i]);
                    instance.transferOwnership(actualOwner, { gas: 1500000 });
                } catch (e) {
                    unusedAddresses.push("Errored addresses (Empty array means no error): ", addresses[i]);
                }
            }
            console.log("Transactions are being mined now. You may exit the script now. Keep an eye on etherscan for confirmations.");
        });
    });
});
