pragma solidity ^0.4.24;

/**
 * @title Utility contract to allow pausing and unpausing of certain functions
 */
contract Pausable {event __CoveragePausable(string fileName, uint256 lineNumber);
event __FunctionCoveragePausable(string fileName, uint256 fnId);
event __StatementCoveragePausable(string fileName, uint256 statementId);
event __BranchCoveragePausable(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoveragePausable(string fileName, uint256 branchId);
event __AssertPostCoveragePausable(string fileName, uint256 branchId);


    event Pause(uint256 _timestammp);
    event Unpause(uint256 _timestamp);

    bool public paused = false;

    /**
    * @notice Modifier to make a function callable only when the contract is not paused.
    */
    modifier whenNotPaused() {emit __FunctionCoveragePausable('./contracts/Pausable.sol',1);

emit __CoveragePausable('./contracts/Pausable.sol',17);
        emit __AssertPreCoveragePausable('./contracts/Pausable.sol',1);
emit __StatementCoveragePausable('./contracts/Pausable.sol',1);
require(!paused, "Contract is paused");emit __AssertPostCoveragePausable('./contracts/Pausable.sol',1);

emit __CoveragePausable('./contracts/Pausable.sol',18);
        _;
    }

    /**
    * @notice Modifier to make a function callable only when the contract is paused.
    */
    modifier whenPaused() {emit __FunctionCoveragePausable('./contracts/Pausable.sol',2);

emit __CoveragePausable('./contracts/Pausable.sol',25);
        emit __AssertPreCoveragePausable('./contracts/Pausable.sol',2);
emit __StatementCoveragePausable('./contracts/Pausable.sol',2);
require(paused, "Contract is not paused");emit __AssertPostCoveragePausable('./contracts/Pausable.sol',2);

emit __CoveragePausable('./contracts/Pausable.sol',26);
        _;
    }

   /**
    * @notice Called by the owner to pause, triggers stopped state
    */
    function _pause() internal whenNotPaused {emit __FunctionCoveragePausable('./contracts/Pausable.sol',3);

emit __CoveragePausable('./contracts/Pausable.sol',33);
        emit __StatementCoveragePausable('./contracts/Pausable.sol',3);
paused = true;
        /*solium-disable-next-line security/no-block-members*/
emit __CoveragePausable('./contracts/Pausable.sol',35);
        emit __StatementCoveragePausable('./contracts/Pausable.sol',4);
emit Pause(now);
    }

    /**
    * @notice Called by the owner to unpause, returns to normal state
    */
    function _unpause() internal whenPaused {emit __FunctionCoveragePausable('./contracts/Pausable.sol',4);

emit __CoveragePausable('./contracts/Pausable.sol',42);
        emit __StatementCoveragePausable('./contracts/Pausable.sol',5);
paused = false;
        /*solium-disable-next-line security/no-block-members*/
emit __CoveragePausable('./contracts/Pausable.sol',44);
        emit __StatementCoveragePausable('./contracts/Pausable.sol',6);
emit Unpause(now);
    }

}
