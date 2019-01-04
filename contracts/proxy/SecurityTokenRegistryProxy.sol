pragma solidity ^0.4.24;

import "../storage/EternalStorage.sol";
import "./OwnedUpgradeabilityProxy.sol";


/**
 * @title SecurityTokenRegistryProxy
 * @dev This proxy holds the storage of the SecurityTokenRegistry contract and delegates every call to the current implementation set.
 * Besides, it allows to upgrade the SecurityTokenRegistry's behaviour towards further implementations, and provides basic
 * authorization control functionalities
 */
/*solium-disable-next-line no-empty-blocks*/
contract SecurityTokenRegistryProxy is EternalStorage, OwnedUpgradeabilityProxy {event __CoverageSecurityTokenRegistryProxy(string fileName, uint256 lineNumber);
event __FunctionCoverageSecurityTokenRegistryProxy(string fileName, uint256 fnId);
event __StatementCoverageSecurityTokenRegistryProxy(string fileName, uint256 statementId);
event __BranchCoverageSecurityTokenRegistryProxy(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageSecurityTokenRegistryProxy(string fileName, uint256 branchId);
event __AssertPostCoverageSecurityTokenRegistryProxy(string fileName, uint256 branchId);


}