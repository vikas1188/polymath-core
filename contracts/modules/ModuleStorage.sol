pragma solidity ^0.4.24;

import "../interfaces/IERC20.sol";

/**
 * @title Storage for Module contract
 * @notice Contract is abstract
 */
contract ModuleStorage {event __CoverageModuleStorage(string fileName, uint256 lineNumber);
event __FunctionCoverageModuleStorage(string fileName, uint256 fnId);
event __StatementCoverageModuleStorage(string fileName, uint256 statementId);
event __BranchCoverageModuleStorage(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageModuleStorage(string fileName, uint256 branchId);
event __AssertPostCoverageModuleStorage(string fileName, uint256 branchId);


    /**
     * @notice Constructor
     * @param _securityToken Address of the security token
     * @param _polyAddress Address of the polytoken
     */
    constructor (address _securityToken, address _polyAddress) public {emit __FunctionCoverageModuleStorage('./contracts/modules/ModuleStorage.sol',1);

emit __CoverageModuleStorage('./contracts/modules/ModuleStorage.sol',17);
        emit __StatementCoverageModuleStorage('./contracts/modules/ModuleStorage.sol',1);
securityToken = _securityToken;
emit __CoverageModuleStorage('./contracts/modules/ModuleStorage.sol',18);
        emit __StatementCoverageModuleStorage('./contracts/modules/ModuleStorage.sol',2);
factory = msg.sender;
emit __CoverageModuleStorage('./contracts/modules/ModuleStorage.sol',19);
        emit __StatementCoverageModuleStorage('./contracts/modules/ModuleStorage.sol',3);
polyToken = IERC20(_polyAddress);
    }
    
    address public factory;

    address public securityToken;

    bytes32 public constant FEE_ADMIN = "FEE_ADMIN";

    IERC20 public polyToken;

}
