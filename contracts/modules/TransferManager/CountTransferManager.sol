pragma solidity ^0.4.24;

import "./ITransferManager.sol";

/**
 * @title Transfer Manager for limiting maximum number of token holders
 */
contract CountTransferManager is ITransferManager {event __CoverageCountTransferManager(string fileName, uint256 lineNumber);
event __FunctionCoverageCountTransferManager(string fileName, uint256 fnId);
event __StatementCoverageCountTransferManager(string fileName, uint256 statementId);
event __BranchCoverageCountTransferManager(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageCountTransferManager(string fileName, uint256 branchId);
event __AssertPostCoverageCountTransferManager(string fileName, uint256 branchId);


    // The maximum number of concurrent token holders
    uint256 public maxHolderCount;

    bytes32 public constant ADMIN = "ADMIN";

    event ModifyHolderCount(uint256 _oldHolderCount, uint256 _newHolderCount);

    /**
     * @notice Constructor
     * @param _securityToken Address of the security token
     * @param _polyAddress Address of the polytoken
     */
    constructor (address _securityToken, address _polyAddress)
    public
    Module(_securityToken, _polyAddress)
    {emit __FunctionCoverageCountTransferManager('./contracts/modules/TransferManager/CountTransferManager.sol',1);

    }

    /** @notice Used to verify the transfer transaction and prevent a transfer if it passes the allowed amount of token holders
     * @param _from Address of the sender
     * @param _to Address of the receiver
     * @param _amount Amount to send
     */
    function verifyTransfer(
        address _from,
        address _to,
        uint256 _amount,
        bytes /* _data */,
        bool /* _isTransfer */
    )
        public
        returns(Result)
    {emit __FunctionCoverageCountTransferManager('./contracts/modules/TransferManager/CountTransferManager.sol',2);

emit __CoverageCountTransferManager('./contracts/modules/TransferManager/CountTransferManager.sol',43);
        emit __StatementCoverageCountTransferManager('./contracts/modules/TransferManager/CountTransferManager.sol',1);
if (!paused) {emit __BranchCoverageCountTransferManager('./contracts/modules/TransferManager/CountTransferManager.sol',1,0);
emit __CoverageCountTransferManager('./contracts/modules/TransferManager/CountTransferManager.sol',44);
            emit __StatementCoverageCountTransferManager('./contracts/modules/TransferManager/CountTransferManager.sol',2);
if (maxHolderCount < ISecurityToken(securityToken).getInvestorCount()) {emit __BranchCoverageCountTransferManager('./contracts/modules/TransferManager/CountTransferManager.sol',2,0);
                // Allow transfers to existing maxHolders
emit __CoverageCountTransferManager('./contracts/modules/TransferManager/CountTransferManager.sol',46);
                emit __StatementCoverageCountTransferManager('./contracts/modules/TransferManager/CountTransferManager.sol',3);
if (ISecurityToken(securityToken).balanceOf(_to) != 0 || ISecurityToken(securityToken).balanceOf(_from) == _amount) {emit __BranchCoverageCountTransferManager('./contracts/modules/TransferManager/CountTransferManager.sol',3,0);
emit __CoverageCountTransferManager('./contracts/modules/TransferManager/CountTransferManager.sol',47);
                    emit __StatementCoverageCountTransferManager('./contracts/modules/TransferManager/CountTransferManager.sol',4);
return Result.NA;
                }else { emit __BranchCoverageCountTransferManager('./contracts/modules/TransferManager/CountTransferManager.sol',3,1);}

emit __CoverageCountTransferManager('./contracts/modules/TransferManager/CountTransferManager.sol',49);
                emit __StatementCoverageCountTransferManager('./contracts/modules/TransferManager/CountTransferManager.sol',5);
return Result.INVALID;
            }else { emit __BranchCoverageCountTransferManager('./contracts/modules/TransferManager/CountTransferManager.sol',2,1);}

emit __CoverageCountTransferManager('./contracts/modules/TransferManager/CountTransferManager.sol',51);
            emit __StatementCoverageCountTransferManager('./contracts/modules/TransferManager/CountTransferManager.sol',6);
return Result.NA;
        }else { emit __BranchCoverageCountTransferManager('./contracts/modules/TransferManager/CountTransferManager.sol',1,1);}

emit __CoverageCountTransferManager('./contracts/modules/TransferManager/CountTransferManager.sol',53);
        emit __StatementCoverageCountTransferManager('./contracts/modules/TransferManager/CountTransferManager.sol',7);
return Result.NA;
    }

    /**
     * @notice Used to initialize the variables of the contract
     * @param _maxHolderCount Maximum no. of holders this module allows the SecurityToken to have
     */
    function configure(uint256 _maxHolderCount) public onlyFactory {emit __FunctionCoverageCountTransferManager('./contracts/modules/TransferManager/CountTransferManager.sol',3);

emit __CoverageCountTransferManager('./contracts/modules/TransferManager/CountTransferManager.sol',61);
        emit __StatementCoverageCountTransferManager('./contracts/modules/TransferManager/CountTransferManager.sol',8);
maxHolderCount = _maxHolderCount;
    }

    /**
    * @notice Sets the cap for the amount of token holders there can be
    * @param _maxHolderCount is the new maximum amount of token holders
    */
    function changeHolderCount(uint256 _maxHolderCount) public withPerm(ADMIN) {emit __FunctionCoverageCountTransferManager('./contracts/modules/TransferManager/CountTransferManager.sol',4);

emit __CoverageCountTransferManager('./contracts/modules/TransferManager/CountTransferManager.sol',69);
        emit __StatementCoverageCountTransferManager('./contracts/modules/TransferManager/CountTransferManager.sol',9);
emit ModifyHolderCount(maxHolderCount, _maxHolderCount);
emit __CoverageCountTransferManager('./contracts/modules/TransferManager/CountTransferManager.sol',70);
        emit __StatementCoverageCountTransferManager('./contracts/modules/TransferManager/CountTransferManager.sol',10);
maxHolderCount = _maxHolderCount;
    }

    /**
     * @notice This function returns the signature of configure function
     */
    function getInitFunction() public  returns (bytes4) {emit __FunctionCoverageCountTransferManager('./contracts/modules/TransferManager/CountTransferManager.sol',5);

emit __CoverageCountTransferManager('./contracts/modules/TransferManager/CountTransferManager.sol',77);
        emit __StatementCoverageCountTransferManager('./contracts/modules/TransferManager/CountTransferManager.sol',11);
return bytes4(keccak256("configure(uint256)"));
    }

    /**
     * @notice Returns the permissions flag that are associated with CountTransferManager
     */
    function getPermissions() public  returns(bytes32[]) {emit __FunctionCoverageCountTransferManager('./contracts/modules/TransferManager/CountTransferManager.sol',6);

emit __CoverageCountTransferManager('./contracts/modules/TransferManager/CountTransferManager.sol',84);
        emit __StatementCoverageCountTransferManager('./contracts/modules/TransferManager/CountTransferManager.sol',12);
bytes32[] memory allPermissions = new bytes32[](1);
emit __CoverageCountTransferManager('./contracts/modules/TransferManager/CountTransferManager.sol',85);
        emit __StatementCoverageCountTransferManager('./contracts/modules/TransferManager/CountTransferManager.sol',13);
allPermissions[0] = ADMIN;
emit __CoverageCountTransferManager('./contracts/modules/TransferManager/CountTransferManager.sol',86);
        emit __StatementCoverageCountTransferManager('./contracts/modules/TransferManager/CountTransferManager.sol',14);
return allPermissions;
    }

}
