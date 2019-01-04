pragma solidity ^0.4.24;

import "openzeppelin-solidity/contracts/ownership/Ownable.sol";
import "./interfaces/IERC20.sol";

/**
 * @title Utility contract to allow owner to retreive any ERC20 sent to the contract
 */
contract ReclaimTokens is Ownable {event __CoverageReclaimTokens(string fileName, uint256 lineNumber);
event __FunctionCoverageReclaimTokens(string fileName, uint256 fnId);
event __StatementCoverageReclaimTokens(string fileName, uint256 statementId);
event __BranchCoverageReclaimTokens(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageReclaimTokens(string fileName, uint256 branchId);
event __AssertPostCoverageReclaimTokens(string fileName, uint256 branchId);


    /**
    * @notice Reclaim all ERC20Basic compatible tokens
    * @param _tokenContract The address of the token contract
    */
    function reclaimERC20(address _tokenContract) external onlyOwner {emit __FunctionCoverageReclaimTokens('./contracts/ReclaimTokens.sol',1);

emit __CoverageReclaimTokens('./contracts/ReclaimTokens.sol',16);
        emit __AssertPreCoverageReclaimTokens('./contracts/ReclaimTokens.sol',1);
emit __StatementCoverageReclaimTokens('./contracts/ReclaimTokens.sol',1);
require(_tokenContract != address(0), "Invalid address");emit __AssertPostCoverageReclaimTokens('./contracts/ReclaimTokens.sol',1);

emit __CoverageReclaimTokens('./contracts/ReclaimTokens.sol',17);
        emit __StatementCoverageReclaimTokens('./contracts/ReclaimTokens.sol',2);
IERC20 token = IERC20(_tokenContract);
emit __CoverageReclaimTokens('./contracts/ReclaimTokens.sol',18);
        emit __StatementCoverageReclaimTokens('./contracts/ReclaimTokens.sol',3);
uint256 balance = token.balanceOf(address(this));
emit __CoverageReclaimTokens('./contracts/ReclaimTokens.sol',19);
        emit __AssertPreCoverageReclaimTokens('./contracts/ReclaimTokens.sol',2);
emit __StatementCoverageReclaimTokens('./contracts/ReclaimTokens.sol',4);
require(token.transfer(owner, balance), "Transfer failed");emit __AssertPostCoverageReclaimTokens('./contracts/ReclaimTokens.sol',2);

    }
}
