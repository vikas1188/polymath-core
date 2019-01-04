pragma solidity ^0.4.24;

import "./ITransferManager.sol";
import "openzeppelin-solidity/contracts/math/SafeMath.sol";

/**
 * @title Transfer Manager module for manually approving transactions between accounts
 */
contract ManualApprovalTransferManager is ITransferManager {event __CoverageManualApprovalTransferManager(string fileName, uint256 lineNumber);
event __FunctionCoverageManualApprovalTransferManager(string fileName, uint256 fnId);
event __StatementCoverageManualApprovalTransferManager(string fileName, uint256 statementId);
event __BranchCoverageManualApprovalTransferManager(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageManualApprovalTransferManager(string fileName, uint256 branchId);
event __AssertPostCoverageManualApprovalTransferManager(string fileName, uint256 branchId);

    using SafeMath for uint256;

    //Address from which issuances come
    address public issuanceAddress = address(0);

    //Address which can sign whitelist changes
    address public signingAddress = address(0);

    bytes32 public constant TRANSFER_APPROVAL = "TRANSFER_APPROVAL";

    //Manual approval is an allowance (that has been approved) with an expiry time
    struct ManualApproval {
        address from;
        address to;
        uint256 allowance;
        uint256 expiryTime;
        bytes32 description;
    }

    mapping (address => mapping (address => uint256)) public approvalIndex;
    // An array to track all approvals
    ManualApproval[] public approvals;

    event AddManualApproval(
        address indexed _from,
        address indexed _to,
        uint256 _allowance,
        uint256 _expiryTime,
        bytes32 _description,
        address indexed _addedBy
    );

    event ModifyManualApproval(
        address indexed _from,
        address indexed _to,
        uint256 _expiryTime,
        uint256 _allowance,
        bytes32 _description,
        address indexed _edittedBy
    );

    event RevokeManualApproval(
        address indexed _from,
        address indexed _to,
        address indexed _addedBy
    );

    /**
     * @notice Constructor
     * @param _securityToken Address of the security token
     * @param _polyAddress Address of the polytoken
     */
    constructor (address _securityToken, address _polyAddress)
    public
    Module(_securityToken, _polyAddress)
    {emit __FunctionCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',1);

    }

    /**
     * @notice This function returns the signature of configure function
     */
    function getInitFunction() public  returns (bytes4) {emit __FunctionCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',2);

emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',72);
        emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',1);
return bytes4(0);
    }

    /** 
     * @notice Used to verify the transfer transaction and allow a manually approved transqaction to bypass other restrictions
     * @param _from Address of the sender
     * @param _to Address of the receiver
     * @param _amount The amount of tokens to transfer
     * @param _isTransfer Whether or not this is an actual transfer or just a test to see if the tokens would be transferrable
     */
    function verifyTransfer(address _from, address _to, uint256 _amount, bytes /* _data */, bool _isTransfer) public returns(Result) {emit __FunctionCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',3);

        // function must only be called by the associated security token if _isTransfer == true
emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',84);
        emit __AssertPreCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',1);
emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',2);
require(_isTransfer == false || msg.sender == securityToken, "Sender is not the owner");emit __AssertPostCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',1);

       
emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',86);
        emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',3);
if (!paused && approvalIndex[_from][_to] != 0) {emit __BranchCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',2,0);
emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',87);
            emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',4);
uint256 index = approvalIndex[_from][_to] - 1;
emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',88);
            emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',5);
ManualApproval storage approval = approvals[index];
emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',89);
            emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',6);
if ((approval.expiryTime >= now) && (approval.allowance >= _amount)) {emit __BranchCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',3,0);
emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',90);
                emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',7);
if (_isTransfer) {emit __BranchCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',4,0);
emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',91);
                    emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',8);
approval.allowance = approval.allowance.sub(_amount);
                }else { emit __BranchCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',4,1);}

emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',93);
                emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',9);
return Result.VALID;
            }else { emit __BranchCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',3,1);}

        }else { emit __BranchCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',2,1);}

emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',96);
        emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',10);
return Result.NA;
    }

    /**
    * @notice Adds a pair of addresses to manual approvals
    * @param _from is the address from which transfers are approved
    * @param _to is the address to which transfers are approved
    * @param _allowance is the approved amount of tokens
    * @param _expiryTime is the time until which the transfer is allowed
    * @param _description Description about the manual approval
    */
    function addManualApproval(
        address _from,
        address _to,
        uint256 _allowance,
        uint256 _expiryTime,
        bytes32 _description
    ) 
        external 
        withPerm(TRANSFER_APPROVAL)
    {emit __FunctionCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',4);

emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',117);
        emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',11);
_addManualApproval(_from, _to, _allowance, _expiryTime, _description);
    }

    function _addManualApproval(address _from, address _to, uint256 _allowance, uint256 _expiryTime, bytes32 _description) internal {emit __FunctionCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',5);

emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',121);
        emit __AssertPreCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',5);
emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',12);
require(_to != address(0), "Invalid to address");emit __AssertPostCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',5);

emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',122);
        emit __AssertPreCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',6);
emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',13);
require(_expiryTime > now, "Invalid expiry time");emit __AssertPostCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',6);

emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',123);
        emit __AssertPreCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',7);
emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',14);
require(_allowance > 0, "Invalid allowance");emit __AssertPostCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',7);

emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',124);
        emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',15);
if (approvalIndex[_from][_to] != 0) {emit __BranchCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',8,0);
emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',125);
            emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',16);
uint256 index = approvalIndex[_from][_to] - 1;
emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',126);
            emit __AssertPreCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',9);
emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',17);
require(approvals[index].expiryTime < now || approvals[index].allowance == 0, "Approval already exists");emit __AssertPostCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',9);

emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',127);
            emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',18);
_revokeManualApproval(_from, _to);
        }else { emit __BranchCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',8,1);}

emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',129);
        approvals.push(ManualApproval(_from, _to, _allowance, _expiryTime, _description));
emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',130);
        emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',19);
approvalIndex[_from][_to] = approvals.length;
emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',131);
        emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',20);
emit AddManualApproval(_from, _to, _allowance, _expiryTime, _description, msg.sender);
    }

    /**
    * @notice Adds mutiple manual approvals in batch
    * @param _from is the address array from which transfers are approved
    * @param _to is the address array to which transfers are approved
    * @param _allowances is the array of approved amounts 
    * @param _expiryTimes is the array of the times until which eath transfer is allowed
    * @param _descriptions is the description array for these manual approvals
    */
    function addManualApprovalMulti(
        address[] _from,
        address[] _to,
        uint256[] _allowances,
        uint256[] _expiryTimes,
        bytes32[] _descriptions
    ) 
        external 
        withPerm(TRANSFER_APPROVAL)
    {emit __FunctionCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',6);

emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',152);
        emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',21);
_checkInputLengthArray(_from, _to, _allowances, _expiryTimes, _descriptions);
emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',153);
        emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',22);
for (uint256 i = 0; i < _from.length; i++){
emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',154);
            emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',23);
_addManualApproval(_from[i], _to[i], _allowances[i], _expiryTimes[i], _descriptions[i]);
        }
    }

    /**
    * @notice Modify the existing manual approvals
    * @param _from is the address from which transfers are approved
    * @param _to is the address to which transfers are approved
    * @param _expiryTime is the time until which the transfer is allowed
    * @param _changedAllowance is the changed allowance
    * @param _description Description about the manual approval
    * @param _change uint values which tells whether the allowances will be increased (1) or decreased (0)
    * or any value when there is no change in allowances
    */
    function modifyManualApproval(
        address _from,
        address _to,
        uint256 _expiryTime,
        uint256 _changedAllowance,
        bytes32 _description,
        uint8 _change
    ) 
        external
        withPerm(TRANSFER_APPROVAL)
    {emit __FunctionCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',7);

emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',179);
        emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',24);
_modifyManualApproval(_from, _to, _expiryTime, _changedAllowance, _description, _change);
    }

    function _modifyManualApproval(
        address _from,
        address _to,
        uint256 _expiryTime,
        uint256 _changedAllowance,
        bytes32 _description,
        uint8 _change
    ) 
        internal 
    {emit __FunctionCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',8);

emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',192);
        emit __AssertPreCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',10);
emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',25);
require(_to != address(0), "Invalid to address");emit __AssertPostCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',10);

        /*solium-disable-next-line security/no-block-members*/
emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',194);
        emit __AssertPreCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',11);
emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',26);
require(_expiryTime > now, "Invalid expiry time");emit __AssertPostCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',11);

emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',195);
        emit __AssertPreCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',12);
emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',27);
require(approvalIndex[_from][_to] != 0, "Approval not present");emit __AssertPostCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',12);

emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',196);
        emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',28);
uint256 index = approvalIndex[_from][_to] - 1;
emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',197);
        emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',29);
ManualApproval storage approval = approvals[index];
emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',198);
        emit __AssertPreCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',13);
emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',30);
require(approval.allowance != 0 && approval.expiryTime > now, "Not allowed");emit __AssertPostCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',13);

emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',199);
        emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',31);
uint256 currentAllowance = approval.allowance;
emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',200);
        uint256 newAllowance;
emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',201);
        emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',32);
if (_change == 1) {emit __BranchCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',14,0);
            // Allowance get increased
emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',203);
            emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',33);
newAllowance = currentAllowance.add(_changedAllowance);
emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',204);
            emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',34);
approval.allowance = newAllowance;
        } else {emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',35);
emit __BranchCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',14,1);if (_change == 0) {emit __BranchCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',15,0);
            // Allowance get decreased
emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',207);
            emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',36);
if (_changedAllowance > currentAllowance) {emit __BranchCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',16,0);
emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',208);
                emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',37);
newAllowance = 0;
emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',209);
                emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',38);
approval.allowance = newAllowance;
            } else {emit __BranchCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',16,1);
emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',211);
                emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',39);
newAllowance = currentAllowance.sub(_changedAllowance);
emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',212);
                emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',40);
approval.allowance = newAllowance;
            }
        } else {emit __BranchCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',15,1);
            // No change in the Allowance
emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',216);
            emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',41);
newAllowance = currentAllowance;
        }}
        // Greedy storage technique
emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',219);
        emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',42);
if (approval.expiryTime != _expiryTime) {emit __BranchCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',17,0);
emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',220);
            emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',43);
approval.expiryTime = _expiryTime;
        }else { emit __BranchCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',17,1);}

emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',222);
        emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',44);
if (approval.description != _description) {emit __BranchCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',18,0);
emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',223);
            emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',45);
approval.description = _description;
        }else { emit __BranchCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',18,1);}

emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',225);
        emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',46);
emit ModifyManualApproval(_from, _to, _expiryTime, newAllowance, _description, msg.sender);
    }

    /**
     * @notice Adds mutiple manual approvals in batch
     * @param _from is the address array from which transfers are approved
     * @param _to is the address array to which transfers are approved
     * @param _expiryTimes is the array of the times until which eath transfer is allowed
     * @param _changedAllowances is the array of approved amounts 
     * @param _descriptions is the description array for these manual approvals
     * @param _changes Array of uint values which tells whether the allowances will be increased (1) or decreased (0)
     * or any value when there is no change in allowances
     */
    function modifyManualApprovalMulti(
        address[] _from,
        address[] _to,
        uint256[] _expiryTimes,
        uint256[] _changedAllowances,
        bytes32[] _descriptions,
        uint8[] _changes
    )
        public
        withPerm(TRANSFER_APPROVAL)
    {emit __FunctionCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',9);

emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',249);
        emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',47);
_checkInputLengthArray(_from, _to, _changedAllowances, _expiryTimes, _descriptions);
emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',250);
        emit __AssertPreCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',19);
emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',48);
require(_changes.length == _changedAllowances.length, "Input length array mismatch");emit __AssertPostCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',19);

emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',251);
        emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',49);
for (uint256 i = 0; i < _from.length; i++) {
emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',252);
            emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',50);
_modifyManualApproval(_from[i], _to[i], _expiryTimes[i], _changedAllowances[i], _descriptions[i], _changes[i]);
        }
    }

    /**
    * @notice Removes a pairs of addresses from manual approvals
    * @param _from is the address from which transfers are approved
    * @param _to is the address to which transfers are approved
    */
    function revokeManualApproval(address _from, address _to) external withPerm(TRANSFER_APPROVAL) {emit __FunctionCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',10);

emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',262);
        emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',51);
_revokeManualApproval(_from, _to);
    }

    function _revokeManualApproval(address _from, address _to) internal {emit __FunctionCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',11);

emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',266);
        emit __AssertPreCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',20);
emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',52);
require(approvalIndex[_from][_to] != 0, "Approval not exist");emit __AssertPostCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',20);
 

        // find the record in active approvals array & delete it
emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',269);
        emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',53);
uint256 index = approvalIndex[_from][_to] - 1;
emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',270);
        emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',54);
if (index != approvals.length -1) {emit __BranchCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',21,0);
emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',271);
            emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',55);
approvals[index] = approvals[approvals.length -1];
emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',272);
            emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',56);
approvalIndex[approvals[index].from][approvals[index].to] = index + 1; 
        }else { emit __BranchCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',21,1);}

emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',274);
        delete approvalIndex[_from][_to];
emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',275);
        approvals.length--;
emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',276);
        emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',57);
emit RevokeManualApproval(_from, _to, msg.sender);
    }

    /**
    * @notice Removes mutiple pairs of addresses from manual approvals
    * @param _from is the address array from which transfers are approved
    * @param _to is the address array to which transfers are approved
    */
    function revokeManualApprovalMulti(address[] _from, address[] _to) external withPerm(TRANSFER_APPROVAL) {emit __FunctionCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',12);

emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',285);
        emit __AssertPreCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',22);
emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',58);
require(_from.length == _to.length, "Input array length mismatch");emit __AssertPostCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',22);

emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',286);
        emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',59);
for(uint256 i = 0; i < _from.length; i++){
emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',287);
            emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',60);
_revokeManualApproval(_from[i], _to[i]);
        }
    }

    function _checkInputLengthArray(
        address[] _from,
        address[] _to,
        uint256[] _expiryTimes,
        uint256[] _allowances,
        bytes32[] _descriptions
    ) 
        internal
         
    {emit __FunctionCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',13);

emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',301);
        emit __AssertPreCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',23);
emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',61);
require(_from.length == _to.length &&
        _to.length == _allowances.length &&
        _allowances.length == _expiryTimes.length &&
        _expiryTimes.length == _descriptions.length,
        "Input array length mismatch"
        );emit __AssertPostCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',23);

    }

    /**
     * @notice Returns the all active approvals corresponds to an address
     * @param _user Address of the holder corresponds to whom list of manual approvals 
     * need to return
     * @return address[] addresses from
     * @return address[] addresses to
     * @return uint256[] allowances provided to the approvals
     * @return uint256[] expiry times provided to the approvals
     * @return bytes32[] descriptions provided to the approvals
     */
    function getActiveApprovalsToUser(address _user) external  returns(address[], address[], uint256[], uint256[], bytes32[]) {emit __FunctionCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',14);

emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',320);
        emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',62);
uint256 counter = 0;
emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',321);
        emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',63);
for (uint256 i = 0; i < approvals.length; i++) {
emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',322);
            emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',64);
if ((approvals[i].from == _user || approvals[i].to == _user)
                && approvals[i].expiryTime >= now)
                {emit __BranchCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',24,0);emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',324);
counter ++;}else { emit __BranchCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',24,1);}

        }

emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',327);
        emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',65);
address[] memory from = new address[](counter);
emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',328);
        emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',66);
address[] memory to = new address[](counter);
emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',329);
        emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',67);
uint256[] memory allowance = new uint256[](counter);
emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',330);
        emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',68);
uint256[] memory expiryTime = new uint256[](counter);
emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',331);
        emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',69);
bytes32[] memory description = new bytes32[](counter);

emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',333);
        emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',70);
counter = 0;
emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',334);
        emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',71);
for (i = 0; i < approvals.length; i++) {
emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',335);
            emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',72);
if ((approvals[i].from == _user || approvals[i].to == _user)
                && approvals[i].expiryTime >= now) {emit __BranchCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',25,0);

emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',338);
                emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',73);
from[counter]=approvals[i].from;
emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',339);
                emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',74);
to[counter]=approvals[i].to;
emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',340);
                emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',75);
allowance[counter]=approvals[i].allowance;
emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',341);
                emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',76);
expiryTime[counter]=approvals[i].expiryTime;
emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',342);
                emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',77);
description[counter]=approvals[i].description;
emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',343);
                counter ++;
            }else { emit __BranchCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',25,1);}
 
        }
emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',346);
        emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',78);
return (from, to, allowance, expiryTime, description);
    }

    /**
     * @notice Get the details of the approval corresponds to _from & _to addresses
     * @param _from Address of the sender
     * @param _to Address of the receiver
     * @return uint256 expiryTime of the approval
     * @return uint256 allowance provided to the approval
     * @return uint256 Description provided to the approval
     */
    function getApprovalDetails(address _from, address _to) external  returns(uint256, uint256, bytes32) {emit __FunctionCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',15);

emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',358);
        emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',79);
if (approvalIndex[_from][_to] != 0) {emit __BranchCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',26,0);
emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',359);
            emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',80);
uint256 index = approvalIndex[_from][_to] - 1;
emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',360);
            emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',81);
if (index < approvals.length) {emit __BranchCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',27,0);
emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',361);
                emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',82);
ManualApproval storage approval = approvals[index];
emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',362);
                emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',83);
return(
                    approval.expiryTime,
                    approval.allowance,
                    approval.description
                );
            }else { emit __BranchCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',27,1);}

        }else { emit __BranchCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',26,1);}

emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',369);
        emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',84);
return (uint256(0), uint256(0), bytes32(0));
    }

    /**
    * @notice Returns the current number of active approvals
    */
    function getTotalApprovalsLength() external  returns(uint256) {emit __FunctionCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',16);

emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',376);
        emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',85);
return approvals.length;
    }

    /**
     * @notice Get the details of all approvals
     * @return address[] addresses from
     * @return address[] addresses to
     * @return uint256[] allowances provided to the approvals
     * @return uint256[] expiry times provided to the approvals
     * @return bytes32[] descriptions provided to the approvals
     */
    function getAllApprovals() external  returns(address[], address[], uint256[], uint256[], bytes32[]) {emit __FunctionCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',17);

emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',388);
        emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',86);
address[] memory from = new address[](approvals.length);
emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',389);
        emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',87);
address[] memory to = new address[](approvals.length);
emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',390);
        emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',88);
uint256[] memory allowance = new uint256[](approvals.length);
emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',391);
        emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',89);
uint256[] memory expiryTime = new uint256[](approvals.length);
emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',392);
        emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',90);
bytes32[] memory description = new bytes32[](approvals.length);

emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',394);
        emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',91);
for (uint256 i = 0; i < approvals.length; i++) {

emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',396);
            emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',92);
from[i]=approvals[i].from;
emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',397);
            emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',93);
to[i]=approvals[i].to;
emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',398);
            emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',94);
allowance[i]=approvals[i].allowance;
emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',399);
            emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',95);
expiryTime[i]=approvals[i].expiryTime;
emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',400);
            emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',96);
description[i]=approvals[i].description;

        }

emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',404);
        emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',97);
return (from, to, allowance, expiryTime, description);
        
    }

    /**
     * @notice Returns the permissions flag that are associated with ManualApproval transfer manager
     */
    function getPermissions() public  returns(bytes32[]) {emit __FunctionCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',18);

emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',412);
        emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',98);
bytes32[] memory allPermissions = new bytes32[](1);
emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',413);
        emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',99);
allPermissions[0] = TRANSFER_APPROVAL;
emit __CoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',414);
        emit __StatementCoverageManualApprovalTransferManager('./contracts/modules/TransferManager/ManualApprovalTransferManager.sol',100);
return allPermissions;
    }
}
