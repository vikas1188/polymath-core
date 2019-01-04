pragma solidity ^0.4.24;

import "./ReclaimTokens.sol";
import "./interfaces/IFeatureRegistry.sol";

/**
 * @title Registry for managing polymath feature switches
 */
contract FeatureRegistry is IFeatureRegistry, ReclaimTokens {event __CoverageFeatureRegistry(string fileName, uint256 lineNumber);
event __FunctionCoverageFeatureRegistry(string fileName, uint256 fnId);
event __StatementCoverageFeatureRegistry(string fileName, uint256 statementId);
event __BranchCoverageFeatureRegistry(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageFeatureRegistry(string fileName, uint256 branchId);
event __AssertPostCoverageFeatureRegistry(string fileName, uint256 branchId);


    mapping (bytes32 => bool) public featureStatus;

    event ChangeFeatureStatus(string _nameKey, bool _newStatus);

    /**
     * @notice Get the status of a feature
     * @param _nameKey is the key for the feature status mapping
     * @return bool
     */
    function getFeatureStatus(string _nameKey) external  returns(bool) {emit __FunctionCoverageFeatureRegistry('./contracts/FeatureRegistry.sol',1);

emit __CoverageFeatureRegistry('./contracts/FeatureRegistry.sol',21);
        emit __StatementCoverageFeatureRegistry('./contracts/FeatureRegistry.sol',1);
bytes32 key = keccak256(bytes(_nameKey));
emit __CoverageFeatureRegistry('./contracts/FeatureRegistry.sol',22);
        emit __StatementCoverageFeatureRegistry('./contracts/FeatureRegistry.sol',2);
return featureStatus[key];
    }

    /**
     * @notice change a feature status
     * @dev feature status is set to false by default
     * @param _nameKey is the key for the feature status mapping
     * @param _newStatus is the new feature status
     */
    function setFeatureStatus(string _nameKey, bool _newStatus) public onlyOwner {emit __FunctionCoverageFeatureRegistry('./contracts/FeatureRegistry.sol',2);

emit __CoverageFeatureRegistry('./contracts/FeatureRegistry.sol',32);
        emit __StatementCoverageFeatureRegistry('./contracts/FeatureRegistry.sol',3);
bytes32 key = keccak256(bytes(_nameKey));
emit __CoverageFeatureRegistry('./contracts/FeatureRegistry.sol',33);
        emit __AssertPreCoverageFeatureRegistry('./contracts/FeatureRegistry.sol',1);
emit __StatementCoverageFeatureRegistry('./contracts/FeatureRegistry.sol',4);
require(featureStatus[key] != _newStatus, "Status unchanged");emit __AssertPostCoverageFeatureRegistry('./contracts/FeatureRegistry.sol',1);

emit __CoverageFeatureRegistry('./contracts/FeatureRegistry.sol',34);
        emit __StatementCoverageFeatureRegistry('./contracts/FeatureRegistry.sol',5);
emit ChangeFeatureStatus(_nameKey, _newStatus);
emit __CoverageFeatureRegistry('./contracts/FeatureRegistry.sol',35);
        emit __StatementCoverageFeatureRegistry('./contracts/FeatureRegistry.sol',6);
featureStatus[key] = _newStatus;
    }

}
