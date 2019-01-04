pragma solidity ^0.4.24;

/**
 * @title It holds the storage variables related to ERC20DividendCheckpoint module
 */
contract ERC20DividendCheckpointStorage {event __CoverageERC20DividendCheckpointStorage(string fileName, uint256 lineNumber);
event __FunctionCoverageERC20DividendCheckpointStorage(string fileName, uint256 fnId);
event __StatementCoverageERC20DividendCheckpointStorage(string fileName, uint256 statementId);
event __BranchCoverageERC20DividendCheckpointStorage(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageERC20DividendCheckpointStorage(string fileName, uint256 branchId);
event __AssertPostCoverageERC20DividendCheckpointStorage(string fileName, uint256 branchId);


    // Mapping to token address for each dividend
    mapping (uint256 => address) public dividendTokens;

}
