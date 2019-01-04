pragma solidity ^0.4.24;

import "../modules/STO/USDTieredSTOStorage.sol";
import "./OwnedProxy.sol";
import "../Pausable.sol";
import "openzeppelin-solidity/contracts/ReentrancyGuard.sol";
import "../modules/STO/ISTOStorage.sol";
import "../modules/ModuleStorage.sol";

/**
 * @title USDTiered STO module Proxy
 */
contract USDTieredSTOProxy is USDTieredSTOStorage, ISTOStorage, ModuleStorage, Pausable, ReentrancyGuard, OwnedProxy {event __CoverageUSDTieredSTOProxy(string fileName, uint256 lineNumber);
event __FunctionCoverageUSDTieredSTOProxy(string fileName, uint256 fnId);
event __StatementCoverageUSDTieredSTOProxy(string fileName, uint256 statementId);
event __BranchCoverageUSDTieredSTOProxy(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageUSDTieredSTOProxy(string fileName, uint256 branchId);
event __AssertPostCoverageUSDTieredSTOProxy(string fileName, uint256 branchId);


    /**
    * @notice Constructor
    * @param _securityToken Address of the security token
    * @param _polyAddress Address of the polytoken
    * @param _implementation representing the address of the new implementation to be set
    */
    constructor (address _securityToken, address _polyAddress, address _implementation)
    public
    ModuleStorage(_securityToken, _polyAddress)
    {emit __FunctionCoverageUSDTieredSTOProxy('./contracts/proxy/USDTieredSTOProxy.sol',1);

emit __CoverageUSDTieredSTOProxy('./contracts/proxy/USDTieredSTOProxy.sol',25);
        emit __AssertPreCoverageUSDTieredSTOProxy('./contracts/proxy/USDTieredSTOProxy.sol',1);
emit __StatementCoverageUSDTieredSTOProxy('./contracts/proxy/USDTieredSTOProxy.sol',1);
require(
            _implementation != address(0),
            "Implementation address should not be 0x"
        );emit __AssertPostCoverageUSDTieredSTOProxy('./contracts/proxy/USDTieredSTOProxy.sol',1);

emit __CoverageUSDTieredSTOProxy('./contracts/proxy/USDTieredSTOProxy.sol',29);
        emit __StatementCoverageUSDTieredSTOProxy('./contracts/proxy/USDTieredSTOProxy.sol',2);
__implementation = _implementation;
    }

}
