pragma solidity ^0.4.24;

/**
 * @title Contract used to store layout for the DummySTO storage
 */
contract PartialHistoryStorage {

    // Structures to maintain checkpoints of balances for governance / dividends
    struct Checkpoint {
        uint256 checkpointId;
        uint256 value;
    }

    // Value of current checkpoint
    uint256 public currentCheckpointId;

    // List of checkpoints that relate to total supply
    Checkpoint[] checkpointTotalSupply;

    // Times at which each checkpoint was created
    uint256[] checkpointTimes;

    // Map each investor to a series of checkpoints
    mapping (address => Checkpoint[]) checkpointBalances;

}
