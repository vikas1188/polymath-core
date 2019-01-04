pragma solidity ^0.4.24;

    
interface IPolymathRegistry {event __CoverageIPolymathRegistry(string fileName, uint256 lineNumber);
event __FunctionCoverageIPolymathRegistry(string fileName, uint256 fnId);
event __StatementCoverageIPolymathRegistry(string fileName, uint256 statementId);
event __BranchCoverageIPolymathRegistry(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageIPolymathRegistry(string fileName, uint256 branchId);
event __AssertPostCoverageIPolymathRegistry(string fileName, uint256 branchId);


    /**
     * @notice Returns the contract address
     * @param _nameKey is the key for the contract address mapping
     * @return address
     */
    function getAddress(string _nameKey) external  returns(address);

}
    