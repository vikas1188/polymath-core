pragma solidity ^0.4.24;

import "../modules/PermissionManager/IPermissionManager.sol";
import "openzeppelin-solidity/contracts/math/SafeMath.sol";

library TokenLib {event __CoverageTokenLib(string fileName, uint256 lineNumber);
event __FunctionCoverageTokenLib(string fileName, uint256 fnId);
event __StatementCoverageTokenLib(string fileName, uint256 statementId);
event __BranchCoverageTokenLib(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageTokenLib(string fileName, uint256 branchId);
event __AssertPostCoverageTokenLib(string fileName, uint256 branchId);


    using SafeMath for uint256;

    // Struct for module data
    struct ModuleData {
        bytes32 name;
        address module;
        address moduleFactory;
        bool isArchived;
        uint8[] moduleTypes;
        uint256[] moduleIndexes;
        uint256 nameIndex;
    }

    // Structures to maintain checkpoints of balances for governance / dividends
    struct Checkpoint {
        uint256 checkpointId;
        uint256 value;
    }

    struct InvestorDataStorage {
        // List of investors who have ever held a non-zero token balance
        mapping (address => bool) investorListed;
        // List of token holders
        address[] investors;
        // Total number of non-zero token holders
        uint256 investorCount;
    }

    // Emit when Module is archived from the SecurityToken
    event ModuleArchived(uint8[] _types, address _module, uint256 _timestamp);
    // Emit when Module is unarchived from the SecurityToken
    event ModuleUnarchived(uint8[] _types, address _module, uint256 _timestamp);

    /**
    * @notice Archives a module attached to the SecurityToken
    * @param _moduleData Storage data
    * @param _module Address of module to archive
    */
    function archiveModule(ModuleData storage _moduleData, address _module) public {emit __FunctionCoverageTokenLib('./contracts/libraries/TokenLib.sol',1);

emit __CoverageTokenLib('./contracts/libraries/TokenLib.sol',47);
        emit __AssertPreCoverageTokenLib('./contracts/libraries/TokenLib.sol',1);
emit __StatementCoverageTokenLib('./contracts/libraries/TokenLib.sol',1);
require(!_moduleData.isArchived, "Module archived");emit __AssertPostCoverageTokenLib('./contracts/libraries/TokenLib.sol',1);

emit __CoverageTokenLib('./contracts/libraries/TokenLib.sol',48);
        emit __AssertPreCoverageTokenLib('./contracts/libraries/TokenLib.sol',2);
emit __StatementCoverageTokenLib('./contracts/libraries/TokenLib.sol',2);
require(_moduleData.module != address(0), "Module missing");emit __AssertPostCoverageTokenLib('./contracts/libraries/TokenLib.sol',2);

        /*solium-disable-next-line security/no-block-members*/
emit __CoverageTokenLib('./contracts/libraries/TokenLib.sol',50);
        emit __StatementCoverageTokenLib('./contracts/libraries/TokenLib.sol',3);
emit ModuleArchived(_moduleData.moduleTypes, _module, now);
emit __CoverageTokenLib('./contracts/libraries/TokenLib.sol',51);
        emit __StatementCoverageTokenLib('./contracts/libraries/TokenLib.sol',4);
_moduleData.isArchived = true;
    }

    /**
    * @notice Unarchives a module attached to the SecurityToken
    * @param _moduleData Storage data
    * @param _module Address of module to unarchive
    */
    function unarchiveModule(ModuleData storage _moduleData, address _module) public {emit __FunctionCoverageTokenLib('./contracts/libraries/TokenLib.sol',2);

emit __CoverageTokenLib('./contracts/libraries/TokenLib.sol',60);
        emit __AssertPreCoverageTokenLib('./contracts/libraries/TokenLib.sol',3);
emit __StatementCoverageTokenLib('./contracts/libraries/TokenLib.sol',5);
require(_moduleData.isArchived, "Module unarchived");emit __AssertPostCoverageTokenLib('./contracts/libraries/TokenLib.sol',3);

        /*solium-disable-next-line security/no-block-members*/
emit __CoverageTokenLib('./contracts/libraries/TokenLib.sol',62);
        emit __StatementCoverageTokenLib('./contracts/libraries/TokenLib.sol',6);
emit ModuleUnarchived(_moduleData.moduleTypes, _module, now);
emit __CoverageTokenLib('./contracts/libraries/TokenLib.sol',63);
        emit __StatementCoverageTokenLib('./contracts/libraries/TokenLib.sol',7);
_moduleData.isArchived = false;
    }

    /**
     * @notice Validates permissions with PermissionManager if it exists. If there's no permission return false
     * @dev Note that IModule withPerm will allow ST owner all permissions by default
     * @dev this allows individual modules to override this logic if needed (to not allow ST owner all permissions)
     * @param _modules is the modules to check permissions on
     * @param _delegate is the address of the delegate
     * @param _module is the address of the PermissionManager module
     * @param _perm is the permissions data
     * @return success
     */
    function checkPermission(address[] storage _modules, address _delegate, address _module, bytes32 _perm) public  returns(bool) {emit __FunctionCoverageTokenLib('./contracts/libraries/TokenLib.sol',3);

emit __CoverageTokenLib('./contracts/libraries/TokenLib.sol',77);
        emit __StatementCoverageTokenLib('./contracts/libraries/TokenLib.sol',8);
if (_modules.length == 0) {emit __BranchCoverageTokenLib('./contracts/libraries/TokenLib.sol',4,0);
emit __CoverageTokenLib('./contracts/libraries/TokenLib.sol',78);
            emit __StatementCoverageTokenLib('./contracts/libraries/TokenLib.sol',9);
return false;
        }else { emit __BranchCoverageTokenLib('./contracts/libraries/TokenLib.sol',4,1);}


emit __CoverageTokenLib('./contracts/libraries/TokenLib.sol',81);
        emit __StatementCoverageTokenLib('./contracts/libraries/TokenLib.sol',10);
for (uint8 i = 0; i < _modules.length; i++) {
emit __CoverageTokenLib('./contracts/libraries/TokenLib.sol',82);
            emit __StatementCoverageTokenLib('./contracts/libraries/TokenLib.sol',11);
if (IPermissionManager(_modules[i]).checkPermission(_delegate, _module, _perm)) {emit __BranchCoverageTokenLib('./contracts/libraries/TokenLib.sol',5,0);
emit __CoverageTokenLib('./contracts/libraries/TokenLib.sol',83);
                emit __StatementCoverageTokenLib('./contracts/libraries/TokenLib.sol',12);
return true;
            }else { emit __BranchCoverageTokenLib('./contracts/libraries/TokenLib.sol',5,1);}

        }

emit __CoverageTokenLib('./contracts/libraries/TokenLib.sol',87);
        emit __StatementCoverageTokenLib('./contracts/libraries/TokenLib.sol',13);
return false;
    }

    /**
     * @notice Queries a value at a defined checkpoint
     * @param _checkpoints is array of Checkpoint objects
     * @param _checkpointId is the Checkpoint ID to query
     * @param _currentValue is the Current value of checkpoint
     * @return uint256
     */
    function getValueAt(Checkpoint[] storage _checkpoints, uint256 _checkpointId, uint256 _currentValue) public  returns(uint256) {emit __FunctionCoverageTokenLib('./contracts/libraries/TokenLib.sol',4);

        //Checkpoint id 0 is when the token is first created - everyone has a zero balance
emit __CoverageTokenLib('./contracts/libraries/TokenLib.sol',99);
        emit __StatementCoverageTokenLib('./contracts/libraries/TokenLib.sol',14);
if (_checkpointId == 0) {emit __BranchCoverageTokenLib('./contracts/libraries/TokenLib.sol',6,0);
emit __CoverageTokenLib('./contracts/libraries/TokenLib.sol',100);
            emit __StatementCoverageTokenLib('./contracts/libraries/TokenLib.sol',15);
return 0;
        }else { emit __BranchCoverageTokenLib('./contracts/libraries/TokenLib.sol',6,1);}

emit __CoverageTokenLib('./contracts/libraries/TokenLib.sol',102);
        emit __StatementCoverageTokenLib('./contracts/libraries/TokenLib.sol',16);
if (_checkpoints.length == 0) {emit __BranchCoverageTokenLib('./contracts/libraries/TokenLib.sol',7,0);
emit __CoverageTokenLib('./contracts/libraries/TokenLib.sol',103);
            emit __StatementCoverageTokenLib('./contracts/libraries/TokenLib.sol',17);
return _currentValue;
        }else { emit __BranchCoverageTokenLib('./contracts/libraries/TokenLib.sol',7,1);}

emit __CoverageTokenLib('./contracts/libraries/TokenLib.sol',105);
        emit __StatementCoverageTokenLib('./contracts/libraries/TokenLib.sol',18);
if (_checkpoints[0].checkpointId >= _checkpointId) {emit __BranchCoverageTokenLib('./contracts/libraries/TokenLib.sol',8,0);
emit __CoverageTokenLib('./contracts/libraries/TokenLib.sol',106);
            emit __StatementCoverageTokenLib('./contracts/libraries/TokenLib.sol',19);
return _checkpoints[0].value;
        }else { emit __BranchCoverageTokenLib('./contracts/libraries/TokenLib.sol',8,1);}

emit __CoverageTokenLib('./contracts/libraries/TokenLib.sol',108);
        emit __StatementCoverageTokenLib('./contracts/libraries/TokenLib.sol',20);
if (_checkpoints[_checkpoints.length - 1].checkpointId < _checkpointId) {emit __BranchCoverageTokenLib('./contracts/libraries/TokenLib.sol',9,0);
emit __CoverageTokenLib('./contracts/libraries/TokenLib.sol',109);
            emit __StatementCoverageTokenLib('./contracts/libraries/TokenLib.sol',21);
return _currentValue;
        }else { emit __BranchCoverageTokenLib('./contracts/libraries/TokenLib.sol',9,1);}

emit __CoverageTokenLib('./contracts/libraries/TokenLib.sol',111);
        emit __StatementCoverageTokenLib('./contracts/libraries/TokenLib.sol',22);
if (_checkpoints[_checkpoints.length - 1].checkpointId == _checkpointId) {emit __BranchCoverageTokenLib('./contracts/libraries/TokenLib.sol',10,0);
emit __CoverageTokenLib('./contracts/libraries/TokenLib.sol',112);
            emit __StatementCoverageTokenLib('./contracts/libraries/TokenLib.sol',23);
return _checkpoints[_checkpoints.length - 1].value;
        }else { emit __BranchCoverageTokenLib('./contracts/libraries/TokenLib.sol',10,1);}

emit __CoverageTokenLib('./contracts/libraries/TokenLib.sol',114);
        emit __StatementCoverageTokenLib('./contracts/libraries/TokenLib.sol',24);
uint256 min = 0;
emit __CoverageTokenLib('./contracts/libraries/TokenLib.sol',115);
        emit __StatementCoverageTokenLib('./contracts/libraries/TokenLib.sol',25);
uint256 max = _checkpoints.length - 1;
emit __CoverageTokenLib('./contracts/libraries/TokenLib.sol',116);
        emit __StatementCoverageTokenLib('./contracts/libraries/TokenLib.sol',26);
while (max > min) {
emit __CoverageTokenLib('./contracts/libraries/TokenLib.sol',117);
            emit __StatementCoverageTokenLib('./contracts/libraries/TokenLib.sol',27);
uint256 mid = (max + min) / 2;
emit __CoverageTokenLib('./contracts/libraries/TokenLib.sol',118);
            emit __StatementCoverageTokenLib('./contracts/libraries/TokenLib.sol',28);
if (_checkpoints[mid].checkpointId == _checkpointId) {emit __BranchCoverageTokenLib('./contracts/libraries/TokenLib.sol',11,0);
emit __CoverageTokenLib('./contracts/libraries/TokenLib.sol',119);
                emit __StatementCoverageTokenLib('./contracts/libraries/TokenLib.sol',29);
max = mid;
emit __CoverageTokenLib('./contracts/libraries/TokenLib.sol',120);
                break;
            }else { emit __BranchCoverageTokenLib('./contracts/libraries/TokenLib.sol',11,1);}

emit __CoverageTokenLib('./contracts/libraries/TokenLib.sol',122);
            emit __StatementCoverageTokenLib('./contracts/libraries/TokenLib.sol',30);
if (_checkpoints[mid].checkpointId < _checkpointId) {emit __BranchCoverageTokenLib('./contracts/libraries/TokenLib.sol',12,0);
emit __CoverageTokenLib('./contracts/libraries/TokenLib.sol',123);
                emit __StatementCoverageTokenLib('./contracts/libraries/TokenLib.sol',31);
min = mid + 1;
            } else {emit __BranchCoverageTokenLib('./contracts/libraries/TokenLib.sol',12,1);
emit __CoverageTokenLib('./contracts/libraries/TokenLib.sol',125);
                emit __StatementCoverageTokenLib('./contracts/libraries/TokenLib.sol',32);
max = mid;
            }
        }
emit __CoverageTokenLib('./contracts/libraries/TokenLib.sol',128);
        emit __StatementCoverageTokenLib('./contracts/libraries/TokenLib.sol',33);
return _checkpoints[max].value;
    }

    /**
     * @notice Stores the changes to the checkpoint objects
     * @param _checkpoints is the affected checkpoint object array
     * @param _newValue is the new value that needs to be stored
     */
    function adjustCheckpoints(TokenLib.Checkpoint[] storage _checkpoints, uint256 _newValue, uint256 _currentCheckpointId) public {emit __FunctionCoverageTokenLib('./contracts/libraries/TokenLib.sol',5);

        //No checkpoints set yet
emit __CoverageTokenLib('./contracts/libraries/TokenLib.sol',138);
        emit __StatementCoverageTokenLib('./contracts/libraries/TokenLib.sol',34);
if (_currentCheckpointId == 0) {emit __BranchCoverageTokenLib('./contracts/libraries/TokenLib.sol',13,0);
emit __CoverageTokenLib('./contracts/libraries/TokenLib.sol',139);
            emit __StatementCoverageTokenLib('./contracts/libraries/TokenLib.sol',35);
return;
        }else { emit __BranchCoverageTokenLib('./contracts/libraries/TokenLib.sol',13,1);}

        //No new checkpoints since last update
emit __CoverageTokenLib('./contracts/libraries/TokenLib.sol',142);
        emit __StatementCoverageTokenLib('./contracts/libraries/TokenLib.sol',36);
if ((_checkpoints.length > 0) && (_checkpoints[_checkpoints.length - 1].checkpointId == _currentCheckpointId)) {emit __BranchCoverageTokenLib('./contracts/libraries/TokenLib.sol',14,0);
emit __CoverageTokenLib('./contracts/libraries/TokenLib.sol',143);
            emit __StatementCoverageTokenLib('./contracts/libraries/TokenLib.sol',37);
return;
        }else { emit __BranchCoverageTokenLib('./contracts/libraries/TokenLib.sol',14,1);}

        //New checkpoint, so record balance
emit __CoverageTokenLib('./contracts/libraries/TokenLib.sol',146);
        _checkpoints.push(
            TokenLib.Checkpoint({
                checkpointId: _currentCheckpointId,
                value: _newValue
            })
        );
    }

    /**
    * @notice Keeps track of the number of non-zero token holders
    * @param _investorData Date releated to investor metrics
    * @param _from Sender of transfer
    * @param _to Receiver of transfer
    * @param _value Value of transfer
    * @param _balanceTo Balance of the _to address
    * @param _balanceFrom Balance of the _from address
    */
    function adjustInvestorCount(
        InvestorDataStorage storage _investorData,
        address _from,
        address _to,
        uint256 _value,
        uint256 _balanceTo,
        uint256 _balanceFrom
        ) public  {emit __FunctionCoverageTokenLib('./contracts/libraries/TokenLib.sol',6);

emit __CoverageTokenLib('./contracts/libraries/TokenLib.sol',171);
        emit __StatementCoverageTokenLib('./contracts/libraries/TokenLib.sol',38);
if ((_value == 0) || (_from == _to)) {emit __BranchCoverageTokenLib('./contracts/libraries/TokenLib.sol',15,0);
emit __CoverageTokenLib('./contracts/libraries/TokenLib.sol',172);
            emit __StatementCoverageTokenLib('./contracts/libraries/TokenLib.sol',39);
return;
        }else { emit __BranchCoverageTokenLib('./contracts/libraries/TokenLib.sol',15,1);}

        // Check whether receiver is a new token holder
emit __CoverageTokenLib('./contracts/libraries/TokenLib.sol',175);
        emit __StatementCoverageTokenLib('./contracts/libraries/TokenLib.sol',40);
if ((_balanceTo == 0) && (_to != address(0))) {emit __BranchCoverageTokenLib('./contracts/libraries/TokenLib.sol',16,0);
emit __CoverageTokenLib('./contracts/libraries/TokenLib.sol',176);
            emit __StatementCoverageTokenLib('./contracts/libraries/TokenLib.sol',41);
_investorData.investorCount = (_investorData.investorCount).add(1);
        }else { emit __BranchCoverageTokenLib('./contracts/libraries/TokenLib.sol',16,1);}

        // Check whether sender is moving all of their tokens
emit __CoverageTokenLib('./contracts/libraries/TokenLib.sol',179);
        emit __StatementCoverageTokenLib('./contracts/libraries/TokenLib.sol',42);
if (_value == _balanceFrom) {emit __BranchCoverageTokenLib('./contracts/libraries/TokenLib.sol',17,0);
emit __CoverageTokenLib('./contracts/libraries/TokenLib.sol',180);
            emit __StatementCoverageTokenLib('./contracts/libraries/TokenLib.sol',43);
_investorData.investorCount = (_investorData.investorCount).sub(1);
        }else { emit __BranchCoverageTokenLib('./contracts/libraries/TokenLib.sol',17,1);}

        //Also adjust investor list
emit __CoverageTokenLib('./contracts/libraries/TokenLib.sol',183);
        emit __StatementCoverageTokenLib('./contracts/libraries/TokenLib.sol',44);
if (!_investorData.investorListed[_to] && (_to != address(0))) {emit __BranchCoverageTokenLib('./contracts/libraries/TokenLib.sol',18,0);
emit __CoverageTokenLib('./contracts/libraries/TokenLib.sol',184);
            _investorData.investors.push(_to);
emit __CoverageTokenLib('./contracts/libraries/TokenLib.sol',185);
            emit __StatementCoverageTokenLib('./contracts/libraries/TokenLib.sol',45);
_investorData.investorListed[_to] = true;
        }else { emit __BranchCoverageTokenLib('./contracts/libraries/TokenLib.sol',18,1);}


    }

}
