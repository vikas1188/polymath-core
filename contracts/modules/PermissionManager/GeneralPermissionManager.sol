pragma solidity ^0.4.24;

import "./IPermissionManager.sol";
import "../Module.sol";

/**
 * @title Permission Manager module for core permissioning functionality
 */
contract GeneralPermissionManager is IPermissionManager, Module {event __CoverageGeneralPermissionManager(string fileName, uint256 lineNumber);
event __FunctionCoverageGeneralPermissionManager(string fileName, uint256 fnId);
event __StatementCoverageGeneralPermissionManager(string fileName, uint256 statementId);
event __BranchCoverageGeneralPermissionManager(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageGeneralPermissionManager(string fileName, uint256 branchId);
event __AssertPostCoverageGeneralPermissionManager(string fileName, uint256 branchId);


    // Mapping used to hold the permissions on the modules provided to delegate, module add => delegate add => permission bytes32 => bool 
    mapping (address => mapping (address => mapping (bytes32 => bool))) public perms;
    // Mapping hold the delagate details
    mapping (address => bytes32) public delegateDetails;
    // Array to track all delegates
    address[] public allDelegates;


    // Permission flag
    bytes32 public constant CHANGE_PERMISSION = "CHANGE_PERMISSION";

    /// Event emitted after any permission get changed for the delegate
    event ChangePermission(address indexed _delegate, address _module, bytes32 _perm, bool _valid, uint256 _timestamp);
    /// Used to notify when delegate is added in permission manager contract
    event AddDelegate(address indexed _delegate, bytes32 _details, uint256 _timestamp);


    /// @notice constructor
    constructor (address _securityToken, address _polyAddress) public
    Module(_securityToken, _polyAddress)
    {emit __FunctionCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',1);

    }

    /**
     * @notice Init function i.e generalise function to maintain the structure of the module contract
     * @return bytes4
     */
    function getInitFunction() public  returns (bytes4) {emit __FunctionCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',2);

emit __CoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',39);
        emit __StatementCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',1);
return bytes4(0);
    }

    /**
     * @notice Used to check the permission on delegate corresponds to module contract address
     * @param _delegate Ethereum address of the delegate
     * @param _module Ethereum contract address of the module
     * @param _perm Permission flag
     * @return bool
     */
    function checkPermission(address _delegate, address _module, bytes32 _perm) external  returns(bool) {emit __FunctionCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',3);

emit __CoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',50);
        emit __StatementCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',2);
if (delegateDetails[_delegate] != bytes32(0)) {emit __BranchCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',1,0);
emit __CoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',51);
            emit __StatementCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',3);
return perms[_module][_delegate][_perm];
        } else
            {emit __StatementCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',4);
emit __BranchCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',1,1);emit __CoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',53);
return false;}
    }

    /**
     * @notice Used to add a delegate
     * @param _delegate Ethereum address of the delegate
     * @param _details Details about the delegate i.e `Belongs to financial firm`
     */
    function addDelegate(address _delegate, bytes32 _details) external withPerm(CHANGE_PERMISSION) {emit __FunctionCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',4);

emit __CoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',62);
        emit __AssertPreCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',2);
emit __StatementCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',5);
require(_delegate != address(0), "Invalid address");emit __AssertPostCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',2);

emit __CoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',63);
        emit __AssertPreCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',3);
emit __StatementCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',6);
require(_details != bytes32(0), "0 value not allowed");emit __AssertPostCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',3);

emit __CoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',64);
        emit __AssertPreCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',4);
emit __StatementCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',7);
require(delegateDetails[_delegate] == bytes32(0), "Already present");emit __AssertPostCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',4);

emit __CoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',65);
        emit __StatementCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',8);
delegateDetails[_delegate] = _details;
emit __CoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',66);
        allDelegates.push(_delegate);
        /*solium-disable-next-line security/no-block-members*/
emit __CoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',68);
        emit __StatementCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',9);
emit AddDelegate(_delegate, _details, now);
    }

    /**
     * @notice Used to delete a delegate
     * @param _delegate Ethereum address of the delegate
     */
    function deleteDelegate(address _delegate) external withPerm(CHANGE_PERMISSION) {emit __FunctionCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',5);

emit __CoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',76);
        emit __AssertPreCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',5);
emit __StatementCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',10);
require(delegateDetails[_delegate] != bytes32(0), "delegate does not exist");emit __AssertPostCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',5);

emit __CoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',77);
        emit __StatementCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',11);
for (uint256 i = 0; i < allDelegates.length; i++) {
emit __CoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',78);
            emit __StatementCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',12);
if (allDelegates[i] == _delegate) {emit __BranchCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',6,0);
emit __CoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',79);
                emit __StatementCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',13);
allDelegates[i] = allDelegates[allDelegates.length - 1];
emit __CoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',80);
                emit __StatementCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',14);
allDelegates.length = allDelegates.length - 1;
            }else { emit __BranchCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',6,1);}

        }
emit __CoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',83);
        delete delegateDetails[_delegate];
    }

    /**
     * @notice Used to check if an address is a delegate or not
     * @param _potentialDelegate the address of potential delegate
     * @return bool
     */
    function checkDelegate(address _potentialDelegate) external  returns(bool) {emit __FunctionCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',6);

emit __CoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',92);
        emit __AssertPreCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',7);
emit __StatementCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',15);
require(_potentialDelegate != address(0), "Invalid address");emit __AssertPostCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',7);


emit __CoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',94);
        emit __StatementCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',16);
if (delegateDetails[_potentialDelegate] != bytes32(0)) {emit __BranchCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',8,0);
emit __CoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',95);
            emit __StatementCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',17);
return true;
        } else
            {emit __StatementCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',18);
emit __BranchCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',8,1);emit __CoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',97);
return false;}
    }

    /**
     * @notice Used to provide/change the permission to the delegate corresponds to the module contract
     * @param _delegate Ethereum address of the delegate
     * @param _module Ethereum contract address of the module
     * @param _perm Permission flag
     * @param _valid Bool flag use to switch on/off the permission
     * @return bool
     */
    function changePermission(
        address _delegate,
        address _module,
        bytes32 _perm,
        bool _valid
    )
    public
    withPerm(CHANGE_PERMISSION)
    {emit __FunctionCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',7);

emit __CoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',117);
        emit __AssertPreCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',9);
emit __StatementCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',19);
require(_delegate != address(0), "invalid address");emit __AssertPostCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',9);

emit __CoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',118);
        emit __StatementCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',20);
_changePermission(_delegate, _module, _perm, _valid);
    }

    /**
     * @notice Used to change one or more permissions for a single delegate at once
     * @param _delegate Ethereum address of the delegate
     * @param _modules Multiple module matching the multiperms, needs to be same length
     * @param _perms Multiple permission flag needs to be changed
     * @param _valids Bool array consist the flag to switch on/off the permission
     * @return nothing
     */
    function changePermissionMulti(
        address _delegate,
        address[] _modules,
        bytes32[] _perms,
        bool[] _valids
    )
    external
    withPerm(CHANGE_PERMISSION)
    {emit __FunctionCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',8);

emit __CoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',138);
        emit __AssertPreCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',10);
emit __StatementCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',21);
require(_delegate != address(0), "invalid address");emit __AssertPostCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',10);

emit __CoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',139);
        emit __AssertPreCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',11);
emit __StatementCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',22);
require(_modules.length > 0, "0 length is not allowed");emit __AssertPostCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',11);

emit __CoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',140);
        emit __AssertPreCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',12);
emit __StatementCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',23);
require(_modules.length == _perms.length, "Array length mismatch");emit __AssertPostCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',12);

emit __CoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',141);
        emit __AssertPreCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',13);
emit __StatementCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',24);
require(_valids.length == _perms.length, "Array length mismatch");emit __AssertPostCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',13);

emit __CoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',142);
        emit __StatementCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',25);
for(uint256 i = 0; i < _perms.length; i++) {
emit __CoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',143);
            emit __StatementCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',26);
_changePermission(_delegate, _modules[i], _perms[i], _valids[i]);
        }
    }

    /**
     * @notice Used to return all delegates with a given permission and module
     * @param _module Ethereum contract address of the module
     * @param _perm Permission flag
     * @return address[]
     */
    function getAllDelegatesWithPerm(address _module, bytes32 _perm) external  returns(address[]) {emit __FunctionCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',9);

emit __CoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',154);
        emit __StatementCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',27);
uint256 counter = 0;
emit __CoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',155);
        emit __StatementCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',28);
uint256 i = 0;
emit __CoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',156);
        emit __StatementCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',29);
for (i = 0; i < allDelegates.length; i++) {
emit __CoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',157);
            emit __StatementCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',30);
if (perms[_module][allDelegates[i]][_perm]) {emit __BranchCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',14,0);
emit __CoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',158);
                counter++;
            }else { emit __BranchCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',14,1);}

        }
emit __CoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',161);
        emit __StatementCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',31);
address[] memory allDelegatesWithPerm = new address[](counter);
emit __CoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',162);
        emit __StatementCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',32);
counter = 0;
emit __CoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',163);
        emit __StatementCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',33);
for (i = 0; i < allDelegates.length; i++) {
emit __CoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',164);
            emit __StatementCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',34);
if (perms[_module][allDelegates[i]][_perm]){emit __BranchCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',15,0);
emit __CoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',165);
                emit __StatementCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',35);
allDelegatesWithPerm[counter] = allDelegates[i];
emit __CoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',166);
                counter++;
            }else { emit __BranchCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',15,1);}

        }
emit __CoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',169);
        emit __StatementCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',36);
return allDelegatesWithPerm;
    }

    /**
     * @notice Used to return all permission of a single or multiple module
     * @dev possible that function get out of gas is there are lot of modules and perm related to them
     * @param _delegate Ethereum address of the delegate
     * @param _types uint8[] of types
     * @return address[] the address array of Modules this delegate has permission
     * @return bytes32[] the permission array of the corresponding Modules
     */
    function getAllModulesAndPermsFromTypes(address _delegate, uint8[] _types) external  returns(address[], bytes32[]) {emit __FunctionCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',10);

emit __CoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',181);
        emit __StatementCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',37);
uint256 counter = 0;
        // loop through _types and get their modules from securityToken->getModulesByType
emit __CoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',183);
        emit __StatementCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',38);
for (uint256 i = 0; i < _types.length; i++) {
emit __CoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',184);
            emit __StatementCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',39);
address[] memory _currentTypeModules = ISecurityToken(securityToken).getModulesByType(_types[i]);
            // loop through each modules to get their perms from IModule->getPermissions
emit __CoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',186);
            emit __StatementCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',40);
for (uint256 j = 0; j < _currentTypeModules.length; j++){
emit __CoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',187);
                emit __StatementCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',41);
bytes32[] memory _allModulePerms = IModule(_currentTypeModules[j]).getPermissions();
                // loop through each perm, if it is true, push results into arrays
emit __CoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',189);
                emit __StatementCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',42);
for (uint256 k = 0; k < _allModulePerms.length; k++) {
emit __CoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',190);
                    emit __StatementCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',43);
if (perms[_currentTypeModules[j]][_delegate][_allModulePerms[k]]) {emit __BranchCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',16,0);
emit __CoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',191);
                        counter ++;
                    }else { emit __BranchCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',16,1);}

                }
            }
        }

emit __CoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',197);
        emit __StatementCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',44);
address[] memory _allModules = new address[](counter);
emit __CoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',198);
        emit __StatementCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',45);
bytes32[] memory _allPerms = new bytes32[](counter);
emit __CoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',199);
        emit __StatementCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',46);
counter = 0;

emit __CoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',201);
        emit __StatementCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',47);
for (i = 0; i < _types.length; i++){
emit __CoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',202);
            emit __StatementCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',48);
_currentTypeModules = ISecurityToken(securityToken).getModulesByType(_types[i]);
emit __CoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',203);
            emit __StatementCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',49);
for (j = 0; j < _currentTypeModules.length; j++) {
emit __CoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',204);
                emit __StatementCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',50);
_allModulePerms = IModule(_currentTypeModules[j]).getPermissions();
emit __CoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',205);
                emit __StatementCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',51);
for (k = 0; k < _allModulePerms.length; k++) {
emit __CoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',206);
                    emit __StatementCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',52);
if (perms[_currentTypeModules[j]][_delegate][_allModulePerms[k]]) {emit __BranchCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',17,0);
emit __CoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',207);
                        emit __StatementCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',53);
_allModules[counter] = _currentTypeModules[j];
emit __CoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',208);
                        emit __StatementCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',54);
_allPerms[counter] = _allModulePerms[k];
emit __CoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',209);
                        counter++;
                    }else { emit __BranchCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',17,1);}

                }
            }
        }

emit __CoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',215);
        emit __StatementCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',55);
return(_allModules, _allPerms);
    }

    /**
     * @notice Used to provide/change the permission to the delegate corresponds to the module contract
     * @param _delegate Ethereum address of the delegate
     * @param _module Ethereum contract address of the module
     * @param _perm Permission flag
     * @param _valid Bool flag use to switch on/off the permission
     * @return bool
     */
    function _changePermission(
        address _delegate,
        address _module,
        bytes32 _perm,
        bool _valid
    )
     internal
    {emit __FunctionCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',11);

emit __CoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',234);
        emit __StatementCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',56);
perms[_module][_delegate][_perm] = _valid;
        /*solium-disable-next-line security/no-block-members*/
emit __CoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',236);
        emit __StatementCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',57);
emit ChangePermission(_delegate, _module, _perm, _valid, now);
    }

    /**
     * @notice Used to get all delegates
     * @return address[]
     */
    function getAllDelegates() external  returns(address[]) {emit __FunctionCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',12);

emit __CoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',244);
        emit __StatementCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',58);
return allDelegates;
    }
    
    /**
    * @notice Returns the Permission flag related the `this` contract
    * @return Array of permission flags
    */
    function getPermissions() public  returns(bytes32[]) {emit __FunctionCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',13);

emit __CoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',252);
        emit __StatementCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',59);
bytes32[] memory allPermissions = new bytes32[](1);
emit __CoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',253);
        emit __StatementCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',60);
allPermissions[0] = CHANGE_PERMISSION;
emit __CoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',254);
        emit __StatementCoverageGeneralPermissionManager('./contracts/modules/PermissionManager/GeneralPermissionManager.sol',61);
return allPermissions;
    }

}
