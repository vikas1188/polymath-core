pragma solidity ^0.4.24;

/**
 * @title Interface to be implemented by all checkpoint modules
 */
/*solium-disable-next-line no-empty-blocks*/
interface ICheckpoint {event __CoverageICheckpoint(string fileName, uint256 lineNumber);
event __FunctionCoverageICheckpoint(string fileName, uint256 fnId);
event __StatementCoverageICheckpoint(string fileName, uint256 statementId);
event __BranchCoverageICheckpoint(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageICheckpoint(string fileName, uint256 branchId);
event __AssertPostCoverageICheckpoint(string fileName, uint256 branchId);


}
