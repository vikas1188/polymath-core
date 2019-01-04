pragma solidity ^0.4.24;

import "openzeppelin-solidity/contracts/math/Math.sol";
import "../interfaces/IERC20.sol";
import "../interfaces/IModule.sol";
import "../interfaces/IModuleFactory.sol";
import "../interfaces/IModuleRegistry.sol";
import "../interfaces/IFeatureRegistry.sol";
import "../modules/TransferManager/ITransferManager.sol";
import "../RegistryUpdater.sol";
import "../libraries/Util.sol";
import "openzeppelin-solidity/contracts/ReentrancyGuard.sol";
import "openzeppelin-solidity/contracts/token/ERC20/StandardToken.sol";
import "openzeppelin-solidity/contracts/token/ERC20/DetailedERC20.sol";
import "../libraries/TokenLib.sol";

/**
* @title Security Token contract
* @notice SecurityToken is an ERC20 token with added capabilities:
* @notice - Implements the ST-20 Interface
* @notice - Transfers are restricted
* @notice - Modules can be attached to it to control its behaviour
* @notice - ST should not be deployed directly, but rather the SecurityTokenRegistry should be used
* @notice - ST does not inherit from ISecurityToken due to:
* @notice - https://github.com/ethereum/solidity/issues/4847
*/
contract SecurityToken is StandardToken, DetailedERC20, ReentrancyGuard, RegistryUpdater {event __CoverageSecurityToken(string fileName, uint256 lineNumber);
event __FunctionCoverageSecurityToken(string fileName, uint256 fnId);
event __StatementCoverageSecurityToken(string fileName, uint256 statementId);
event __BranchCoverageSecurityToken(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageSecurityToken(string fileName, uint256 branchId);
event __AssertPostCoverageSecurityToken(string fileName, uint256 branchId);

    using SafeMath for uint256;

    TokenLib.InvestorDataStorage investorData;

    // Used to hold the semantic version data
    struct SemanticVersion {
        uint8 major;
        uint8 minor;
        uint8 patch;
    }

    SemanticVersion securityTokenVersion;

    // off-chain data
    string public tokenDetails;

    uint8 constant PERMISSION_KEY = 1;
    uint8 constant TRANSFER_KEY = 2;
    uint8 constant MINT_KEY = 3;
    uint8 constant CHECKPOINT_KEY = 4;
    uint8 constant BURN_KEY = 5;

    uint256 public granularity;

    // Value of current checkpoint
    uint256 public currentCheckpointId;

    // Used to temporarily halt all transactions
    bool public transfersFrozen;

    // Used to permanently halt all minting
    bool public mintingFrozen;

    // Used to permanently halt controller actions
    bool public controllerDisabled;

    // Address whitelisted by issuer as controller
    address public controller;

    // Records added modules - module list should be order agnostic!
    mapping (uint8 => address[]) modules;

    // Records information about the module
    mapping (address => TokenLib.ModuleData) modulesToData;

    // Records added module names - module list should be order agnostic!
    mapping (bytes32 => address[]) names;

    // Map each investor to a series of checkpoints
    mapping (address => TokenLib.Checkpoint[]) checkpointBalances;

    // List of checkpoints that relate to total supply
    TokenLib.Checkpoint[] checkpointTotalSupply;

    // Times at which each checkpoint was created
    uint256[] checkpointTimes;

    // Emit at the time when module get added
    event ModuleAdded(
        uint8[] _types,
        bytes32 _name,
        address _moduleFactory,
        address _module,
        uint256 _moduleCost,
        uint256 _budget,
        uint256 _timestamp
    );

    // Emit when the token details get updated
    event UpdateTokenDetails(string _oldDetails, string _newDetails);
    // Emit when the granularity get changed
    event GranularityChanged(uint256 _oldGranularity, uint256 _newGranularity);
    // Emit when Module get archived from the securityToken
    event ModuleArchived(uint8[] _types, address _module, uint256 _timestamp);
    // Emit when Module get unarchived from the securityToken
    event ModuleUnarchived(uint8[] _types, address _module, uint256 _timestamp);
    // Emit when Module get removed from the securityToken
    event ModuleRemoved(uint8[] _types, address _module, uint256 _timestamp);
    // Emit when the budget allocated to a module is changed
    event ModuleBudgetChanged(uint8[] _moduleTypes, address _module, uint256 _oldBudget, uint256 _budget);
    // Emit when transfers are frozen or unfrozen
    event FreezeTransfers(bool _status, uint256 _timestamp);
    // Emit when new checkpoint created
    event CheckpointCreated(uint256 indexed _checkpointId, uint256 _timestamp);
    // Emit when is permanently frozen by the issuer
    event FreezeMinting(uint256 _timestamp);
    // Events to log minting and burning
    event Minted(address indexed _to, uint256 _value);
    event Burnt(address indexed _from, uint256 _value);

    // Events to log controller actions
    event SetController(address indexed _oldController, address indexed _newController);
    event ForceTransfer(
        address indexed _controller,
        address indexed _from,
        address indexed _to,
        uint256 _value,
        bool _verifyTransfer,
        bytes _data
    );
    event ForceBurn(
        address indexed _controller,
        address indexed _from,
        uint256 _value,
        bool _verifyTransfer,
        bytes _data
    );
    event DisableController(uint256 _timestamp);

    function _isModule(address _module, uint8 _type) internal  returns (bool) {emit __FunctionCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',1);

emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',138);
        emit __AssertPreCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',1);
emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',1);
require(modulesToData[_module].module == _module, "Wrong address");emit __AssertPostCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',1);

emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',139);
        emit __AssertPreCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',2);
emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',2);
require(!modulesToData[_module].isArchived, "Module archived");emit __AssertPostCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',2);

emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',140);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',3);
for (uint256 i = 0; i < modulesToData[_module].moduleTypes.length; i++) {
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',141);
            emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',4);
if (modulesToData[_module].moduleTypes[i] == _type) {emit __BranchCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',3,0);
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',142);
                emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',5);
return true;
            }else { emit __BranchCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',3,1);}

        }
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',145);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',6);
return false;
    }

    // Require msg.sender to be the specified module type
    modifier onlyModule(uint8 _type) {emit __FunctionCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',2);

emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',150);
        emit __AssertPreCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',4);
emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',7);
require(_isModule(msg.sender, _type));emit __AssertPostCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',4);

emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',151);
        _;
    }

    // Require msg.sender to be the specified module type or the owner of the token
    modifier onlyModuleOrOwner(uint8 _type) {emit __FunctionCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',3);

emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',156);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',8);
if (msg.sender == owner) {emit __BranchCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',5,0);
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',157);
            _;
        } else {emit __BranchCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',5,1);
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',159);
            emit __AssertPreCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',6);
emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',9);
require(_isModule(msg.sender, _type));emit __AssertPostCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',6);

emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',160);
            _;
        }
    }

    modifier checkGranularity(uint256 _value) {emit __FunctionCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',4);

emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',165);
        emit __AssertPreCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',7);
emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',10);
require(_value % granularity == 0, "Invalid granularity");emit __AssertPostCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',7);

emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',166);
        _;
    }

    modifier isMintingAllowed() {emit __FunctionCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',5);

emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',170);
        emit __AssertPreCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',8);
emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',11);
require(!mintingFrozen, "Minting frozen");emit __AssertPostCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',8);

emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',171);
        _;
    }

    modifier isEnabled(string _nameKey) {emit __FunctionCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',6);

emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',175);
        emit __AssertPreCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',9);
emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',12);
require(IFeatureRegistry(featureRegistry).getFeatureStatus(_nameKey));emit __AssertPostCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',9);

emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',176);
        _;
    }

    /**
     * @notice Revert if called by an account which is not a controller
     */
    modifier onlyController() {emit __FunctionCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',7);

emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',183);
        emit __AssertPreCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',10);
emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',13);
require(msg.sender == controller, "Not controller");emit __AssertPostCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',10);

emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',184);
        emit __AssertPreCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',11);
emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',14);
require(!controllerDisabled, "Controller disabled");emit __AssertPostCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',11);

emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',185);
        _;
    }

    /**
     * @notice Constructor
     * @param _name Name of the SecurityToken
     * @param _symbol Symbol of the Token
     * @param _decimals Decimals for the securityToken
     * @param _granularity granular level of the token
     * @param _tokenDetails Details of the token that are stored off-chain
     * @param _polymathRegistry Contract address of the polymath registry
     */
    constructor (
        string _name,
        string _symbol,
        uint8 _decimals,
        uint256 _granularity,
        string _tokenDetails,
        address _polymathRegistry
    )
    public
    DetailedERC20(_name, _symbol, _decimals)
    RegistryUpdater(_polymathRegistry)
    {emit __FunctionCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',8);

        //When it is created, the owner is the STR
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',210);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',15);
updateFromRegistry();
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',211);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',16);
tokenDetails = _tokenDetails;
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',212);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',17);
granularity = _granularity;
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',213);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',18);
securityTokenVersion = SemanticVersion(2,0,0);
    }

    /**
     * @notice Attachs a module to the SecurityToken
     * @dev  E.G.: On deployment (through the STR) ST gets a TransferManager module attached to it
     * @dev to control restrictions on transfers.
     * @param _moduleFactory is the address of the module factory to be added
     * @param _data is data packed into bytes used to further configure the module (See STO usage)
     * @param _maxCost max amount of POLY willing to pay to the module.
     * @param _budget max amount of ongoing POLY willing to assign to the module.
     */
    function addModule(
        address _moduleFactory,
        bytes _data,
        uint256 _maxCost,
        uint256 _budget
    ) external onlyOwner nonReentrant {emit __FunctionCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',9);

        //Check that the module factory exists in the ModuleRegistry - will throw otherwise
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',232);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',19);
IModuleRegistry(moduleRegistry).useModule(_moduleFactory);
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',233);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',20);
IModuleFactory moduleFactory = IModuleFactory(_moduleFactory);
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',234);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',21);
uint8[] memory moduleTypes = moduleFactory.getTypes();
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',235);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',22);
uint256 moduleCost = moduleFactory.getSetupCost();
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',236);
        emit __AssertPreCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',12);
emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',23);
require(moduleCost <= _maxCost, "Invalid cost");emit __AssertPostCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',12);

        //Approve fee for module
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',238);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',24);
ERC20(polyToken).approve(_moduleFactory, moduleCost);
        //Creates instance of module from factory
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',240);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',25);
address module = moduleFactory.deploy(_data);
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',241);
        emit __AssertPreCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',13);
emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',26);
require(modulesToData[module].module == address(0), "Module exists");emit __AssertPostCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',13);

        //Approve ongoing budget
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',243);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',27);
ERC20(polyToken).approve(module, _budget);
        //Add to SecurityToken module map
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',245);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',28);
bytes32 moduleName = moduleFactory.getName();
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',246);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',29);
uint256[] memory moduleIndexes = new uint256[](moduleTypes.length);
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',247);
        uint256 i;
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',248);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',30);
for (i = 0; i < moduleTypes.length; i++) {
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',249);
            emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',31);
moduleIndexes[i] = modules[moduleTypes[i]].length;
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',250);
            modules[moduleTypes[i]].push(module);
        }
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',252);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',32);
modulesToData[module] = TokenLib.ModuleData(
            moduleName, module, _moduleFactory, false, moduleTypes, moduleIndexes, names[moduleName].length
        );
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',255);
        names[moduleName].push(module);
        //Emit log event
        /*solium-disable-next-line security/no-block-members*/
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',258);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',33);
emit ModuleAdded(moduleTypes, moduleName, _moduleFactory, module, moduleCost, _budget, now);
    }

    /**
    * @notice Archives a module attached to the SecurityToken
    * @param _module address of module to archive
    */
    function archiveModule(address _module) external onlyOwner {emit __FunctionCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',10);

emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',266);
        TokenLib.archiveModule(modulesToData[_module], _module);
    }

    /**
    * @notice Unarchives a module attached to the SecurityToken
    * @param _module address of module to unarchive
    */
    function unarchiveModule(address _module) external onlyOwner {emit __FunctionCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',11);

emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',274);
        TokenLib.unarchiveModule(modulesToData[_module], _module);
    }

    /**
    * @notice Removes a module attached to the SecurityToken
    * @param _module address of module to unarchive
    */
    function removeModule(address _module) external onlyOwner {emit __FunctionCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',12);

emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',282);
        emit __AssertPreCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',14);
emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',34);
require(modulesToData[_module].isArchived, "Not archived");emit __AssertPostCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',14);

emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',283);
        emit __AssertPreCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',15);
emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',35);
require(modulesToData[_module].module != address(0), "Module missing");emit __AssertPostCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',15);

        /*solium-disable-next-line security/no-block-members*/
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',285);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',36);
emit ModuleRemoved(modulesToData[_module].moduleTypes, _module, now);
        // Remove from module type list
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',287);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',37);
uint8[] memory moduleTypes = modulesToData[_module].moduleTypes;
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',288);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',38);
for (uint256 i = 0; i < moduleTypes.length; i++) {
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',289);
            emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',39);
_removeModuleWithIndex(moduleTypes[i], modulesToData[_module].moduleIndexes[i]);
            /* modulesToData[_module].moduleType[moduleTypes[i]] = false; */
        }
        // Remove from module names list
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',293);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',40);
uint256 index = modulesToData[_module].nameIndex;
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',294);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',41);
bytes32 name = modulesToData[_module].name;
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',295);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',42);
uint256 length = names[name].length;
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',296);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',43);
names[name][index] = names[name][length - 1];
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',297);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',44);
names[name].length = length - 1;
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',298);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',45);
if ((length - 1) != index) {emit __BranchCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',16,0);
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',299);
            emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',46);
modulesToData[names[name][index]].nameIndex = index;
        }else { emit __BranchCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',16,1);}

        // Remove from modulesToData
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',302);
        delete modulesToData[_module];
    }

    /**
    * @notice Internal - Removes a module attached to the SecurityToken by index
    */
    function _removeModuleWithIndex(uint8 _type, uint256 _index) internal {emit __FunctionCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',13);

emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',309);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',47);
uint256 length = modules[_type].length;
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',310);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',48);
modules[_type][_index] = modules[_type][length - 1];
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',311);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',49);
modules[_type].length = length - 1;

emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',313);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',50);
if ((length - 1) != _index) {emit __BranchCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',17,0);
            //Need to find index of _type in moduleTypes of module we are moving
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',315);
            emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',51);
uint8[] memory newTypes = modulesToData[modules[_type][_index]].moduleTypes;
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',316);
            emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',52);
for (uint256 i = 0; i < newTypes.length; i++) {
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',317);
                emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',53);
if (newTypes[i] == _type) {emit __BranchCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',18,0);
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',318);
                    emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',54);
modulesToData[modules[_type][_index]].moduleIndexes[i] = _index;
                }else { emit __BranchCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',18,1);}

            }
        }else { emit __BranchCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',17,1);}

    }

    /**
     * @notice Returns the data associated to a module
     * @param _module address of the module
     * @return bytes32 name
     * @return address module address
     * @return address module factory address
     * @return bool module archived
     * @return uint8 module type
     */
    function getModule(address _module) external  returns (bytes32, address, address, bool, uint8[]) {emit __FunctionCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',14);

emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',334);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',55);
return (modulesToData[_module].name,
        modulesToData[_module].module,
        modulesToData[_module].moduleFactory,
        modulesToData[_module].isArchived,
        modulesToData[_module].moduleTypes);
    }

    /**
     * @notice Returns a list of modules that match the provided name
     * @param _name name of the module
     * @return address[] list of modules with this name
     */
    function getModulesByName(bytes32 _name) external  returns (address[]) {emit __FunctionCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',15);

emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',347);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',56);
return names[_name];
    }

    /**
     * @notice Returns a list of modules that match the provided module type
     * @param _type type of the module
     * @return address[] list of modules with this type
     */
    function getModulesByType(uint8 _type) external  returns (address[]) {emit __FunctionCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',16);

emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',356);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',57);
return modules[_type];
    }

   /**
    * @notice Allows the owner to withdraw unspent POLY stored by them on the ST or any ERC20 token.
    * @dev Owner can transfer POLY to the ST which will be used to pay for modules that require a POLY fee.
    * @param _tokenContract Address of the ERC20Basic compliance token
    * @param _value amount of POLY to withdraw
    */
    function withdrawERC20(address _tokenContract, uint256 _value) external onlyOwner {emit __FunctionCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',17);

emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',366);
        emit __AssertPreCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',19);
emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',58);
require(_tokenContract != address(0));emit __AssertPostCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',19);

emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',367);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',59);
IERC20 token = IERC20(_tokenContract);
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',368);
        emit __AssertPreCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',20);
emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',60);
require(token.transfer(owner, _value));emit __AssertPostCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',20);

    }

    /**

    * @notice allows owner to increase/decrease POLY approval of one of the modules
    * @param _module module address
    * @param _change change in allowance
    * @param _increase true if budget has to be increased, false if decrease
    */
    function changeModuleBudget(address _module, uint256 _change, bool _increase) external onlyOwner {emit __FunctionCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',18);

emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',379);
        emit __AssertPreCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',21);
emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',61);
require(modulesToData[_module].module != address(0), "Module missing");emit __AssertPostCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',21);

emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',380);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',62);
uint256 currentAllowance = IERC20(polyToken).allowance(address(this), _module);
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',381);
        uint256 newAllowance;
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',382);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',63);
if (_increase) {emit __BranchCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',22,0);
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',383);
            emit __AssertPreCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',23);
emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',64);
require(IERC20(polyToken).increaseApproval(_module, _change), "IncreaseApproval fail");emit __AssertPostCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',23);

emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',384);
            emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',65);
newAllowance = currentAllowance.add(_change);
        } else {emit __BranchCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',22,1);
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',386);
            emit __AssertPreCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',24);
emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',66);
require(IERC20(polyToken).decreaseApproval(_module, _change), "Insufficient allowance");emit __AssertPostCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',24);

emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',387);
            emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',67);
newAllowance = currentAllowance.sub(_change);
        }
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',389);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',68);
emit ModuleBudgetChanged(modulesToData[_module].moduleTypes, _module, currentAllowance, newAllowance);
    }

    /**
     * @notice updates the tokenDetails associated with the token
     * @param _newTokenDetails New token details
     */
    function updateTokenDetails(string _newTokenDetails) external onlyOwner {emit __FunctionCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',19);

emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',397);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',69);
emit UpdateTokenDetails(tokenDetails, _newTokenDetails);
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',398);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',70);
tokenDetails = _newTokenDetails;
    }

    /**
    * @notice Allows owner to change token granularity
    * @param _granularity granularity level of the token
    */
    function changeGranularity(uint256 _granularity) external onlyOwner {emit __FunctionCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',20);

emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',406);
        emit __AssertPreCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',25);
emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',71);
require(_granularity != 0, "Invalid granularity");emit __AssertPostCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',25);

emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',407);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',72);
emit GranularityChanged(granularity, _granularity);
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',408);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',73);
granularity = _granularity;
    }

    /**
    * @notice Keeps track of the number of non-zero token holders
    * @param _from sender of transfer
    * @param _to receiver of transfer
    * @param _value value of transfer
    */
    function _adjustInvestorCount(address _from, address _to, uint256 _value) internal {emit __FunctionCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',21);

emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',418);
        TokenLib.adjustInvestorCount(investorData, _from, _to, _value, balanceOf(_to), balanceOf(_from));
    }

    /**
     * @notice returns an array of investors
     * NB - this length may differ from investorCount as it contains all investors that ever held tokens
     * @return list of addresses
     */
    function getInvestors() external  returns(address[]) {emit __FunctionCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',22);

emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',427);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',74);
return investorData.investors;
    }

    /**
     * @notice returns an array of investors at a given checkpoint
     * NB - this length may differ from investorCount as it contains all investors that ever held tokens
     * @param _checkpointId Checkpoint id at which investor list is to be populated
     * @return list of investors
     */
    function getInvestorsAt(uint256 _checkpointId) external  returns(address[]) {emit __FunctionCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',23);

emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',437);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',75);
uint256 count = 0;
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',438);
        uint256 i;
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',439);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',76);
for (i = 0; i < investorData.investors.length; i++) {
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',440);
            emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',77);
if (balanceOfAt(investorData.investors[i], _checkpointId) > 0) {emit __BranchCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',26,0);
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',441);
                count++;
            }else { emit __BranchCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',26,1);}

        }
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',444);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',78);
address[] memory investors = new address[](count);
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',445);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',79);
count = 0;
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',446);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',80);
for (i = 0; i < investorData.investors.length; i++) {
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',447);
            emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',81);
if (balanceOfAt(investorData.investors[i], _checkpointId) > 0) {emit __BranchCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',27,0);
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',448);
                emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',82);
investors[count] = investorData.investors[i];
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',449);
                count++;
            }else { emit __BranchCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',27,1);}

        }
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',452);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',83);
return investors;
    }

    /**
     * @notice generates subset of investors
     * NB - can be used in batches if investor list is large
     * @param _start Position of investor to start iteration from
     * @param _end Position of investor to stop iteration at
     * @return list of investors
     */
    function iterateInvestors(uint256 _start, uint256 _end) external  returns(address[]) {emit __FunctionCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',24);

emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',463);
        emit __AssertPreCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',28);
emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',84);
require(_end <= investorData.investors.length, "Invalid end");emit __AssertPostCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',28);

emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',464);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',85);
address[] memory investors = new address[](_end.sub(_start));
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',465);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',86);
uint256 index = 0;
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',466);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',87);
for (uint256 i = _start; i < _end; i++) {
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',467);
            emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',88);
investors[index] = investorData.investors[i];
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',468);
            index++;
        }
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',470);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',89);
return investors;
    }

    /**
     * @notice Returns the investor count
     * @return Investor count
     */
    function getInvestorCount() external  returns(uint256) {emit __FunctionCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',25);

emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',478);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',90);
return investorData.investorCount;
    }

    /**
     * @notice freezes transfers
     */
    function freezeTransfers() external onlyOwner {emit __FunctionCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',26);

emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',485);
        emit __AssertPreCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',29);
emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',91);
require(!transfersFrozen, "Already frozen");emit __AssertPostCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',29);

emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',486);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',92);
transfersFrozen = true;
        /*solium-disable-next-line security/no-block-members*/
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',488);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',93);
emit FreezeTransfers(true, now);
    }

    /**
     * @notice Unfreeze transfers
     */
    function unfreezeTransfers() external onlyOwner {emit __FunctionCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',27);

emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',495);
        emit __AssertPreCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',30);
emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',94);
require(transfersFrozen, "Not frozen");emit __AssertPostCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',30);

emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',496);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',95);
transfersFrozen = false;
        /*solium-disable-next-line security/no-block-members*/
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',498);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',96);
emit FreezeTransfers(false, now);
    }

    /**
     * @notice Internal - adjusts totalSupply at checkpoint after minting or burning tokens
     */
    function _adjustTotalSupplyCheckpoints() internal {emit __FunctionCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',28);

emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',505);
        TokenLib.adjustCheckpoints(checkpointTotalSupply, totalSupply(), currentCheckpointId);
    }

    /**
     * @notice Internal - adjusts token holder balance at checkpoint after a token transfer
     * @param _investor address of the token holder affected
     */
    function _adjustBalanceCheckpoints(address _investor) internal {emit __FunctionCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',29);

emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',513);
        TokenLib.adjustCheckpoints(checkpointBalances[_investor], balanceOf(_investor), currentCheckpointId);
    }

    /**
     * @notice Overloaded version of the transfer function
     * @param _to receiver of transfer
     * @param _value value of transfer
     * @return bool success
     */
    function transfer(address _to, uint256 _value) public returns (bool success) {emit __FunctionCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',30);

emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',523);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',97);
return transferWithData(_to, _value, "");
    }

    /**
     * @notice Overloaded version of the transfer function
     * @param _to receiver of transfer
     * @param _value value of transfer
     * @param _data data to indicate validation
     * @return bool success
     */
    function transferWithData(address _to, uint256 _value, bytes _data) public returns (bool success) {emit __FunctionCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',31);

emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',534);
        emit __AssertPreCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',31);
emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',98);
require(_updateTransfer(msg.sender, _to, _value, _data), "Transfer invalid");emit __AssertPostCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',31);

emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',535);
        emit __AssertPreCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',32);
emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',99);
require(super.transfer(_to, _value));emit __AssertPostCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',32);

emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',536);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',100);
return true;
    }

    /**
     * @notice Overloaded version of the transferFrom function
     * @param _from sender of transfer
     * @param _to receiver of transfer
     * @param _value value of transfer
     * @return bool success
     */
    function transferFrom(address _from, address _to, uint256 _value) public returns(bool) {emit __FunctionCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',32);

emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',547);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',101);
return transferFromWithData(_from, _to, _value, "");
    }

    /**
     * @notice Overloaded version of the transferFrom function
     * @param _from sender of transfer
     * @param _to receiver of transfer
     * @param _value value of transfer
     * @param _data data to indicate validation
     * @return bool success
     */
    function transferFromWithData(address _from, address _to, uint256 _value, bytes _data) public returns(bool) {emit __FunctionCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',33);

emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',559);
        emit __AssertPreCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',33);
emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',102);
require(_updateTransfer(_from, _to, _value, _data), "Transfer invalid");emit __AssertPostCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',33);

emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',560);
        emit __AssertPreCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',34);
emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',103);
require(super.transferFrom(_from, _to, _value));emit __AssertPostCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',34);

emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',561);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',104);
return true;
    }

    /**
     * @notice Updates internal variables when performing a transfer
     * @param _from sender of transfer
     * @param _to receiver of transfer
     * @param _value value of transfer
     * @param _data data to indicate validation
     * @return bool success
     */
    function _updateTransfer(address _from, address _to, uint256 _value, bytes _data) internal nonReentrant returns(bool) {emit __FunctionCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',34);

        // NB - the ordering in this function implies the following:
        //  - investor counts are updated before transfer managers are called - i.e. transfer managers will see
        //investor counts including the current transfer.
        //  - checkpoints are updated after the transfer managers are called. This allows TMs to create
        //checkpoints as though they have been created before the current transactions,
        //  - to avoid the situation where a transfer manager transfers tokens, and this function is called recursively,
        //the function is marked as nonReentrant. This means that no TM can transfer (or mint / burn) tokens.
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',580);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',105);
_adjustInvestorCount(_from, _to, _value);
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',581);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',106);
bool verified = _verifyTransfer(_from, _to, _value, _data, true);
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',582);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',107);
_adjustBalanceCheckpoints(_from);
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',583);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',108);
_adjustBalanceCheckpoints(_to);
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',584);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',109);
return verified;
    }

    /**
     * @notice Validate transfer with TransferManager module if it exists
     * @dev TransferManager module has a key of 2
     * @dev _isTransfer boolean flag is the deciding factor for whether the
     * state variables gets modified or not within the different modules. i.e isTransfer = true
     * leads to change in the modules environment otherwise _verifyTransfer() works as a read-only
     * function (no change in the state).
     * @param _from sender of transfer
     * @param _to receiver of transfer
     * @param _value value of transfer
     * @param _data data to indicate validation
     * @param _isTransfer whether transfer is being executed
     * @return bool
     */
    function _verifyTransfer(
        address _from,
        address _to,
        uint256 _value,
        bytes _data,
        bool _isTransfer
    ) internal checkGranularity(_value) returns (bool) {emit __FunctionCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',35);

emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',608);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',110);
if (!transfersFrozen) {emit __BranchCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',35,0);
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',609);
            emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',111);
bool isInvalid = false;
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',610);
            emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',112);
bool isValid = false;
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',611);
            emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',113);
bool isForceValid = false;
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',612);
            emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',114);
bool unarchived = false;
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',613);
            address module;
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',614);
            emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',115);
for (uint256 i = 0; i < modules[TRANSFER_KEY].length; i++) {
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',615);
                emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',116);
module = modules[TRANSFER_KEY][i];
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',616);
                emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',117);
if (!modulesToData[module].isArchived) {emit __BranchCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',36,0);
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',617);
                    emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',118);
unarchived = true;
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',618);
                    emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',119);
ITransferManager.Result valid = ITransferManager(module).verifyTransfer(_from, _to, _value, _data, _isTransfer);
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',619);
                    emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',120);
if (valid == ITransferManager.Result.INVALID) {emit __BranchCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',37,0);
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',620);
                        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',121);
isInvalid = true;
                    } else {emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',122);
emit __BranchCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',37,1);if (valid == ITransferManager.Result.VALID) {emit __BranchCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',38,0);
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',622);
                        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',123);
isValid = true;
                    } else {emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',124);
emit __BranchCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',38,1);if (valid == ITransferManager.Result.FORCE_VALID) {emit __BranchCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',39,0);
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',624);
                        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',125);
isForceValid = true;
                    }else { emit __BranchCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',39,1);}
}}
                }else { emit __BranchCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',36,1);}

            }
            // If no unarchived modules, return true by default
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',629);
            emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',126);
return unarchived ? (isForceValid ? true : (isInvalid ? false : isValid)) : true;
        }else { emit __BranchCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',35,1);}

emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',631);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',127);
return false;
    }

    /**
     * @notice Validates a transfer with a TransferManager module if it exists
     * @dev TransferManager module has a key of 2
     * @param _from sender of transfer
     * @param _to receiver of transfer
     * @param _value value of transfer
     * @param _data data to indicate validation
     * @return bool
     */
    function verifyTransfer(address _from, address _to, uint256 _value, bytes _data) public returns (bool) {emit __FunctionCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',36);

emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',644);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',128);
return _verifyTransfer(_from, _to, _value, _data, false);
    }

    /**
     * @notice Permanently freeze minting of this security token.
     * @dev It MUST NOT be possible to increase `totalSuppy` after this function is called.
     */
    function freezeMinting() external isMintingAllowed() isEnabled("freezeMintingAllowed") onlyOwner {emit __FunctionCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',37);

emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',652);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',129);
mintingFrozen = true;
        /*solium-disable-next-line security/no-block-members*/
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',654);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',130);
emit FreezeMinting(now);
    }

    /**
     * @notice Mints new tokens and assigns them to the target _investor.
     * @dev Can only be called by the issuer or STO attached to the token
     * @param _investor Address where the minted tokens will be delivered
     * @param _value Number of tokens be minted
     * @return success
     */
    function mint(address _investor, uint256 _value) public returns (bool success) {emit __FunctionCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',38);

emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',665);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',131);
return mintWithData(_investor, _value, "");
    }

    /**
     * @notice mints new tokens and assigns them to the target _investor.
     * @dev Can only be called by the issuer or STO attached to the token
     * @param _investor Address where the minted tokens will be delivered
     * @param _value Number of tokens be minted
     * @param _data data to indicate validation
     * @return success
     */
    function mintWithData(
        address _investor,
        uint256 _value,
        bytes _data
        ) public onlyModuleOrOwner(MINT_KEY) isMintingAllowed() returns (bool success) {emit __FunctionCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',39);

emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',681);
        emit __AssertPreCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',40);
emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',132);
require(_investor != address(0), "Investor is 0");emit __AssertPostCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',40);

emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',682);
        emit __AssertPreCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',41);
emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',133);
require(_updateTransfer(address(0), _investor, _value, _data), "Transfer invalid");emit __AssertPostCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',41);

emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',683);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',134);
_adjustTotalSupplyCheckpoints();
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',684);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',135);
totalSupply_ = totalSupply_.add(_value);
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',685);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',136);
balances[_investor] = balances[_investor].add(_value);
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',686);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',137);
emit Minted(_investor, _value);
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',687);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',138);
emit Transfer(address(0), _investor, _value);
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',688);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',139);
return true;
    }

    /**
     * @notice Mints new tokens and assigns them to the target _investor.
     * @dev Can only be called by the issuer or STO attached to the token.
     * @param _investors A list of addresses to whom the minted tokens will be dilivered
     * @param _values A list of number of tokens get minted and transfer to corresponding address of the investor from _investor[] list
     * @return success
     */
    function mintMulti(address[] _investors, uint256[] _values) external returns (bool success) {emit __FunctionCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',40);

emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',699);
        emit __AssertPreCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',42);
emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',140);
require(_investors.length == _values.length, "Incorrect inputs");emit __AssertPostCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',42);

emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',700);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',141);
for (uint256 i = 0; i < _investors.length; i++) {
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',701);
            emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',142);
mint(_investors[i], _values[i]);
        }
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',703);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',143);
return true;
    }

    /**
     * @notice Validate permissions with PermissionManager if it exists, If no Permission return false
     * @dev Note that IModule withPerm will allow ST owner all permissions anyway
     * @dev this allows individual modules to override this logic if needed (to not allow ST owner all permissions)
     * @param _delegate address of delegate
     * @param _module address of PermissionManager module
     * @param _perm the permissions
     * @return success
     */
    function checkPermission(address _delegate, address _module, bytes32 _perm) public  returns(bool) {emit __FunctionCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',41);

emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',716);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',144);
for (uint256 i = 0; i < modules[PERMISSION_KEY].length; i++) {
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',717);
            emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',145);
if (!modulesToData[modules[PERMISSION_KEY][i]].isArchived)
                {emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',146);
emit __BranchCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',43,0);emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',718);
return TokenLib.checkPermission(modules[PERMISSION_KEY], _delegate, _module, _perm);}else { emit __BranchCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',43,1);}

        }
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',720);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',147);
return false;
    }

    function _burn(address _from, uint256 _value, bytes _data) internal returns(bool) {emit __FunctionCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',42);

emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',724);
        emit __AssertPreCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',44);
emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',148);
require(_value <= balances[_from], "Value too high");emit __AssertPostCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',44);

emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',725);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',149);
bool verified = _updateTransfer(_from, address(0), _value, _data);
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',726);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',150);
_adjustTotalSupplyCheckpoints();
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',727);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',151);
balances[_from] = balances[_from].sub(_value);
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',728);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',152);
totalSupply_ = totalSupply_.sub(_value);
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',729);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',153);
emit Burnt(_from, _value);
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',730);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',154);
emit Transfer(_from, address(0), _value);
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',731);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',155);
return verified;
    }

    /**
     * @notice Burn function used to burn the securityToken
     * @param _value No. of tokens that get burned
     * @param _data data to indicate validation
     */
    function burnWithData(uint256 _value, bytes _data) public onlyModule(BURN_KEY) {emit __FunctionCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',43);

emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',740);
        emit __AssertPreCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',45);
emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',156);
require(_burn(msg.sender, _value, _data), "Burn invalid");emit __AssertPostCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',45);

    }

    /**
     * @notice Burn function used to burn the securityToken on behalf of someone else
     * @param _from Address for whom to burn tokens
     * @param _value No. of tokens that get burned
     * @param _data data to indicate validation
     */
    function burnFromWithData(address _from, uint256 _value, bytes _data) public onlyModule(BURN_KEY) {emit __FunctionCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',44);

emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',750);
        emit __AssertPreCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',46);
emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',157);
require(_value <= allowed[_from][msg.sender], "Value too high");emit __AssertPostCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',46);

emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',751);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',158);
allowed[_from][msg.sender] = allowed[_from][msg.sender].sub(_value);
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',752);
        emit __AssertPreCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',47);
emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',159);
require(_burn(_from, _value, _data), "Burn invalid");emit __AssertPostCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',47);

    }

    /**
     * @notice Creates a checkpoint that can be used to query historical balances / totalSuppy
     * @return uint256
     */
    function createCheckpoint() external onlyModuleOrOwner(CHECKPOINT_KEY) returns(uint256) {emit __FunctionCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',45);

emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',760);
        emit __AssertPreCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',48);
emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',160);
require(currentCheckpointId < 2**256 - 1);emit __AssertPostCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',48);

emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',761);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',161);
currentCheckpointId = currentCheckpointId + 1;
        /*solium-disable-next-line security/no-block-members*/
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',763);
        checkpointTimes.push(now);
        /*solium-disable-next-line security/no-block-members*/
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',765);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',162);
emit CheckpointCreated(currentCheckpointId, now);
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',766);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',163);
return currentCheckpointId;
    }

    /**
     * @notice Gets list of times that checkpoints were created
     * @return List of checkpoint times
     */
    function getCheckpointTimes() external  returns(uint256[]) {emit __FunctionCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',46);

emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',774);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',164);
return checkpointTimes;
    }

    /**
     * @notice Queries totalSupply as of a defined checkpoint
     * @param _checkpointId Checkpoint ID to query
     * @return uint256
     */
    function totalSupplyAt(uint256 _checkpointId) external  returns(uint256) {emit __FunctionCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',47);

emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',783);
        emit __AssertPreCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',49);
emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',165);
require(_checkpointId <= currentCheckpointId);emit __AssertPostCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',49);

emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',784);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',166);
return TokenLib.getValueAt(checkpointTotalSupply, _checkpointId, totalSupply());
    }

    /**
     * @notice Queries balances as of a defined checkpoint
     * @param _investor Investor to query balance for
     * @param _checkpointId Checkpoint ID to query as of
     */
    function balanceOfAt(address _investor, uint256 _checkpointId) public  returns(uint256) {emit __FunctionCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',48);

emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',793);
        emit __AssertPreCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',50);
emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',167);
require(_checkpointId <= currentCheckpointId);emit __AssertPostCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',50);

emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',794);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',168);
return TokenLib.getValueAt(checkpointBalances[_investor], _checkpointId, balanceOf(_investor));
    }

    /**
     * @notice Used by the issuer to set the controller addresses
     * @param _controller address of the controller
     */
    function setController(address _controller) public onlyOwner {emit __FunctionCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',49);

emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',802);
        emit __AssertPreCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',51);
emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',169);
require(!controllerDisabled);emit __AssertPostCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',51);

emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',803);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',170);
emit SetController(controller, _controller);
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',804);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',171);
controller = _controller;
    }

    /**
     * @notice Used by the issuer to permanently disable controller functionality
     * @dev enabled via feature switch "disableControllerAllowed"
     */
    function disableController() external isEnabled("disableControllerAllowed") onlyOwner {emit __FunctionCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',50);

emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',812);
        emit __AssertPreCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',52);
emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',172);
require(!controllerDisabled);emit __AssertPostCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',52);

emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',813);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',173);
controllerDisabled = true;
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',814);
        delete controller;
        /*solium-disable-next-line security/no-block-members*/
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',816);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',174);
emit DisableController(now);
    }

    /**
     * @notice Used by a controller to execute a forced transfer
     * @param _from address from which to take tokens
     * @param _to address where to send tokens
     * @param _value amount of tokens to transfer
     * @param _data data to indicate validation
     * @param _log data attached to the transfer by controller to emit in event
     */
    function forceTransfer(address _from, address _to, uint256 _value, bytes _data, bytes _log) public onlyController {emit __FunctionCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',51);

emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',828);
        emit __AssertPreCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',53);
emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',175);
require(_to != address(0));emit __AssertPostCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',53);

emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',829);
        emit __AssertPreCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',54);
emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',176);
require(_value <= balances[_from]);emit __AssertPostCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',54);

emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',830);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',177);
bool verified = _updateTransfer(_from, _to, _value, _data);
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',831);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',178);
balances[_from] = balances[_from].sub(_value);
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',832);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',179);
balances[_to] = balances[_to].add(_value);
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',833);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',180);
emit ForceTransfer(msg.sender, _from, _to, _value, verified, _log);
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',834);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',181);
emit Transfer(_from, _to, _value);
    }

    /**
     * @notice Used by a controller to execute a forced burn
     * @param _from address from which to take tokens
     * @param _value amount of tokens to transfer
     * @param _data data to indicate validation
     * @param _log data attached to the transfer by controller to emit in event
     */
    function forceBurn(address _from, uint256 _value, bytes _data, bytes _log) public onlyController {emit __FunctionCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',52);

emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',845);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',182);
bool verified = _burn(_from, _value, _data);
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',846);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',183);
emit ForceBurn(msg.sender, _from, _value, verified, _log);
    }

    /**
     * @notice Returns the version of the SecurityToken
     */
    function getVersion() external  returns(uint8[]) {emit __FunctionCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',53);

emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',853);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',184);
uint8[] memory _version = new uint8[](3);
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',854);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',185);
_version[0] = securityTokenVersion.major;
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',855);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',186);
_version[1] = securityTokenVersion.minor;
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',856);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',187);
_version[2] = securityTokenVersion.patch;
emit __CoverageSecurityToken('./contracts/tokens/SecurityToken.sol',857);
        emit __StatementCoverageSecurityToken('./contracts/tokens/SecurityToken.sol',188);
return _version;
    }

}
