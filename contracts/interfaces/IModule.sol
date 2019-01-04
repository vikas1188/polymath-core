pragma solidity ^0.4.24;

/**
 * @title Interface that every module contract should implement
 */
interface IModule {event __CoverageIModule(string fileName, uint256 lineNumber);
event __FunctionCoverageIModule(string fileName, uint256 fnId);
event __StatementCoverageIModule(string fileName, uint256 statementId);
event __BranchCoverageIModule(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageIModule(string fileName, uint256 branchId);
event __AssertPostCoverageIModule(string fileName, uint256 branchId);


    /**
     * @notice This function returns the signature of configure function
     */
    function getInitFunction() external  returns (bytes4);

    /**
     * @notice Return the permission flags that are associated with a module
     */
    function getPermissions() external  returns(bytes32[]);

    /**
     * @notice Used to withdraw the fee by the factory owner
     */
    function takeFee(uint256 _amount) external returns(bool);

}
