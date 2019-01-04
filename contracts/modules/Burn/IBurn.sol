pragma solidity ^0.4.24;

/**
 * @title Interface to be implemented by all checkpoint modules
 */
/*solium-disable-next-line no-empty-blocks*/
interface IBurn {event __CoverageIBurn(string fileName, uint256 lineNumber);
event __FunctionCoverageIBurn(string fileName, uint256 fnId);
event __StatementCoverageIBurn(string fileName, uint256 statementId);
event __BranchCoverageIBurn(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageIBurn(string fileName, uint256 branchId);
event __AssertPostCoverageIBurn(string fileName, uint256 branchId);


}
