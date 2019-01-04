pragma solidity ^0.4.24;

import "./interfaces/IModuleRegistry.sol";
import "./interfaces/IModuleFactory.sol";
import "./interfaces/ISecurityTokenRegistry.sol";
import "./interfaces/IPolymathRegistry.sol";
import "./interfaces/IFeatureRegistry.sol";
import "./interfaces/IERC20.sol";
import "./libraries/VersionUtils.sol";
import "./storage/EternalStorage.sol";
import "./libraries/Encoder.sol";
import "./interfaces/IOwnable.sol";
import "./interfaces/ISecurityToken.sol";

/**
* @title Registry contract to store registered modules
* @notice Only Polymath can register and verify module factories to make them available for issuers to attach.
*/
contract ModuleRegistry is IModuleRegistry, EternalStorage {event __CoverageModuleRegistry(string fileName, uint256 lineNumber);
event __FunctionCoverageModuleRegistry(string fileName, uint256 fnId);
event __StatementCoverageModuleRegistry(string fileName, uint256 statementId);
event __BranchCoverageModuleRegistry(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageModuleRegistry(string fileName, uint256 branchId);
event __AssertPostCoverageModuleRegistry(string fileName, uint256 branchId);

    /*
        // Mapping used to hold the type of module factory corresponds to the address of the Module factory contract
        mapping (address => uint8) public registry;

        // Mapping used to hold the reputation of the factory
        mapping (address => address[]) public reputation;

        // Mapping containing the list of addresses of Module Factories of a particular type
        mapping (uint8 => address[]) public moduleList;

        // Mapping to store the index of the Module Factory in the moduleList
        mapping(address => uint8) private moduleListIndex;

        // contains the list of verified modules
        mapping (address => bool) public verified;

    */

    ///////////
    // Events
    //////////

    // Emit when network becomes paused
    event Pause(uint256 _timestammp);
     // Emit when network becomes unpaused
    event Unpause(uint256 _timestamp);
    // Emit when Module is used by the SecurityToken
    event ModuleUsed(address indexed _moduleFactory, address indexed _securityToken);
    // Emit when the Module Factory gets registered on the ModuleRegistry contract
    event ModuleRegistered(address indexed _moduleFactory, address indexed _owner);
    // Emit when the module gets verified by Polymath
    event ModuleVerified(address indexed _moduleFactory, bool _verified);
    // Emit when a ModuleFactory is removed by Polymath
    event ModuleRemoved(address indexed _moduleFactory, address indexed _decisionMaker);
    // Emit when ownership gets transferred
    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    ///////////////
    //// Modifiers
    ///////////////

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {emit __FunctionCoverageModuleRegistry('./contracts/ModuleRegistry.sol',1);

emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',65);
        emit __AssertPreCoverageModuleRegistry('./contracts/ModuleRegistry.sol',1);
emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',1);
require(msg.sender == owner(),"sender must be owner");emit __AssertPostCoverageModuleRegistry('./contracts/ModuleRegistry.sol',1);

emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',66);
        _;
    }

    /**
     * @notice Modifier to make a function callable only when the contract is not paused.
     */
    modifier whenNotPausedOrOwner() {emit __FunctionCoverageModuleRegistry('./contracts/ModuleRegistry.sol',2);

emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',73);
        emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',2);
if (msg.sender == owner())
            {emit __BranchCoverageModuleRegistry('./contracts/ModuleRegistry.sol',2,0);emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',74);
_;}
        else {emit __BranchCoverageModuleRegistry('./contracts/ModuleRegistry.sol',2,1);
emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',76);
            emit __AssertPreCoverageModuleRegistry('./contracts/ModuleRegistry.sol',3);
emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',3);
require(!isPaused(), "Already paused");emit __AssertPostCoverageModuleRegistry('./contracts/ModuleRegistry.sol',3);

emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',77);
            _;
        }
    }

    /**
     * @notice Modifier to make a function callable only when the contract is not paused and ignore is msg.sender is owner.
     */
    modifier whenNotPaused() {emit __FunctionCoverageModuleRegistry('./contracts/ModuleRegistry.sol',3);

emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',85);
        emit __AssertPreCoverageModuleRegistry('./contracts/ModuleRegistry.sol',4);
emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',4);
require(!isPaused(), "Already paused");emit __AssertPostCoverageModuleRegistry('./contracts/ModuleRegistry.sol',4);

emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',86);
        _;
    }

    /**
     * @notice Modifier to make a function callable only when the contract is paused.
     */
    modifier whenPaused() {emit __FunctionCoverageModuleRegistry('./contracts/ModuleRegistry.sol',4);

emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',93);
        emit __AssertPreCoverageModuleRegistry('./contracts/ModuleRegistry.sol',5);
emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',5);
require(isPaused(), "Should not be paused");emit __AssertPostCoverageModuleRegistry('./contracts/ModuleRegistry.sol',5);

emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',94);
        _;
    }

    /////////////////////////////
    // Initialization
    /////////////////////////////

    // Constructor
    constructor () public
    {emit __FunctionCoverageModuleRegistry('./contracts/ModuleRegistry.sol',5);


    }

    function initialize(address _polymathRegistry, address _owner) external payable {emit __FunctionCoverageModuleRegistry('./contracts/ModuleRegistry.sol',6);

emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',108);
        emit __AssertPreCoverageModuleRegistry('./contracts/ModuleRegistry.sol',6);
emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',6);
require(!getBoolValue(Encoder.getKey("initialised")),"already initialized");emit __AssertPostCoverageModuleRegistry('./contracts/ModuleRegistry.sol',6);

emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',109);
        emit __AssertPreCoverageModuleRegistry('./contracts/ModuleRegistry.sol',7);
emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',7);
require(_owner != address(0) && _polymathRegistry != address(0), "0x address is invalid");emit __AssertPostCoverageModuleRegistry('./contracts/ModuleRegistry.sol',7);

emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',110);
        emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',8);
set(Encoder.getKey("polymathRegistry"), _polymathRegistry);
emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',111);
        emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',9);
set(Encoder.getKey("owner"), _owner);
emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',112);
        emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',10);
set(Encoder.getKey("paused"), false);
emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',113);
        emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',11);
set(Encoder.getKey("initialised"), true);
    }

    /**
     * @notice Called by a SecurityToken to check if the ModuleFactory is verified or appropriate custom module
     * @dev ModuleFactory reputation increases by one every time it is deployed(used) by a ST.
     * @dev Any module can be added during token creation without being registered if it is defined in the token proxy deployment contract
     * @dev The feature switch for custom modules is labelled "customModulesAllowed"
     * @param _moduleFactory is the address of the relevant module factory
     */
    function useModule(address _moduleFactory) external {emit __FunctionCoverageModuleRegistry('./contracts/ModuleRegistry.sol',7);

        // This if statement is required to be able to add modules from the token proxy contract during deployment
emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',125);
        emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',12);
if (ISecurityTokenRegistry(getAddressValue(Encoder.getKey("securityTokenRegistry"))).isSecurityToken(msg.sender)) {emit __BranchCoverageModuleRegistry('./contracts/ModuleRegistry.sol',8,0);
emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',126);
            emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',13);
if (IFeatureRegistry(getAddressValue(Encoder.getKey("featureRegistry"))).getFeatureStatus("customModulesAllowed")) {emit __BranchCoverageModuleRegistry('./contracts/ModuleRegistry.sol',9,0);
emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',127);
                emit __AssertPreCoverageModuleRegistry('./contracts/ModuleRegistry.sol',10);
emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',14);
require(getBoolValue(Encoder.getKey("verified", _moduleFactory)) || IOwnable(_moduleFactory).owner() == IOwnable(msg.sender).owner(),"ModuleFactory must be verified or SecurityToken owner must be ModuleFactory owner");emit __AssertPostCoverageModuleRegistry('./contracts/ModuleRegistry.sol',10);

            } else {emit __BranchCoverageModuleRegistry('./contracts/ModuleRegistry.sol',9,1);
emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',129);
                emit __AssertPreCoverageModuleRegistry('./contracts/ModuleRegistry.sol',11);
emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',15);
require(getBoolValue(Encoder.getKey("verified", _moduleFactory)), "ModuleFactory must be verified");emit __AssertPostCoverageModuleRegistry('./contracts/ModuleRegistry.sol',11);

            }
emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',131);
            emit __AssertPreCoverageModuleRegistry('./contracts/ModuleRegistry.sol',12);
emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',16);
require(_isCompatibleModule(_moduleFactory, msg.sender), "Version should within the compatible range of ST");emit __AssertPostCoverageModuleRegistry('./contracts/ModuleRegistry.sol',12);

emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',132);
            emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',17);
pushArray(Encoder.getKey("reputation", _moduleFactory), msg.sender);
emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',133);
            emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',18);
emit ModuleUsed(_moduleFactory, msg.sender);
        }else { emit __BranchCoverageModuleRegistry('./contracts/ModuleRegistry.sol',8,1);}

    }

    function _isCompatibleModule(address _moduleFactory, address _securityToken) internal  returns(bool) {emit __FunctionCoverageModuleRegistry('./contracts/ModuleRegistry.sol',8);

emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',138);
        emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',19);
uint8[] memory _latestVersion = ISecurityToken(_securityToken).getVersion();
emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',139);
        emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',20);
uint8[] memory _lowerBound = IModuleFactory(_moduleFactory).getLowerSTVersionBounds();
emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',140);
        emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',21);
uint8[] memory _upperBound = IModuleFactory(_moduleFactory).getUpperSTVersionBounds();
emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',141);
        emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',22);
bool _isLowerAllowed = VersionUtils.compareLowerBound(_lowerBound, _latestVersion);
emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',142);
        emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',23);
bool _isUpperAllowed = VersionUtils.compareUpperBound(_upperBound, _latestVersion);
emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',143);
        emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',24);
return (_isLowerAllowed && _isUpperAllowed);
    }

    /**
     * @notice Called by the ModuleFactory owner to register new modules for SecurityTokens to use
     * @param _moduleFactory is the address of the module factory to be registered
     */
    function registerModule(address _moduleFactory) external whenNotPausedOrOwner {emit __FunctionCoverageModuleRegistry('./contracts/ModuleRegistry.sol',9);

emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',151);
        emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',25);
if (IFeatureRegistry(getAddressValue(Encoder.getKey("featureRegistry"))).getFeatureStatus("customModulesAllowed")) {emit __BranchCoverageModuleRegistry('./contracts/ModuleRegistry.sol',13,0);
emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',152);
            emit __AssertPreCoverageModuleRegistry('./contracts/ModuleRegistry.sol',14);
emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',26);
require(msg.sender == IOwnable(_moduleFactory).owner() || msg.sender == owner(),"msg.sender must be the Module Factory owner or registry curator");emit __AssertPostCoverageModuleRegistry('./contracts/ModuleRegistry.sol',14);

        } else {emit __BranchCoverageModuleRegistry('./contracts/ModuleRegistry.sol',13,1);
emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',154);
            emit __AssertPreCoverageModuleRegistry('./contracts/ModuleRegistry.sol',15);
emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',27);
require(msg.sender == owner(), "Only owner allowed to register modules");emit __AssertPostCoverageModuleRegistry('./contracts/ModuleRegistry.sol',15);

        }
emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',156);
        emit __AssertPreCoverageModuleRegistry('./contracts/ModuleRegistry.sol',16);
emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',28);
require(getUintValue(Encoder.getKey("registry", _moduleFactory)) == 0, "Module factory should not be pre-registered");emit __AssertPostCoverageModuleRegistry('./contracts/ModuleRegistry.sol',16);

emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',157);
        emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',29);
IModuleFactory moduleFactory = IModuleFactory(_moduleFactory);
        //Enforce type uniqueness
emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',159);
        uint256 i;
emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',160);
        uint256 j;
emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',161);
        emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',30);
uint8[] memory moduleTypes = moduleFactory.getTypes();
emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',162);
        emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',31);
for (i = 1; i < moduleTypes.length; i++) {
emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',163);
            emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',32);
for (j = 0; j < i; j++) {
emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',164);
                emit __AssertPreCoverageModuleRegistry('./contracts/ModuleRegistry.sol',17);
emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',33);
require(moduleTypes[i] != moduleTypes[j], "Type mismatch");emit __AssertPostCoverageModuleRegistry('./contracts/ModuleRegistry.sol',17);

            }
        }
emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',167);
        emit __AssertPreCoverageModuleRegistry('./contracts/ModuleRegistry.sol',18);
emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',34);
require(moduleTypes.length != 0, "Factory must have type");emit __AssertPostCoverageModuleRegistry('./contracts/ModuleRegistry.sol',18);

        // NB - here we index by the first type of the module.
emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',169);
        emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',35);
uint8 moduleType = moduleFactory.getTypes()[0];
emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',170);
        emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',36);
set(Encoder.getKey("registry", _moduleFactory), uint256(moduleType));
emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',171);
        emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',37);
set(
            Encoder.getKey("moduleListIndex", _moduleFactory),
            uint256(getArrayAddress(Encoder.getKey("moduleList", uint256(moduleType))).length)
        );
emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',175);
        emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',38);
pushArray(Encoder.getKey("moduleList", uint256(moduleType)), _moduleFactory);
emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',176);
        emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',39);
emit ModuleRegistered (_moduleFactory, IOwnable(_moduleFactory).owner());
    }

    /**
     * @notice Called by the ModuleFactory owner or registry curator to delete a ModuleFactory from the registry
     * @param _moduleFactory is the address of the module factory to be deleted from the registry
     */
    function removeModule(address _moduleFactory) external whenNotPausedOrOwner {emit __FunctionCoverageModuleRegistry('./contracts/ModuleRegistry.sol',10);

emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',184);
        emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',40);
uint256 moduleType = getUintValue(Encoder.getKey("registry", _moduleFactory));

emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',186);
        emit __AssertPreCoverageModuleRegistry('./contracts/ModuleRegistry.sol',19);
emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',41);
require(moduleType != 0, "Module factory should be registered");emit __AssertPostCoverageModuleRegistry('./contracts/ModuleRegistry.sol',19);

emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',187);
        emit __AssertPreCoverageModuleRegistry('./contracts/ModuleRegistry.sol',20);
emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',42);
require(
            msg.sender == IOwnable(_moduleFactory).owner() || msg.sender == owner(),
            "msg.sender must be the Module Factory owner or registry curator"
        );emit __AssertPostCoverageModuleRegistry('./contracts/ModuleRegistry.sol',20);

emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',191);
        emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',43);
uint256 index = getUintValue(Encoder.getKey("moduleListIndex", _moduleFactory));
emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',192);
        emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',44);
uint256 last = getArrayAddress(Encoder.getKey("moduleList", moduleType)).length - 1;
emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',193);
        emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',45);
address temp = getArrayAddress(Encoder.getKey("moduleList", moduleType))[last];

        // pop from array and re-order
emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',196);
        emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',46);
if (index != last) {emit __BranchCoverageModuleRegistry('./contracts/ModuleRegistry.sol',21,0);
            // moduleList[moduleType][index] = temp;
emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',198);
            emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',47);
setArrayIndexValue(Encoder.getKey("moduleList", moduleType), index, temp);
emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',199);
            emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',48);
set(Encoder.getKey("moduleListIndex", temp), index);
        }else { emit __BranchCoverageModuleRegistry('./contracts/ModuleRegistry.sol',21,1);}

emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',201);
        emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',49);
deleteArrayAddress(Encoder.getKey("moduleList", moduleType), last);

        // delete registry[_moduleFactory];
emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',204);
        emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',50);
set(Encoder.getKey("registry", _moduleFactory), uint256(0));
        // delete reputation[_moduleFactory];
emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',206);
        emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',51);
setArray(Encoder.getKey("reputation", _moduleFactory), new address[](0));
        // delete verified[_moduleFactory];
emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',208);
        emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',52);
set(Encoder.getKey("verified", _moduleFactory), false);
        // delete moduleListIndex[_moduleFactory];
emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',210);
        emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',53);
set(Encoder.getKey("moduleListIndex", _moduleFactory), uint256(0));
emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',211);
        emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',54);
emit ModuleRemoved(_moduleFactory, msg.sender);
    }

    /**
    * @notice Called by Polymath to verify Module Factories for SecurityTokens to use.
    * @notice A module can not be used by an ST unless first approved/verified by Polymath
    * @notice (The only exception to this is that the author of the module is the owner of the ST)
    * @notice -> Only if Polymath enabled the feature.
    * @param _moduleFactory is the address of the module factory to be verified
    * @return bool
    */
    function verifyModule(address _moduleFactory, bool _verified) external onlyOwner {emit __FunctionCoverageModuleRegistry('./contracts/ModuleRegistry.sol',11);

emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',223);
        emit __AssertPreCoverageModuleRegistry('./contracts/ModuleRegistry.sol',22);
emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',55);
require(getUintValue(Encoder.getKey("registry", _moduleFactory)) != uint256(0), "Module factory must be registered");emit __AssertPostCoverageModuleRegistry('./contracts/ModuleRegistry.sol',22);

emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',224);
        emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',56);
set(Encoder.getKey("verified", _moduleFactory), _verified);
emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',225);
        emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',57);
emit ModuleVerified(_moduleFactory, _verified);
    }

    /**
     * @notice Returns all the tags related to the a module type which are valid for the given token
     * @param _moduleType is the module type
     * @param _securityToken is the token
     * @return list of tags
     * @return corresponding list of module factories
     */
    function getTagsByTypeAndToken(uint8 _moduleType, address _securityToken) external  returns(bytes32[], address[]) {emit __FunctionCoverageModuleRegistry('./contracts/ModuleRegistry.sol',12);

emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',236);
        emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',58);
address[] memory modules = getModulesByTypeAndToken(_moduleType, _securityToken);
emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',237);
        emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',59);
return _tagsByModules(modules);
    }

    /**
     * @notice Returns all the tags related to the a module type which are valid for the given token
     * @param _moduleType is the module type
     * @return list of tags
     * @return corresponding list of module factories
     */
    function getTagsByType(uint8 _moduleType) external  returns(bytes32[], address[]) {emit __FunctionCoverageModuleRegistry('./contracts/ModuleRegistry.sol',13);

emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',247);
        emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',60);
address[] memory modules = getModulesByType(_moduleType);
emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',248);
        emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',61);
return _tagsByModules(modules);
    }

    /**
     * @notice Returns all the tags related to the modules provided
     * @param _modules modules to return tags for
     * @return list of tags
     * @return corresponding list of module factories
     */
    function _tagsByModules(address[] _modules) internal  returns(bytes32[], address[]) {emit __FunctionCoverageModuleRegistry('./contracts/ModuleRegistry.sol',14);

emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',258);
        emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',62);
uint256 counter = 0;
emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',259);
        uint256 i;
emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',260);
        uint256 j;
emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',261);
        emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',63);
for (i = 0; i < _modules.length; i++) {
emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',262);
            emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',64);
counter = counter + IModuleFactory(_modules[i]).getTags().length;
        }
emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',264);
        emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',65);
bytes32[] memory tags = new bytes32[](counter);
emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',265);
        emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',66);
address[] memory modules = new address[](counter);
emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',266);
        bytes32[] memory tempTags;
emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',267);
        emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',67);
counter = 0;
emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',268);
        emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',68);
for (i = 0; i < _modules.length; i++) {
emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',269);
            emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',69);
tempTags = IModuleFactory(_modules[i]).getTags();
emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',270);
            emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',70);
for (j = 0; j < tempTags.length; j++) {
emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',271);
                emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',71);
tags[counter] = tempTags[j];
emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',272);
                emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',72);
modules[counter] = _modules[i];
emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',273);
                counter++;
            }
        }
emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',276);
        emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',73);
return (tags, modules);
    }

    /**
     * @notice Returns the reputation of the entered Module Factory
     * @param _factoryAddress is the address of the module factory
     * @return address array which contains the list of securityTokens that use that module factory
     */
    function getReputationByFactory(address _factoryAddress) external  returns(address[]) {emit __FunctionCoverageModuleRegistry('./contracts/ModuleRegistry.sol',15);

emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',285);
        emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',74);
return getArrayAddress(Encoder.getKey("reputation", _factoryAddress));
    }

    /**
     * @notice Returns the list of addresses of Module Factory of a particular type
     * @param _moduleType Type of Module
     * @return address array that contains the list of addresses of module factory contracts.
     */
    function getModulesByType(uint8 _moduleType) public  returns(address[]) {emit __FunctionCoverageModuleRegistry('./contracts/ModuleRegistry.sol',16);

emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',294);
        emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',75);
return getArrayAddress(Encoder.getKey("moduleList", uint256(_moduleType)));
    }

    /**
     * @notice Returns the list of available Module factory addresses of a particular type for a given token.
     * @param _moduleType is the module type to look for
     * @param _securityToken is the address of SecurityToken
     * @return address array that contains the list of available addresses of module factory contracts.
     */
    function getModulesByTypeAndToken(uint8 _moduleType, address _securityToken) public  returns (address[]) {emit __FunctionCoverageModuleRegistry('./contracts/ModuleRegistry.sol',17);

emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',304);
        emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',76);
uint256 _len = getArrayAddress(Encoder.getKey("moduleList", uint256(_moduleType))).length;
emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',305);
        emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',77);
address[] memory _addressList = getArrayAddress(Encoder.getKey("moduleList", uint256(_moduleType)));
emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',306);
        emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',78);
bool _isCustomModuleAllowed = IFeatureRegistry(getAddressValue(Encoder.getKey("featureRegistry"))).getFeatureStatus("customModulesAllowed");
emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',307);
        emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',79);
uint256 counter = 0;
emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',308);
        emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',80);
for (uint256 i = 0; i < _len; i++) {
emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',309);
            emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',81);
if (_isCustomModuleAllowed) {emit __BranchCoverageModuleRegistry('./contracts/ModuleRegistry.sol',23,0);
emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',310);
                emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',82);
if (IOwnable(_addressList[i]).owner() == IOwnable(_securityToken).owner() || getBoolValue(Encoder.getKey("verified", _addressList[i])))
                    {emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',83);
emit __BranchCoverageModuleRegistry('./contracts/ModuleRegistry.sol',24,0);emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',311);
if(_isCompatibleModule(_addressList[i], _securityToken))
                        {emit __BranchCoverageModuleRegistry('./contracts/ModuleRegistry.sol',25,0);emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',312);
counter++;}else { emit __BranchCoverageModuleRegistry('./contracts/ModuleRegistry.sol',25,1);}
}else { emit __BranchCoverageModuleRegistry('./contracts/ModuleRegistry.sol',24,1);}

            }
            else {emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',84);
emit __BranchCoverageModuleRegistry('./contracts/ModuleRegistry.sol',23,1);if (getBoolValue(Encoder.getKey("verified", _addressList[i]))) {emit __BranchCoverageModuleRegistry('./contracts/ModuleRegistry.sol',26,0);
emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',315);
                emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',85);
if(_isCompatibleModule(_addressList[i], _securityToken))
                    {emit __BranchCoverageModuleRegistry('./contracts/ModuleRegistry.sol',27,0);emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',316);
counter++;}else { emit __BranchCoverageModuleRegistry('./contracts/ModuleRegistry.sol',27,1);}

            }else { emit __BranchCoverageModuleRegistry('./contracts/ModuleRegistry.sol',26,1);}
}
        }
emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',319);
        emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',86);
address[] memory _tempArray = new address[](counter);
emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',320);
        emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',87);
counter = 0;
emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',321);
        emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',88);
for (uint256 j = 0; j < _len; j++) {
emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',322);
            emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',89);
if (_isCustomModuleAllowed) {emit __BranchCoverageModuleRegistry('./contracts/ModuleRegistry.sol',28,0);
emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',323);
                emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',90);
if (IOwnable(_addressList[j]).owner() == IOwnable(_securityToken).owner() || getBoolValue(Encoder.getKey("verified", _addressList[j]))) {emit __BranchCoverageModuleRegistry('./contracts/ModuleRegistry.sol',29,0);
emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',324);
                    emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',91);
if(_isCompatibleModule(_addressList[j], _securityToken)) {emit __BranchCoverageModuleRegistry('./contracts/ModuleRegistry.sol',30,0);
emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',325);
                        emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',92);
_tempArray[counter] = _addressList[j];
emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',326);
                        counter ++;
                    }else { emit __BranchCoverageModuleRegistry('./contracts/ModuleRegistry.sol',30,1);}

                }else { emit __BranchCoverageModuleRegistry('./contracts/ModuleRegistry.sol',29,1);}

            }
            else {emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',93);
emit __BranchCoverageModuleRegistry('./contracts/ModuleRegistry.sol',28,1);if (getBoolValue(Encoder.getKey("verified", _addressList[j]))) {emit __BranchCoverageModuleRegistry('./contracts/ModuleRegistry.sol',31,0);
emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',331);
                emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',94);
if(_isCompatibleModule(_addressList[j], _securityToken)) {emit __BranchCoverageModuleRegistry('./contracts/ModuleRegistry.sol',32,0);
emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',332);
                    emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',95);
_tempArray[counter] = _addressList[j];
emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',333);
                    counter ++;
                }else { emit __BranchCoverageModuleRegistry('./contracts/ModuleRegistry.sol',32,1);}

            }else { emit __BranchCoverageModuleRegistry('./contracts/ModuleRegistry.sol',31,1);}
}
        }
emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',337);
        emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',96);
return _tempArray;
    }

    /**
    * @notice Reclaims all ERC20Basic compatible tokens
    * @param _tokenContract The address of the token contract
    */
    function reclaimERC20(address _tokenContract) external onlyOwner {emit __FunctionCoverageModuleRegistry('./contracts/ModuleRegistry.sol',18);

emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',345);
        emit __AssertPreCoverageModuleRegistry('./contracts/ModuleRegistry.sol',33);
emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',97);
require(_tokenContract != address(0), "0x address is invalid");emit __AssertPostCoverageModuleRegistry('./contracts/ModuleRegistry.sol',33);

emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',346);
        emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',98);
IERC20 token = IERC20(_tokenContract);
emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',347);
        emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',99);
uint256 balance = token.balanceOf(address(this));
emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',348);
        emit __AssertPreCoverageModuleRegistry('./contracts/ModuleRegistry.sol',34);
emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',100);
require(token.transfer(owner(), balance),"token transfer failed");emit __AssertPostCoverageModuleRegistry('./contracts/ModuleRegistry.sol',34);

    }

    /**
     * @notice Called by the owner to pause, triggers stopped state
     */
    function pause() external whenNotPaused onlyOwner {emit __FunctionCoverageModuleRegistry('./contracts/ModuleRegistry.sol',19);

emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',355);
        emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',101);
set(Encoder.getKey("paused"), true);
        /*solium-disable-next-line security/no-block-members*/
emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',357);
        emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',102);
emit Pause(now);
    }

    /**
     * @notice Called by the owner to unpause, returns to normal state
     */
    function unpause() external whenPaused onlyOwner {emit __FunctionCoverageModuleRegistry('./contracts/ModuleRegistry.sol',20);

emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',364);
        emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',103);
set(Encoder.getKey("paused"), false);
        /*solium-disable-next-line security/no-block-members*/
emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',366);
        emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',104);
emit Unpause(now);
    }

    /**
     * @notice Stores the contract addresses of other key contracts from the PolymathRegistry
     */
    function updateFromRegistry() external onlyOwner {emit __FunctionCoverageModuleRegistry('./contracts/ModuleRegistry.sol',21);

emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',373);
        emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',105);
address _polymathRegistry = getAddressValue(Encoder.getKey("polymathRegistry"));
emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',374);
        emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',106);
set(Encoder.getKey("securityTokenRegistry"), IPolymathRegistry(_polymathRegistry).getAddress("SecurityTokenRegistry"));
emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',375);
        emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',107);
set(Encoder.getKey("featureRegistry"), IPolymathRegistry(_polymathRegistry).getAddress("FeatureRegistry"));
emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',376);
        emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',108);
set(Encoder.getKey("polyToken"), IPolymathRegistry(_polymathRegistry).getAddress("PolyToken"));
    }

    /**
    * @dev Allows the current owner to transfer control of the contract to a newOwner.
    * @param _newOwner The address to transfer ownership to.
    */
    function transferOwnership(address _newOwner) external onlyOwner {emit __FunctionCoverageModuleRegistry('./contracts/ModuleRegistry.sol',22);

emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',384);
        emit __AssertPreCoverageModuleRegistry('./contracts/ModuleRegistry.sol',35);
emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',109);
require(_newOwner != address(0), "Invalid address");emit __AssertPostCoverageModuleRegistry('./contracts/ModuleRegistry.sol',35);

emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',385);
        emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',110);
emit OwnershipTransferred(owner(), _newOwner);
emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',386);
        emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',111);
set(Encoder.getKey("owner"), _newOwner);
    }

    /**
     * @notice Gets the owner of the contract
     * @return address owner
     */
    function owner() public  returns(address) {emit __FunctionCoverageModuleRegistry('./contracts/ModuleRegistry.sol',23);

emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',394);
        emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',112);
return getAddressValue(Encoder.getKey("owner"));
    }

    /**
     * @notice Checks whether the contract operations is paused or not
     * @return bool
     */
    function isPaused() public  returns(bool) {emit __FunctionCoverageModuleRegistry('./contracts/ModuleRegistry.sol',24);

emit __CoverageModuleRegistry('./contracts/ModuleRegistry.sol',402);
        emit __StatementCoverageModuleRegistry('./contracts/ModuleRegistry.sol',113);
return getBoolValue(Encoder.getKey("paused"));
    }
}
