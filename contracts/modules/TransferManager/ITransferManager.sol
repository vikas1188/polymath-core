pragma solidity ^0.4.24;

import "../../Pausable.sol";
import "../Module.sol";

/**
 * @title Interface to be implemented by all Transfer Manager modules
 * @dev abstract contract
 */
contract ITransferManager is Module, Pausable {event __CoverageITransferManager(string fileName, uint256 lineNumber);
event __FunctionCoverageITransferManager(string fileName, uint256 fnId);
event __StatementCoverageITransferManager(string fileName, uint256 statementId);
event __BranchCoverageITransferManager(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageITransferManager(string fileName, uint256 branchId);
event __AssertPostCoverageITransferManager(string fileName, uint256 branchId);


    //If verifyTransfer returns:
    //  FORCE_VALID, the transaction will always be valid, regardless of other TM results
    //  INVALID, then the transfer should not be allowed regardless of other TM results
    //  VALID, then the transfer is valid for this TM
    //  NA, then the result from this TM is ignored
    enum Result {INVALID, NA, VALID, FORCE_VALID}

    function verifyTransfer(address _from, address _to, uint256 _amount, bytes _data, bool _isTransfer) public returns(Result);

    function unpause() public onlyOwner {emit __FunctionCoverageITransferManager('./contracts/modules/TransferManager/ITransferManager.sol',1);

emit __CoverageITransferManager('./contracts/modules/TransferManager/ITransferManager.sol',22);
        super._unpause();
    }

    function pause() public onlyOwner {emit __FunctionCoverageITransferManager('./contracts/modules/TransferManager/ITransferManager.sol',2);

emit __CoverageITransferManager('./contracts/modules/TransferManager/ITransferManager.sol',26);
        super._pause();
    }
}
