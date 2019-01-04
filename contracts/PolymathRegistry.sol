pragma solidity ^0.4.24;

import "./ReclaimTokens.sol";

/**
 * @title Core functionality for registry upgradability
 */
contract PolymathRegistry is ReclaimTokens {event __CoveragePolymathRegistry(string fileName, uint256 lineNumber);
event __FunctionCoveragePolymathRegistry(string fileName, uint256 fnId);
event __StatementCoveragePolymathRegistry(string fileName, uint256 statementId);
event __BranchCoveragePolymathRegistry(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoveragePolymathRegistry(string fileName, uint256 branchId);
event __AssertPostCoveragePolymathRegistry(string fileName, uint256 branchId);


    mapping (bytes32 => address) public storedAddresses;

    event ChangeAddress(string _nameKey, address indexed _oldAddress, address indexed _newAddress);

    /**
     * @notice Gets the contract address
     * @param _nameKey is the key for the contract address mapping
     * @return address
     */
    function getAddress(string _nameKey) external  returns(address) {emit __FunctionCoveragePolymathRegistry('./contracts/PolymathRegistry.sol',1);

emit __CoveragePolymathRegistry('./contracts/PolymathRegistry.sol',20);
        emit __StatementCoveragePolymathRegistry('./contracts/PolymathRegistry.sol',1);
bytes32 key = keccak256(bytes(_nameKey));
emit __CoveragePolymathRegistry('./contracts/PolymathRegistry.sol',21);
        emit __AssertPreCoveragePolymathRegistry('./contracts/PolymathRegistry.sol',1);
emit __StatementCoveragePolymathRegistry('./contracts/PolymathRegistry.sol',2);
require(storedAddresses[key] != address(0), "Invalid address key");emit __AssertPostCoveragePolymathRegistry('./contracts/PolymathRegistry.sol',1);

emit __CoveragePolymathRegistry('./contracts/PolymathRegistry.sol',22);
        emit __StatementCoveragePolymathRegistry('./contracts/PolymathRegistry.sol',3);
return storedAddresses[key];
    }

    /**
     * @notice Changes the contract address
     * @param _nameKey is the key for the contract address mapping
     * @param _newAddress is the new contract address
     */
    function changeAddress(string _nameKey, address _newAddress) external onlyOwner {emit __FunctionCoveragePolymathRegistry('./contracts/PolymathRegistry.sol',2);

emit __CoveragePolymathRegistry('./contracts/PolymathRegistry.sol',31);
        emit __StatementCoveragePolymathRegistry('./contracts/PolymathRegistry.sol',4);
bytes32 key = keccak256(bytes(_nameKey));
emit __CoveragePolymathRegistry('./contracts/PolymathRegistry.sol',32);
        emit __StatementCoveragePolymathRegistry('./contracts/PolymathRegistry.sol',5);
emit ChangeAddress(_nameKey, storedAddresses[key], _newAddress);
emit __CoveragePolymathRegistry('./contracts/PolymathRegistry.sol',33);
        emit __StatementCoveragePolymathRegistry('./contracts/PolymathRegistry.sol',6);
storedAddresses[key] = _newAddress;
    }


}
