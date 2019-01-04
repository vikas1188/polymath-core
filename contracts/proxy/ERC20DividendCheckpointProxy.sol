pragma solidity ^0.4.24;

import "../modules/Checkpoint/ERC20DividendCheckpointStorage.sol";
import "../modules/Checkpoint/DividendCheckpointStorage.sol";
import "./OwnedProxy.sol";
import "../Pausable.sol";
import "../modules/ModuleStorage.sol";

/**
 * @title Transfer Manager module for core transfer validation functionality
 */
contract ERC20DividendCheckpointProxy is ERC20DividendCheckpointStorage, DividendCheckpointStorage, ModuleStorage, Pausable, OwnedProxy {event __CoverageERC20DividendCheckpointProxy(string fileName, uint256 lineNumber);
event __FunctionCoverageERC20DividendCheckpointProxy(string fileName, uint256 fnId);
event __StatementCoverageERC20DividendCheckpointProxy(string fileName, uint256 statementId);
event __BranchCoverageERC20DividendCheckpointProxy(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageERC20DividendCheckpointProxy(string fileName, uint256 branchId);
event __AssertPostCoverageERC20DividendCheckpointProxy(string fileName, uint256 branchId);


    /**
    * @notice Constructor
    * @param _securityToken Address of the security token
    * @param _polyAddress Address of the polytoken
    * @param _implementation representing the address of the new implementation to be set
    */
    constructor (address _securityToken, address _polyAddress, address _implementation)
    public
    ModuleStorage(_securityToken, _polyAddress)
    {emit __FunctionCoverageERC20DividendCheckpointProxy('./contracts/proxy/ERC20DividendCheckpointProxy.sol',1);

emit __CoverageERC20DividendCheckpointProxy('./contracts/proxy/ERC20DividendCheckpointProxy.sol',24);
        emit __AssertPreCoverageERC20DividendCheckpointProxy('./contracts/proxy/ERC20DividendCheckpointProxy.sol',1);
emit __StatementCoverageERC20DividendCheckpointProxy('./contracts/proxy/ERC20DividendCheckpointProxy.sol',1);
require(
            _implementation != address(0),
            "Implementation address should not be 0x"
        );emit __AssertPostCoverageERC20DividendCheckpointProxy('./contracts/proxy/ERC20DividendCheckpointProxy.sol',1);

emit __CoverageERC20DividendCheckpointProxy('./contracts/proxy/ERC20DividendCheckpointProxy.sol',28);
        emit __StatementCoverageERC20DividendCheckpointProxy('./contracts/proxy/ERC20DividendCheckpointProxy.sol',2);
__implementation = _implementation;
    }

}
