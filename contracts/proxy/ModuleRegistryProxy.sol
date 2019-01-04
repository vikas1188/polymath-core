pragma solidity ^0.4.24;

import "../storage/EternalStorage.sol";
import "./OwnedUpgradeabilityProxy.sol";


/**
 * @title ModuleRegistryProxy
 * @dev This proxy holds the storage of the ModuleRegistry contract and delegates every call to the current implementation set.
 * Besides, it allows upgrading the contract's behaviour towards further implementations, and provides basic
 * authorization control functionalities
 */
/*solium-disable-next-line no-empty-blocks*/
contract ModuleRegistryProxy is EternalStorage, OwnedUpgradeabilityProxy {event __CoverageModuleRegistryProxy(string fileName, uint256 lineNumber);
event __FunctionCoverageModuleRegistryProxy(string fileName, uint256 fnId);
event __StatementCoverageModuleRegistryProxy(string fileName, uint256 statementId);
event __BranchCoverageModuleRegistryProxy(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageModuleRegistryProxy(string fileName, uint256 branchId);
event __AssertPostCoverageModuleRegistryProxy(string fileName, uint256 branchId);


}