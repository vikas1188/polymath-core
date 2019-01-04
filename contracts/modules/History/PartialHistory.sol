pragma solidity ^0.4.24;

import "../../interfaces/IHistory.sol";
import "./PartialHistoryStorage.sol";

contract PartialHistory is PartialHistoryStorage, IHistory {

    function balanceOfAt(address _investor, uint256 _checkpointId, uint256 _currentBalance) external view returns(uint256) {
      require(_checkpointId <= currentCheckpointId);
      return _getValueAt(checkpointBalances[_investor], _checkpointId, _currentBalance);
    }

    function totalSupplyAt(uint256 _checkpointId, uint256 _currentTotalSupply) external view returns(uint256) {
      require(_checkpointId <= currentCheckpointId);
      return _getValueAt(checkpointTotalSupply, _checkpointId, _currentTotalSupply);
    }

    function getCheckpointTime(uint256 _checkpointId) external view returns(uint256) {
        return checkpointTimes[_checkpointId];
    }

    function getCheckpointTimes() external view returns(uint256[]) {
        return checkpointTimes;
    }

    function getCurrentCheckpointId() external view returns(uint256) {
        return currentCheckpointId;
    }

    //TODO: Fix permissioning below
    function adjustBalanceCheckpoint(address _investor, uint256 _balance) external {
        _adjustCheckpoints(checkpointBalances[_investor], _balance, currentCheckpointId);
    }

    //TODO: Fix permissioning below
    function adjustTotalSupplyCheckpoint(uint256 _totalSupply) external {
        _adjustCheckpoints(checkpointTotalSupply, _totalSupply, currentCheckpointId);
    }

    //TODO: Fix permissioning below

    /**
     * @notice Creates a checkpoint that can be used to query historical balances / totalSupply
     * @return uint256
     */
    function createCheckpoint() external returns(uint256) {
        require(currentCheckpointId < 2**256 - 1);
        currentCheckpointId = currentCheckpointId + 1;
        /*solium-disable-next-line security/no-block-members*/
        checkpointTimes.push(now);
        /*solium-disable-next-line security/no-block-members*/
        return currentCheckpointId;
    }

    /**
     * @notice Queries a value at a defined checkpoint
     * @param _checkpoints is array of Checkpoint objects
     * @param _checkpointId is the Checkpoint ID to query
     * @param _currentValue is the Current value of checkpoint
     * @return uint256
     */
    function _getValueAt(Checkpoint[] storage _checkpoints, uint256 _checkpointId, uint256 _currentValue) internal view returns(uint256) {
        //Checkpoint id 0 is when the token is first created - everyone has a zero balance
        if (_checkpointId == 0) {
            return 0;
        }
        if (_checkpoints.length == 0) {
            return _currentValue;
        }
        if (_checkpoints[0].checkpointId >= _checkpointId) {
            return _checkpoints[0].value;
        }
        if (_checkpoints[_checkpoints.length - 1].checkpointId < _checkpointId) {
            return _currentValue;
        }
        if (_checkpoints[_checkpoints.length - 1].checkpointId == _checkpointId) {
            return _checkpoints[_checkpoints.length - 1].value;
        }
        uint256 min = 0;
        uint256 max = _checkpoints.length - 1;
        while (max > min) {
            uint256 mid = (max + min) / 2;
            if (_checkpoints[mid].checkpointId == _checkpointId) {
                max = mid;
                break;
            }
            if (_checkpoints[mid].checkpointId < _checkpointId) {
                min = mid + 1;
            } else {
                max = mid;
            }
        }
        return _checkpoints[max].value;
    }

    /**
     * @notice Stores the changes to the checkpoint objects
     * @param _checkpoints is the affected checkpoint object array
     * @param _newValue is the new value that needs to be stored
     */
    function _adjustCheckpoints(Checkpoint[] storage _checkpoints, uint256 _newValue, uint256 _currentCheckpointId) internal {
        //No checkpoints set yet
        if (_currentCheckpointId == 0) {
            return;
        }
        //No new checkpoints since last update
        if ((_checkpoints.length > 0) && (_checkpoints[_checkpoints.length - 1].checkpointId == _currentCheckpointId)) {
            return;
        }
        //New checkpoint, so record balance
        _checkpoints.push(
            Checkpoint({
                checkpointId: _currentCheckpointId,
                value: _newValue
            })
        );
    }

}
