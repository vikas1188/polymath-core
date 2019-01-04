pragma solidity ^0.4.24;

/**
 * @title Interface for managing polymath feature switches
 */
interface IFeatureRegistry {event __CoverageIFeatureRegistry(string fileName, uint256 lineNumber);
event __FunctionCoverageIFeatureRegistry(string fileName, uint256 fnId);
event __StatementCoverageIFeatureRegistry(string fileName, uint256 statementId);
event __BranchCoverageIFeatureRegistry(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageIFeatureRegistry(string fileName, uint256 branchId);
event __AssertPostCoverageIFeatureRegistry(string fileName, uint256 branchId);


    /**
     * @notice Get the status of a feature
     * @param _nameKey is the key for the feature status mapping
     * @return bool
     */
    function getFeatureStatus(string _nameKey) external  returns(bool);

}
