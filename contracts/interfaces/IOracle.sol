pragma solidity ^0.4.24;

interface IOracle {event __CoverageIOracle(string fileName, uint256 lineNumber);
event __FunctionCoverageIOracle(string fileName, uint256 fnId);
event __StatementCoverageIOracle(string fileName, uint256 statementId);
event __BranchCoverageIOracle(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageIOracle(string fileName, uint256 branchId);
event __AssertPostCoverageIOracle(string fileName, uint256 branchId);


    /**
    * @notice Returns address of oracle currency (0x0 for ETH)
    */
    function getCurrencyAddress() external  returns(address);

    /**
    * @notice Returns symbol of oracle currency (0x0 for ETH)
    */
    function getCurrencySymbol() external  returns(bytes32);

    /**
    * @notice Returns denomination of price
    */
    function getCurrencyDenominated() external  returns(bytes32);

    /**
    * @notice Returns price - should throw if not valid
    */
    function getPrice() external  returns(uint256);

}
