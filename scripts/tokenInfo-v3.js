const ethers = require('ethers');
// let provider = new ethers.providers.JsonRpcProvider();
let provider = new ethers.providers.InfuraProvider('mainnet');
const address = "0xF85a96dc203347ACB01680e1eE03461dA7FD3c06";
let abi = '[{"constant":true,"inputs":[{"name":"_token","type":"address"},{"name":"_checkpointId","type":"uint256"}],"name":"getCheckpoint","outputs":[{"components":[{"name":"checkpointId","type":"uint256"},{"name":"investors","type":"address[]"},{"name":"balances","type":"uint256[]"},{"name":"totalSupply","type":"uint256"},{"name":"time","type":"uint256"}],"name":"","type":"tuple"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"name":"_token","type":"address"},{"name":"_module","type":"address"}],"name":"getModule","outputs":[{"components":[{"name":"name","type":"bytes32"},{"name":"module","type":"address"},{"name":"moduleFactory","type":"address"},{"name":"isArchived","type":"bool"},{"name":"moduleTypes","type":"uint8[]"}],"name":"","type":"tuple"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"name":"_token","type":"address"}],"name":"getToken","outputs":[{"components":[{"name":"token","type":"address"},{"name":"owner","type":"address"},{"name":"investors","type":"address[]"},{"name":"balances","type":"uint256[]"},{"name":"numInvestors","type":"uint256"},{"name":"totalSupply","type":"uint256"},{"components":[{"name":"name","type":"bytes32"},{"name":"module","type":"address"},{"name":"moduleFactory","type":"address"},{"name":"isArchived","type":"bool"},{"name":"moduleTypes","type":"uint8[]"}],"name":"modules","type":"tuple[]"},{"components":[{"name":"checkpointId","type":"uint256"},{"name":"investors","type":"address[]"},{"name":"balances","type":"uint256[]"},{"name":"totalSupply","type":"uint256"},{"name":"time","type":"uint256"}],"name":"checkpoints","type":"tuple[]"}],"name":"t","type":"tuple"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"name":"_tokens","type":"address[]"}],"name":"getTokens","outputs":[{"components":[{"name":"token","type":"address"},{"name":"owner","type":"address"},{"name":"investors","type":"address[]"},{"name":"balances","type":"uint256[]"},{"name":"numInvestors","type":"uint256"},{"name":"totalSupply","type":"uint256"},{"components":[{"name":"name","type":"bytes32"},{"name":"module","type":"address"},{"name":"moduleFactory","type":"address"},{"name":"isArchived","type":"bool"},{"name":"moduleTypes","type":"uint8[]"}],"name":"modules","type":"tuple[]"},{"components":[{"name":"checkpointId","type":"uint256"},{"name":"investors","type":"address[]"},{"name":"balances","type":"uint256[]"},{"name":"totalSupply","type":"uint256"},{"name":"time","type":"uint256"}],"name":"checkpoints","type":"tuple[]"}],"name":"tokens","type":"tuple[]"}],"payable":false,"stateMutability":"view","type":"function"}]';
let contract = new ethers.Contract(address, abi, provider);
let tokens = ["0x34ca1fce2b676d483f6c498c4669be078f853b65","0x2739d364c690547b2f2a98d072f388a8920876ac","0x13d74fc501cc63f94cc8778bdf4686222e324eaa","0xf842e50c1c8823b993ccabbd89c43342497dd308","0x890a29aaf5698dd27dd43ae87082dedb06cd87c4","0xfedfe985ce3fb5b6d065966bec25b70a9380c97d","0x946546ef7d6adca5239e12da9f5b32a4a4f973b7","0x2bc5ad80b9ff6308af27bfd826654bee02dcbf95","0x946546ef7d6adca5239e12da9f5b32a4a4f973b7","0xb9864a507040d0aa0d5d7eb892aab759df935a7f","0x87513cf9af5c4bc86b31ec39ab179f25d54802b7","0xa7a44ad31f75f75a70f7822a9270f6fc8b1e0ba2","0xcdd8ad93d9e33fd876dce674c45d64ac5332c7d6","0x744bd57fb129a517ddf501fd6117f3121c1228ce","0x4e8964047bc37bcbbbb532f4aa468499c4ff039d","0x073de7607903e5eec5181e88d655fa50c797344b","0x6368c00f01988cbe01ca81ae51cb1db64deb1e6b","0xaa876ecc990a79b8fa6d896c78977d4a1f0b6998","0xe1c2fbf0a65c2262452b0ecd5a1783680f99f32d","0xfbf8e2727dc3d986069c19b13d41e34d3601a0b8","0xcb9f71f32300f15e771555fafd30e25e239959e0","0x0f133cc70162f6eb373b3b3cc2bd2932bf8e2ade","0xc94aa079c114d02c484dd55256d854d71feeca70","0xa19bbef64eff0d060a653e4df10a57b6d8006d3e","0x8565feeb18eec43d7a706d8061326e3084a1e8de","0x21746ad0eb4a872bc88cd96a64b5c2882a819c0f","0xb1e71c54bd7e2f0e2e96a0efa1c78a9f6f1298af","0x8818df555f8287d11e535555cd070a672110a13a","0x5c6e88b41bd8b18443a672ecc64cb339f577e82c","0x1ae4167599f37d8b60e3272ec80df948ad1e1874","0x826af12508fcbcde2cf3c8836e6b536f224af62b","0x93b49f162789ba97e725e1c58508bcb1a80aaf85","0xc5bfe5e7e90750cd61390369734adba76a438701","0x82ab77961103b28384a44f1f169f69ac177b80cd","0x2b78d40730af10092084512f11218d6148e37e66","0x03a1cd0476a710810f5c0bf40f6468bf72065e79","0xa0fbe094d9dfee63ba897397bd1288f51a265d1b","0x3720a9aea826bd16b4148d1c57f2ef65e19d65f1","0x687215e8a4ad864b2d4cc2097bceef82e3cdbc8f","0x916c94557efe51452ec2d59b14e09dee301b9f62","0x27305874d87ef2dd3cde3750dd55b882a2c22b92","0x20b8302e6fa0abe046873de13621864a0369fc80","0x1c66252a18f6bcb42c497799a734df83637e0e49","0x523662a19de758e13589bb01c85736a26bb73bd1","0xde42136a72bd747fe8f81b7745d351dd6036a3fe","0xdde7f52d7ef6753c73a8f8bc62b6d16e94d8fb91","0x7310d00023109032c7958c0d78f9432c31cab5f2","0x17099226dfb3acba3817d1408755e2aefbdb45ea","0x0b5b98b07f7967e458339f8b42c8ad0ee099b5c9","0xc03e71af4c4e5b8cfa7b38270efb55f5027ad075","0x083bcb6fa4199fb26728c0f51236532141e00c75","0x28f02eff31e057c09af893ff1e9d44d36a76fb82","0xa26247958a7fde72f5b1d8e97c94b9b9f79a0eef","0xb2ffb80c0ffe350e6ffcbff196975c382fbfe3c2","0x27531732d072b796cf002a0c57b19df60788170f","0x8ac6f49fc95b9dbd195f57737560e3144ec0f8f8","0x312da12c455db69e862cf58f4a7141e0cf5714cb","0x1326df76bb578a8426f0560c896651037e4ce1f2","0xcf5b6b12a97dc4111663eea9d66e552812943b88","0x0d7f0fa3a79bfedbab291da357958596c74e27d7","0xed9b63d184a36150f2ea1293ab7fd05877a7009d","0x7c22661be85d2201636e55d6a230efa79b6198bc","0x9d07a09d7a41d3f731091ff69719b1b2e608c421","0xe678b4fedb6e677863c5a30f1b00dbc86ae92da4","0xa66f485b542bfd4df04d51565492605fbaac01b0","0xb2f16515c9e7abb1ed46c717eda6c855494cfc5f","0xb72cf29cf23a477f50d3c4f93a7e56df3058386e","0x7196114117c14c398258ad536480d0f40a8969e0","0x20c187414fa2e2212aad227223fe323499ed70ff","0xa7c802c6eb806365d815873daf328969a2fe7984","0x8f276d5a98ccdf76154f56493a8ee79ca8bc7a91","0xe9fd84b6a1ff3ec02ca78a4cfbca8048693516e7","0xf3e0b9368993640287eeed970945fdf57da53ed1","0xa174a90cd6112f261187498dea56024c47397c7e","0x3bd5216d0c9ec5d8617e9cba8384cf9efd1bf35a","0x06b3ef69de6e4669782db564d7e013f301e199c0","0xcda1b8368e861bea7a751d079c4b34e6c009e830"];
contract.getTokens(tokens).then((data) => {
  console.log("Returned: " + data.length + " tokens");
  for (let i = 0; i < data.length; i++) {
    console.log("Token: " + i);
    console.log(data[i]);
  }
});

// Uses the below Solidity code:
// contract TokenInfo {
//
//     struct Module {
//         bytes32 name;
//         address module;
//         address moduleFactory;
//         bool isArchived;
//         uint8[] moduleTypes;
//     }
//
//     struct Checkpoint {
//         uint256 checkpointId;
//         address[] investors;
//         uint256[] balances;
//         uint256 totalSupply;
//         uint256 time;
//     }
//
//     struct Token {
//         address token;
//         address owner;
//         address[] investors;
//         uint256[] balances;
//         uint256 numInvestors;
//         uint256 totalSupply;
//         Module[] modules;
//         Checkpoint[] checkpoints;
//     }
//
//     function getTokens(address[] _tokens) public view returns (Token[] memory tokens) {
//         tokens = new Token[](_tokens.length);
//         for (uint256 i = 0; i < _tokens.length; i++) {
//             tokens[i] = getToken(_tokens[i]);
//         }
//     }
//
//     function getToken(address _token) public view returns (Token memory t) {
//
//         // Token memory t;
//         t.token = _token;
//         t.owner = IOwnable(_token).owner();
//         ISecurityToken st = ISecurityToken(_token);
//         t.investors = st.getInvestors();
//         t.totalSupply = st.totalSupply();
//         t.numInvestors = st.getInvestorCount();
//         t.balances = new uint256[](t.investors.length);
//         uint256 ii;
//         for (ii = 0; ii < t.investors.length; ii++) {
//             t.balances[ii] = st.balanceOf(t.investors[ii]);
//         }
//
//         //Get Modules
//         address[] memory modules;
//         uint256 counter = 0;
//         uint8 i;
//         uint256 j;
//         for (i = 1; i < 6; i++) {
//             modules = st.getModulesByType(i);
//             for (j = 0; j < modules.length; j++) {
//                 counter = counter + modules.length;
//             }
//         }
//         t.modules = new Module[](counter);
//         counter = 0;
//         for (i = 1; i < 6; i++) {
//             modules = st.getModulesByType(i);
//             for (j = 0; j < modules.length; j++) {
//                 t.modules[counter] = (getModule(_token, modules[j]));
//                 counter++;
//             }
//         }
//
//         //Get Checkpoints
//         t.checkpoints = new Checkpoint[](st.currentCheckpointId());
//         for (i = 0; i < st.currentCheckpointId(); i++) {
//             t.checkpoints[i] = getCheckpoint(_token, i);
//         }
//         return t;
//     }
//
//     function getCheckpoint(address _token, uint256 _checkpointId) public view returns (Checkpoint memory) {
//         ISecurityToken st = ISecurityToken(_token);
//         uint256[] memory times = st.getCheckpointTimes();
//         Checkpoint memory c;
//         c.checkpointId = _checkpointId;
//         c.investors = st.getInvestorsAt(_checkpointId);
//         c.balances = new uint256[](c.investors.length);
//         for (uint256 i = 0; i < c.investors.length; i++) {
//             c.balances[i] = st.balanceOfAt(c.investors[i], _checkpointId);
//         }
//         c.totalSupply = st.totalSupplyAt(_checkpointId);
//         c.time = times[_checkpointId];
//         return c;
//     }
//
//     function getModule(address _token, address _module) public view returns (Module memory) {
//         ISecurityToken st = ISecurityToken(_token);
//         (bytes32 name, address module, address moduleFactory, bool isArchived , uint8[] memory moduleTypes) = st.getModule(_module);
//         Module memory m;
//         m.name = name;
//         m.module = module;
//         m.moduleFactory = moduleFactory;
//         m.isArchived = isArchived;
//         m.moduleTypes = moduleTypes;
//         return m;
//     }
//
// }
