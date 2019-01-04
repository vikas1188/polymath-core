pragma solidity ^0.4.24;

import "../modules/TransferManager/VolumeRestrictionTMStorage.sol";
import "./OwnedProxy.sol";
import "../Pausable.sol";
import "../modules/ModuleStorage.sol";

/**
 * @title Transfer Manager module for core transfer validation functionality
 */
contract VolumeRestrictionTMProxy is VolumeRestrictionTMStorage, ModuleStorage, Pausable, OwnedProxy {event __CoverageVolumeRestrictionTMProxy(string fileName, uint256 lineNumber);
event __FunctionCoverageVolumeRestrictionTMProxy(string fileName, uint256 fnId);
event __StatementCoverageVolumeRestrictionTMProxy(string fileName, uint256 statementId);
event __BranchCoverageVolumeRestrictionTMProxy(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageVolumeRestrictionTMProxy(string fileName, uint256 branchId);
event __AssertPostCoverageVolumeRestrictionTMProxy(string fileName, uint256 branchId);


    /**
    * @notice Constructor
    * @param _securityToken Address of the security token
    * @param _polyAddress Address of the polytoken
    * @param _implementation representing the address of the new implementation to be set
    */
    constructor (address _securityToken, address _polyAddress, address _implementation)
    public
    ModuleStorage(_securityToken, _polyAddress)
    {emit __FunctionCoverageVolumeRestrictionTMProxy('./contracts/proxy/VolumeRestrictionTMProxy.sol',1);

emit __CoverageVolumeRestrictionTMProxy('./contracts/proxy/VolumeRestrictionTMProxy.sol',23);
        emit __AssertPreCoverageVolumeRestrictionTMProxy('./contracts/proxy/VolumeRestrictionTMProxy.sol',1);
emit __StatementCoverageVolumeRestrictionTMProxy('./contracts/proxy/VolumeRestrictionTMProxy.sol',1);
require(
            _implementation != address(0),
            "Implementation address should not be 0x"
        );emit __AssertPostCoverageVolumeRestrictionTMProxy('./contracts/proxy/VolumeRestrictionTMProxy.sol',1);

emit __CoverageVolumeRestrictionTMProxy('./contracts/proxy/VolumeRestrictionTMProxy.sol',27);
        emit __StatementCoverageVolumeRestrictionTMProxy('./contracts/proxy/VolumeRestrictionTMProxy.sol',2);
__implementation = _implementation;
    }

}
