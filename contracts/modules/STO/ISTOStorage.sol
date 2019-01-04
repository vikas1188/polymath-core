pragma solidity ^0.4.24;

/**
 * @title Storage layout for the ISTO contract
 */
contract ISTOStorage {event __CoverageISTOStorage(string fileName, uint256 lineNumber);
event __FunctionCoverageISTOStorage(string fileName, uint256 fnId);
event __StatementCoverageISTOStorage(string fileName, uint256 statementId);
event __BranchCoverageISTOStorage(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageISTOStorage(string fileName, uint256 branchId);
event __AssertPostCoverageISTOStorage(string fileName, uint256 branchId);


    mapping (uint8 => bool) public fundRaiseTypes;
    mapping (uint8 => uint256) public fundsRaised;

    // Start time of the STO
    uint256 public startTime;
    // End time of the STO
    uint256 public endTime;
    // Time STO was paused
    uint256 public pausedTime;
    // Number of individual investors
    uint256 public investorCount;
    // Address where ETH & POLY funds are delivered
    address public wallet;
     // Final amount of tokens sold
    uint256 public totalTokensSold;

}