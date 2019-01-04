pragma solidity ^0.4.24;

import "../modules/Wallet/VestingEscrowWalletStorage.sol";
import "./OwnedProxy.sol";
import "../Pausable.sol";
import "../modules/ModuleStorage.sol";
 /**
 * @title Escrow wallet module for vesting functionality
 */
contract VestingEscrowWalletProxy is VestingEscrowWalletStorage, ModuleStorage, Pausable, OwnedProxy {event __CoverageVestingEscrowWalletProxy(string fileName, uint256 lineNumber);
event __FunctionCoverageVestingEscrowWalletProxy(string fileName, uint256 fnId);
event __StatementCoverageVestingEscrowWalletProxy(string fileName, uint256 statementId);
event __BranchCoverageVestingEscrowWalletProxy(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageVestingEscrowWalletProxy(string fileName, uint256 branchId);
event __AssertPostCoverageVestingEscrowWalletProxy(string fileName, uint256 branchId);

     /**
    * @notice Constructor
    * @param _securityToken Address of the security token
    * @param _polyAddress Address of the polytoken
    * @param _implementation representing the address of the new implementation to be set
    */
    constructor (address _securityToken, address _polyAddress, address _implementation)
    public
    ModuleStorage(_securityToken, _polyAddress)
    {emit __FunctionCoverageVestingEscrowWalletProxy('./contracts/proxy/VestingEscrowWalletProxy.sol',1);

emit __CoverageVestingEscrowWalletProxy('./contracts/proxy/VestingEscrowWalletProxy.sol',21);
        emit __AssertPreCoverageVestingEscrowWalletProxy('./contracts/proxy/VestingEscrowWalletProxy.sol',1);
emit __StatementCoverageVestingEscrowWalletProxy('./contracts/proxy/VestingEscrowWalletProxy.sol',1);
require(
            _implementation != address(0),
            "Implementation address should not be 0x"
        );emit __AssertPostCoverageVestingEscrowWalletProxy('./contracts/proxy/VestingEscrowWalletProxy.sol',1);

emit __CoverageVestingEscrowWalletProxy('./contracts/proxy/VestingEscrowWalletProxy.sol',25);
        emit __StatementCoverageVestingEscrowWalletProxy('./contracts/proxy/VestingEscrowWalletProxy.sol',2);
__implementation = _implementation;
    }
 }