pragma solidity ^0.4.24;

import "openzeppelin-solidity/contracts/ownership/Ownable.sol";
import "./PolymathRegistry.sol";

contract RegistryUpdater is Ownable {event __CoverageRegistryUpdater(string fileName, uint256 lineNumber);
event __FunctionCoverageRegistryUpdater(string fileName, uint256 fnId);
event __StatementCoverageRegistryUpdater(string fileName, uint256 statementId);
event __BranchCoverageRegistryUpdater(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageRegistryUpdater(string fileName, uint256 branchId);
event __AssertPostCoverageRegistryUpdater(string fileName, uint256 branchId);


    address public polymathRegistry;
    address public moduleRegistry;
    address public securityTokenRegistry;
    address public featureRegistry;
    address public polyToken;

    constructor (address _polymathRegistry) public {emit __FunctionCoverageRegistryUpdater('./contracts/RegistryUpdater.sol',1);

emit __CoverageRegistryUpdater('./contracts/RegistryUpdater.sol',15);
        emit __AssertPreCoverageRegistryUpdater('./contracts/RegistryUpdater.sol',1);
emit __StatementCoverageRegistryUpdater('./contracts/RegistryUpdater.sol',1);
require(_polymathRegistry != address(0), "Invalid address");emit __AssertPostCoverageRegistryUpdater('./contracts/RegistryUpdater.sol',1);

emit __CoverageRegistryUpdater('./contracts/RegistryUpdater.sol',16);
        emit __StatementCoverageRegistryUpdater('./contracts/RegistryUpdater.sol',2);
polymathRegistry = _polymathRegistry;
    }

    function updateFromRegistry() public onlyOwner {emit __FunctionCoverageRegistryUpdater('./contracts/RegistryUpdater.sol',2);

emit __CoverageRegistryUpdater('./contracts/RegistryUpdater.sol',20);
        emit __StatementCoverageRegistryUpdater('./contracts/RegistryUpdater.sol',3);
moduleRegistry = PolymathRegistry(polymathRegistry).getAddress("ModuleRegistry");
emit __CoverageRegistryUpdater('./contracts/RegistryUpdater.sol',21);
        emit __StatementCoverageRegistryUpdater('./contracts/RegistryUpdater.sol',4);
securityTokenRegistry = PolymathRegistry(polymathRegistry).getAddress("SecurityTokenRegistry");
emit __CoverageRegistryUpdater('./contracts/RegistryUpdater.sol',22);
        emit __StatementCoverageRegistryUpdater('./contracts/RegistryUpdater.sol',5);
featureRegistry = PolymathRegistry(polymathRegistry).getAddress("FeatureRegistry");
emit __CoverageRegistryUpdater('./contracts/RegistryUpdater.sol',23);
        emit __StatementCoverageRegistryUpdater('./contracts/RegistryUpdater.sol',6);
polyToken = PolymathRegistry(polymathRegistry).getAddress("PolyToken");
    }

}
