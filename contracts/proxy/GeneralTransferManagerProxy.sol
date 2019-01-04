pragma solidity ^0.4.24;

import "../modules/TransferManager/GeneralTransferManagerStorage.sol";
import "./OwnedProxy.sol";
import "../Pausable.sol";
import "../modules/ModuleStorage.sol";

/**
 * @title Transfer Manager module for core transfer validation functionality
 */
contract GeneralTransferManagerProxy is GeneralTransferManagerStorage, ModuleStorage, Pausable, OwnedProxy {event __CoverageGeneralTransferManagerProxy(string fileName, uint256 lineNumber);
event __FunctionCoverageGeneralTransferManagerProxy(string fileName, uint256 fnId);
event __StatementCoverageGeneralTransferManagerProxy(string fileName, uint256 statementId);
event __BranchCoverageGeneralTransferManagerProxy(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageGeneralTransferManagerProxy(string fileName, uint256 branchId);
event __AssertPostCoverageGeneralTransferManagerProxy(string fileName, uint256 branchId);


    /**
    * @notice Constructor
    * @param _securityToken Address of the security token
    * @param _polyAddress Address of the polytoken
    * @param _implementation representing the address of the new implementation to be set
    */
    constructor (address _securityToken, address _polyAddress, address _implementation)
    public
    ModuleStorage(_securityToken, _polyAddress)
    {emit __FunctionCoverageGeneralTransferManagerProxy('./contracts/proxy/GeneralTransferManagerProxy.sol',1);

emit __CoverageGeneralTransferManagerProxy('./contracts/proxy/GeneralTransferManagerProxy.sol',23);
        emit __AssertPreCoverageGeneralTransferManagerProxy('./contracts/proxy/GeneralTransferManagerProxy.sol',1);
emit __StatementCoverageGeneralTransferManagerProxy('./contracts/proxy/GeneralTransferManagerProxy.sol',1);
require(
            _implementation != address(0),
            "Implementation address should not be 0x"
        );emit __AssertPostCoverageGeneralTransferManagerProxy('./contracts/proxy/GeneralTransferManagerProxy.sol',1);

emit __CoverageGeneralTransferManagerProxy('./contracts/proxy/GeneralTransferManagerProxy.sol',27);
        emit __StatementCoverageGeneralTransferManagerProxy('./contracts/proxy/GeneralTransferManagerProxy.sol',2);
__implementation = _implementation;
    }

}
