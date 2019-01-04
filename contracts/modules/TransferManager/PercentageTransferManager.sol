/**
 * DISCLAIMER: Under certain conditions, the limit could be bypassed if a large token holder 
 * redeems a huge portion of their tokens. It will cause the total supply to drop 
 * which can result in some other token holders having a percentage of tokens 
 * higher than the intended limit.
 */

pragma solidity ^0.4.24;

import "./ITransferManager.sol";
import "openzeppelin-solidity/contracts/math/SafeMath.sol";

/**
 * @title Transfer Manager module for limiting percentage of token supply a single address can hold
 */
contract PercentageTransferManager is ITransferManager {event __CoveragePercentageTransferManager(string fileName, uint256 lineNumber);
event __FunctionCoveragePercentageTransferManager(string fileName, uint256 fnId);
event __StatementCoveragePercentageTransferManager(string fileName, uint256 statementId);
event __BranchCoveragePercentageTransferManager(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoveragePercentageTransferManager(string fileName, uint256 branchId);
event __AssertPostCoveragePercentageTransferManager(string fileName, uint256 branchId);

    using SafeMath for uint256;

    // Permission key for modifying the whitelist
    bytes32 public constant WHITELIST = "WHITELIST";
    bytes32 public constant ADMIN = "ADMIN";

    // Maximum percentage that any holder can have, multiplied by 10**16 - e.g. 20% is 20 * 10**16
    uint256 public maxHolderPercentage;

    // Ignore transactions which are part of the primary issuance
    bool public allowPrimaryIssuance = true;

    // Addresses on this list are always able to send / receive tokens
    mapping (address => bool) public whitelist;

    event ModifyHolderPercentage(uint256 _oldHolderPercentage, uint256 _newHolderPercentage);
    event ModifyWhitelist(
        address _investor,
        uint256 _dateAdded,
        address _addedBy,
        bool    _valid
    );
    event SetAllowPrimaryIssuance(bool _allowPrimaryIssuance, uint256 _timestamp);

    /**
     * @notice Constructor
     * @param _securityToken Address of the security token
     * @param _polyAddress Address of the polytoken
     */
    constructor (address _securityToken, address _polyAddress)
    public
    Module(_securityToken, _polyAddress)
    {emit __FunctionCoveragePercentageTransferManager('./contracts/modules/TransferManager/PercentageTransferManager.sol',1);

    }

    /** @notice Used to verify the transfer transaction and prevent a given account to end up with more tokens than allowed
     * @param _from Address of the sender
     * @param _to Address of the receiver
     * @param _amount The amount of tokens to transfer
     */
    function verifyTransfer(address _from, address _to, uint256 _amount, bytes /* _data */, bool /* _isTransfer */) public returns(Result) {emit __FunctionCoveragePercentageTransferManager('./contracts/modules/TransferManager/PercentageTransferManager.sol',2);

emit __CoveragePercentageTransferManager('./contracts/modules/TransferManager/PercentageTransferManager.sol',58);
        emit __StatementCoveragePercentageTransferManager('./contracts/modules/TransferManager/PercentageTransferManager.sol',1);
if (!paused) {emit __BranchCoveragePercentageTransferManager('./contracts/modules/TransferManager/PercentageTransferManager.sol',1,0);
emit __CoveragePercentageTransferManager('./contracts/modules/TransferManager/PercentageTransferManager.sol',59);
            emit __StatementCoveragePercentageTransferManager('./contracts/modules/TransferManager/PercentageTransferManager.sol',2);
if (_from == address(0) && allowPrimaryIssuance) {emit __BranchCoveragePercentageTransferManager('./contracts/modules/TransferManager/PercentageTransferManager.sol',2,0);
emit __CoveragePercentageTransferManager('./contracts/modules/TransferManager/PercentageTransferManager.sol',60);
                emit __StatementCoveragePercentageTransferManager('./contracts/modules/TransferManager/PercentageTransferManager.sol',3);
return Result.NA;
            }else { emit __BranchCoveragePercentageTransferManager('./contracts/modules/TransferManager/PercentageTransferManager.sol',2,1);}

            // If an address is on the whitelist, it is allowed to hold more than maxHolderPercentage of the tokens.
emit __CoveragePercentageTransferManager('./contracts/modules/TransferManager/PercentageTransferManager.sol',63);
            emit __StatementCoveragePercentageTransferManager('./contracts/modules/TransferManager/PercentageTransferManager.sol',4);
if (whitelist[_to]) {emit __BranchCoveragePercentageTransferManager('./contracts/modules/TransferManager/PercentageTransferManager.sol',3,0);
emit __CoveragePercentageTransferManager('./contracts/modules/TransferManager/PercentageTransferManager.sol',64);
                emit __StatementCoveragePercentageTransferManager('./contracts/modules/TransferManager/PercentageTransferManager.sol',5);
return Result.NA;
            }else { emit __BranchCoveragePercentageTransferManager('./contracts/modules/TransferManager/PercentageTransferManager.sol',3,1);}

emit __CoveragePercentageTransferManager('./contracts/modules/TransferManager/PercentageTransferManager.sol',66);
            emit __StatementCoveragePercentageTransferManager('./contracts/modules/TransferManager/PercentageTransferManager.sol',6);
uint256 newBalance = ISecurityToken(securityToken).balanceOf(_to).add(_amount);
emit __CoveragePercentageTransferManager('./contracts/modules/TransferManager/PercentageTransferManager.sol',67);
            emit __StatementCoveragePercentageTransferManager('./contracts/modules/TransferManager/PercentageTransferManager.sol',7);
if (newBalance.mul(uint256(10)**18).div(ISecurityToken(securityToken).totalSupply()) > maxHolderPercentage) {emit __BranchCoveragePercentageTransferManager('./contracts/modules/TransferManager/PercentageTransferManager.sol',4,0);
emit __CoveragePercentageTransferManager('./contracts/modules/TransferManager/PercentageTransferManager.sol',68);
                emit __StatementCoveragePercentageTransferManager('./contracts/modules/TransferManager/PercentageTransferManager.sol',8);
return Result.INVALID;
            }else { emit __BranchCoveragePercentageTransferManager('./contracts/modules/TransferManager/PercentageTransferManager.sol',4,1);}

emit __CoveragePercentageTransferManager('./contracts/modules/TransferManager/PercentageTransferManager.sol',70);
            emit __StatementCoveragePercentageTransferManager('./contracts/modules/TransferManager/PercentageTransferManager.sol',9);
return Result.NA;
        }else { emit __BranchCoveragePercentageTransferManager('./contracts/modules/TransferManager/PercentageTransferManager.sol',1,1);}

emit __CoveragePercentageTransferManager('./contracts/modules/TransferManager/PercentageTransferManager.sol',72);
        emit __StatementCoveragePercentageTransferManager('./contracts/modules/TransferManager/PercentageTransferManager.sol',10);
return Result.NA;
    }

    /**
     * @notice Used to intialize the variables of the contract
     * @param _maxHolderPercentage Maximum amount of ST20 tokens(in %) can hold by the investor
     */
    function configure(uint256 _maxHolderPercentage, bool _allowPrimaryIssuance) public onlyFactory {emit __FunctionCoveragePercentageTransferManager('./contracts/modules/TransferManager/PercentageTransferManager.sol',3);

emit __CoveragePercentageTransferManager('./contracts/modules/TransferManager/PercentageTransferManager.sol',80);
        emit __StatementCoveragePercentageTransferManager('./contracts/modules/TransferManager/PercentageTransferManager.sol',11);
maxHolderPercentage = _maxHolderPercentage;
emit __CoveragePercentageTransferManager('./contracts/modules/TransferManager/PercentageTransferManager.sol',81);
        emit __StatementCoveragePercentageTransferManager('./contracts/modules/TransferManager/PercentageTransferManager.sol',12);
allowPrimaryIssuance = _allowPrimaryIssuance;
    }

    /**
     * @notice This function returns the signature of configure function
     */
    function getInitFunction() public  returns (bytes4) {emit __FunctionCoveragePercentageTransferManager('./contracts/modules/TransferManager/PercentageTransferManager.sol',4);

emit __CoveragePercentageTransferManager('./contracts/modules/TransferManager/PercentageTransferManager.sol',88);
        emit __StatementCoveragePercentageTransferManager('./contracts/modules/TransferManager/PercentageTransferManager.sol',13);
return bytes4(keccak256("configure(uint256,bool)"));
    }

    /**
    * @notice sets the maximum percentage that an individual token holder can hold
    * @param _maxHolderPercentage is the new maximum percentage (multiplied by 10**16)
    */
    function changeHolderPercentage(uint256 _maxHolderPercentage) public withPerm(ADMIN) {emit __FunctionCoveragePercentageTransferManager('./contracts/modules/TransferManager/PercentageTransferManager.sol',5);

emit __CoveragePercentageTransferManager('./contracts/modules/TransferManager/PercentageTransferManager.sol',96);
        emit __StatementCoveragePercentageTransferManager('./contracts/modules/TransferManager/PercentageTransferManager.sol',14);
emit ModifyHolderPercentage(maxHolderPercentage, _maxHolderPercentage);
emit __CoveragePercentageTransferManager('./contracts/modules/TransferManager/PercentageTransferManager.sol',97);
        emit __StatementCoveragePercentageTransferManager('./contracts/modules/TransferManager/PercentageTransferManager.sol',15);
maxHolderPercentage = _maxHolderPercentage;
    }

    /**
    * @notice adds or removes addresses from the whitelist.
    * @param _investor is the address to whitelist
    * @param _valid whether or not the address it to be added or removed from the whitelist
    */
    function modifyWhitelist(address _investor, bool _valid) public withPerm(WHITELIST) {emit __FunctionCoveragePercentageTransferManager('./contracts/modules/TransferManager/PercentageTransferManager.sol',6);

emit __CoveragePercentageTransferManager('./contracts/modules/TransferManager/PercentageTransferManager.sol',106);
        emit __StatementCoveragePercentageTransferManager('./contracts/modules/TransferManager/PercentageTransferManager.sol',16);
whitelist[_investor] = _valid;
        /*solium-disable-next-line security/no-block-members*/
emit __CoveragePercentageTransferManager('./contracts/modules/TransferManager/PercentageTransferManager.sol',108);
        emit __StatementCoveragePercentageTransferManager('./contracts/modules/TransferManager/PercentageTransferManager.sol',17);
emit ModifyWhitelist(_investor, now, msg.sender, _valid);
    }

    /**
    * @notice adds or removes addresses from the whitelist.
    * @param _investors Array of the addresses to whitelist
    * @param _valids Array of boolean value to decide whether or not the address it to be added or removed from the whitelist
    */
    function modifyWhitelistMulti(address[] _investors, bool[] _valids) public withPerm(WHITELIST) {emit __FunctionCoveragePercentageTransferManager('./contracts/modules/TransferManager/PercentageTransferManager.sol',7);

emit __CoveragePercentageTransferManager('./contracts/modules/TransferManager/PercentageTransferManager.sol',117);
        emit __AssertPreCoveragePercentageTransferManager('./contracts/modules/TransferManager/PercentageTransferManager.sol',5);
emit __StatementCoveragePercentageTransferManager('./contracts/modules/TransferManager/PercentageTransferManager.sol',18);
require(_investors.length == _valids.length, "Input array length mis-match");emit __AssertPostCoveragePercentageTransferManager('./contracts/modules/TransferManager/PercentageTransferManager.sol',5);

emit __CoveragePercentageTransferManager('./contracts/modules/TransferManager/PercentageTransferManager.sol',118);
        emit __StatementCoveragePercentageTransferManager('./contracts/modules/TransferManager/PercentageTransferManager.sol',19);
for (uint i = 0; i < _investors.length; i++) {
emit __CoveragePercentageTransferManager('./contracts/modules/TransferManager/PercentageTransferManager.sol',119);
            emit __StatementCoveragePercentageTransferManager('./contracts/modules/TransferManager/PercentageTransferManager.sol',20);
modifyWhitelist(_investors[i], _valids[i]);
        }
    }

    /**
    * @notice sets whether or not to consider primary issuance transfers
    * @param _allowPrimaryIssuance whether to allow all primary issuance transfers
    */
    function setAllowPrimaryIssuance(bool _allowPrimaryIssuance) public withPerm(ADMIN) {emit __FunctionCoveragePercentageTransferManager('./contracts/modules/TransferManager/PercentageTransferManager.sol',8);

emit __CoveragePercentageTransferManager('./contracts/modules/TransferManager/PercentageTransferManager.sol',128);
        emit __AssertPreCoveragePercentageTransferManager('./contracts/modules/TransferManager/PercentageTransferManager.sol',6);
emit __StatementCoveragePercentageTransferManager('./contracts/modules/TransferManager/PercentageTransferManager.sol',21);
require(_allowPrimaryIssuance != allowPrimaryIssuance, "Must change setting");emit __AssertPostCoveragePercentageTransferManager('./contracts/modules/TransferManager/PercentageTransferManager.sol',6);

emit __CoveragePercentageTransferManager('./contracts/modules/TransferManager/PercentageTransferManager.sol',129);
        emit __StatementCoveragePercentageTransferManager('./contracts/modules/TransferManager/PercentageTransferManager.sol',22);
allowPrimaryIssuance = _allowPrimaryIssuance;
        /*solium-disable-next-line security/no-block-members*/
emit __CoveragePercentageTransferManager('./contracts/modules/TransferManager/PercentageTransferManager.sol',131);
        emit __StatementCoveragePercentageTransferManager('./contracts/modules/TransferManager/PercentageTransferManager.sol',23);
emit SetAllowPrimaryIssuance(_allowPrimaryIssuance, now);
    }

    /**
     * @notice Return the permissions flag that are associated with Percentage transfer Manager
     */
    function getPermissions() public  returns(bytes32[]) {emit __FunctionCoveragePercentageTransferManager('./contracts/modules/TransferManager/PercentageTransferManager.sol',9);

emit __CoveragePercentageTransferManager('./contracts/modules/TransferManager/PercentageTransferManager.sol',138);
        emit __StatementCoveragePercentageTransferManager('./contracts/modules/TransferManager/PercentageTransferManager.sol',24);
bytes32[] memory allPermissions = new bytes32[](2);
emit __CoveragePercentageTransferManager('./contracts/modules/TransferManager/PercentageTransferManager.sol',139);
        emit __StatementCoveragePercentageTransferManager('./contracts/modules/TransferManager/PercentageTransferManager.sol',25);
allPermissions[0] = WHITELIST;
emit __CoveragePercentageTransferManager('./contracts/modules/TransferManager/PercentageTransferManager.sol',140);
        emit __StatementCoveragePercentageTransferManager('./contracts/modules/TransferManager/PercentageTransferManager.sol',26);
allPermissions[1] = ADMIN;
emit __CoveragePercentageTransferManager('./contracts/modules/TransferManager/PercentageTransferManager.sol',141);
        emit __StatementCoveragePercentageTransferManager('./contracts/modules/TransferManager/PercentageTransferManager.sol',27);
return allPermissions;
    }

}
