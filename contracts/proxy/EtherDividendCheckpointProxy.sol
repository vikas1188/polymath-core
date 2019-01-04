pragma solidity ^0.4.24;

import "../modules/Checkpoint/DividendCheckpointStorage.sol";
import "./OwnedProxy.sol";
import "../Pausable.sol";
import "../modules/ModuleStorage.sol";

/**
 * @title Transfer Manager module for core transfer validation functionality
 */
contract EtherDividendCheckpointProxy is DividendCheckpointStorage, ModuleStorage, Pausable, OwnedProxy {event __CoverageEtherDividendCheckpointProxy(string fileName, uint256 lineNumber);
event __FunctionCoverageEtherDividendCheckpointProxy(string fileName, uint256 fnId);
event __StatementCoverageEtherDividendCheckpointProxy(string fileName, uint256 statementId);
event __BranchCoverageEtherDividendCheckpointProxy(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageEtherDividendCheckpointProxy(string fileName, uint256 branchId);
event __AssertPostCoverageEtherDividendCheckpointProxy(string fileName, uint256 branchId);


    /**
    * @notice Constructor
    * @param _securityToken Address of the security token
    * @param _polyAddress Address of the polytoken
    * @param _implementation representing the address of the new implementation to be set
    */
    constructor (address _securityToken, address _polyAddress, address _implementation)
    public
    ModuleStorage(_securityToken, _polyAddress)
    {emit __FunctionCoverageEtherDividendCheckpointProxy('./contracts/proxy/EtherDividendCheckpointProxy.sol',1);

emit __CoverageEtherDividendCheckpointProxy('./contracts/proxy/EtherDividendCheckpointProxy.sol',23);
        emit __AssertPreCoverageEtherDividendCheckpointProxy('./contracts/proxy/EtherDividendCheckpointProxy.sol',1);
emit __StatementCoverageEtherDividendCheckpointProxy('./contracts/proxy/EtherDividendCheckpointProxy.sol',1);
require(
            _implementation != address(0),
            "Implementation address should not be 0x"
        );emit __AssertPostCoverageEtherDividendCheckpointProxy('./contracts/proxy/EtherDividendCheckpointProxy.sol',1);

emit __CoverageEtherDividendCheckpointProxy('./contracts/proxy/EtherDividendCheckpointProxy.sol',27);
        emit __StatementCoverageEtherDividendCheckpointProxy('./contracts/proxy/EtherDividendCheckpointProxy.sol',2);
__implementation = _implementation;
    }

}
