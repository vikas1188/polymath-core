pragma solidity ^0.4.24;

import "../../Pausable.sol";
import "../Module.sol";

/**
 * @title Interface to be implemented by all Wallet modules
 * @dev abstract contract
 */
contract IWallet is Module, Pausable {event __CoverageIWallet(string fileName, uint256 lineNumber);
event __FunctionCoverageIWallet(string fileName, uint256 fnId);
event __StatementCoverageIWallet(string fileName, uint256 statementId);
event __BranchCoverageIWallet(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageIWallet(string fileName, uint256 branchId);
event __AssertPostCoverageIWallet(string fileName, uint256 branchId);


    function unpause() public onlyOwner {emit __FunctionCoverageIWallet('./contracts/modules/Wallet/IWallet.sol',1);

emit __CoverageIWallet('./contracts/modules/Wallet/IWallet.sol',13);
        super._unpause();
    }

    function pause() public onlyOwner {emit __FunctionCoverageIWallet('./contracts/modules/Wallet/IWallet.sol',2);

emit __CoverageIWallet('./contracts/modules/Wallet/IWallet.sol',17);
        super._pause();
    }
}
