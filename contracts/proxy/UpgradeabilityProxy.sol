pragma solidity ^0.4.24;

import "./Proxy.sol";
import "openzeppelin-solidity/contracts/AddressUtils.sol";

/**
 * @title UpgradeabilityProxy
 * @dev This contract represents a proxy where the implementation address to which it will delegate can be upgraded
 */
contract UpgradeabilityProxy is Proxy {event __CoverageUpgradeabilityProxy(string fileName, uint256 lineNumber);
event __FunctionCoverageUpgradeabilityProxy(string fileName, uint256 fnId);
event __StatementCoverageUpgradeabilityProxy(string fileName, uint256 statementId);
event __BranchCoverageUpgradeabilityProxy(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageUpgradeabilityProxy(string fileName, uint256 branchId);
event __AssertPostCoverageUpgradeabilityProxy(string fileName, uint256 branchId);


    // Version name of the current implementation
    string internal __version;

    // Address of the current implementation
    address internal __implementation;

    /**
    * @dev This event will be emitted every time the implementation gets upgraded
    * @param _newVersion representing the version name of the upgraded implementation
    * @param _newImplementation representing the address of the upgraded implementation
    */
    event Upgraded(string _newVersion, address indexed _newImplementation);

    /**
    * @dev Upgrades the implementation address
    * @param _newVersion representing the version name of the new implementation to be set
    * @param _newImplementation representing the address of the new implementation to be set
    */
    function _upgradeTo(string _newVersion, address _newImplementation) internal {emit __FunctionCoverageUpgradeabilityProxy('./contracts/proxy/UpgradeabilityProxy.sol',1);

emit __CoverageUpgradeabilityProxy('./contracts/proxy/UpgradeabilityProxy.sol',31);
        emit __AssertPreCoverageUpgradeabilityProxy('./contracts/proxy/UpgradeabilityProxy.sol',1);
emit __StatementCoverageUpgradeabilityProxy('./contracts/proxy/UpgradeabilityProxy.sol',1);
require(
            __implementation != _newImplementation && _newImplementation != address(0),
            "Old address is not allowed and implementation address should not be 0x"
        );emit __AssertPostCoverageUpgradeabilityProxy('./contracts/proxy/UpgradeabilityProxy.sol',1);

emit __CoverageUpgradeabilityProxy('./contracts/proxy/UpgradeabilityProxy.sol',35);
        emit __AssertPreCoverageUpgradeabilityProxy('./contracts/proxy/UpgradeabilityProxy.sol',2);
emit __StatementCoverageUpgradeabilityProxy('./contracts/proxy/UpgradeabilityProxy.sol',2);
require(AddressUtils.isContract(_newImplementation), "Cannot set a proxy implementation to a non-contract address");emit __AssertPostCoverageUpgradeabilityProxy('./contracts/proxy/UpgradeabilityProxy.sol',2);

emit __CoverageUpgradeabilityProxy('./contracts/proxy/UpgradeabilityProxy.sol',36);
        emit __AssertPreCoverageUpgradeabilityProxy('./contracts/proxy/UpgradeabilityProxy.sol',3);
emit __StatementCoverageUpgradeabilityProxy('./contracts/proxy/UpgradeabilityProxy.sol',3);
require(bytes(_newVersion).length > 0, "Version should not be empty string");emit __AssertPostCoverageUpgradeabilityProxy('./contracts/proxy/UpgradeabilityProxy.sol',3);

emit __CoverageUpgradeabilityProxy('./contracts/proxy/UpgradeabilityProxy.sol',37);
        emit __AssertPreCoverageUpgradeabilityProxy('./contracts/proxy/UpgradeabilityProxy.sol',4);
emit __StatementCoverageUpgradeabilityProxy('./contracts/proxy/UpgradeabilityProxy.sol',4);
require(keccak256(abi.encodePacked(__version)) != keccak256(abi.encodePacked(_newVersion)), "New version equals to current");emit __AssertPostCoverageUpgradeabilityProxy('./contracts/proxy/UpgradeabilityProxy.sol',4);

emit __CoverageUpgradeabilityProxy('./contracts/proxy/UpgradeabilityProxy.sol',38);
        emit __StatementCoverageUpgradeabilityProxy('./contracts/proxy/UpgradeabilityProxy.sol',5);
__version = _newVersion;
emit __CoverageUpgradeabilityProxy('./contracts/proxy/UpgradeabilityProxy.sol',39);
        emit __StatementCoverageUpgradeabilityProxy('./contracts/proxy/UpgradeabilityProxy.sol',6);
__implementation = _newImplementation;
emit __CoverageUpgradeabilityProxy('./contracts/proxy/UpgradeabilityProxy.sol',40);
        emit __StatementCoverageUpgradeabilityProxy('./contracts/proxy/UpgradeabilityProxy.sol',7);
emit Upgraded(_newVersion, _newImplementation);
    }

}