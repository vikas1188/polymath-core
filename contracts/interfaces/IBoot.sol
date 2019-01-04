pragma solidity ^0.4.24;

interface IBoot {event __CoverageIBoot(string fileName, uint256 lineNumber);
event __FunctionCoverageIBoot(string fileName, uint256 fnId);
event __StatementCoverageIBoot(string fileName, uint256 statementId);
event __BranchCoverageIBoot(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageIBoot(string fileName, uint256 branchId);
event __AssertPostCoverageIBoot(string fileName, uint256 branchId);


    /**
     * @notice This function returns the signature of configure function
     * @return bytes4 Configure function signature
     */
    function getInitFunction() external  returns(bytes4);
}