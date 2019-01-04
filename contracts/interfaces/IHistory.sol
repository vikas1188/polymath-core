pragma solidity ^0.4.24;

interface IHistory {

    function balanceOfAt(address _investor, uint256 _checkpointId, uint256 _currentBalance) external view returns(uint256);

    function totalSupplyAt(uint256 _checkpointId, uint256 _currentTotalSupply) external view returns(uint256);

    function getCheckpointTime(uint256 _checkpointId) external view returns(uint256);

    function getCheckpointTimes() external view returns(uint256[]);

    function adjustBalanceCheckpoint(address _investor, uint256 _balance) external;

    function adjustTotalSupplyCheckpoint(uint256 _totalSupply) external;

    function createCheckpoint() external returns(uint256);

    function getCurrentCheckpointId() external view returns(uint256);

}
