pragma solidity ^0.4.24;

import "../interfaces/IModule.sol";
import "../interfaces/ISecurityToken.sol";
import "./ModuleStorage.sol";
import "openzeppelin-solidity/contracts/ownership/Ownable.sol";

/**
 * @title Interface that any module contract should implement
 * @notice Contract is abstract
 */
contract Module is IModule, ModuleStorage {event __CoverageModule(string fileName, uint256 lineNumber);
event __FunctionCoverageModule(string fileName, uint256 fnId);
event __StatementCoverageModule(string fileName, uint256 statementId);
event __BranchCoverageModule(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageModule(string fileName, uint256 branchId);
event __AssertPostCoverageModule(string fileName, uint256 branchId);


    /**
     * @notice Constructor
     * @param _securityToken Address of the security token
     * @param _polyAddress Address of the polytoken
     */
    constructor (address _securityToken, address _polyAddress) public
    ModuleStorage(_securityToken, _polyAddress)
    {emit __FunctionCoverageModule('./contracts/modules/Module.sol',1);

    }

    //Allows owner, factory or permissioned delegate
    modifier withPerm(bytes32 _perm) {emit __FunctionCoverageModule('./contracts/modules/Module.sol',2);

emit __CoverageModule('./contracts/modules/Module.sol',26);
        emit __StatementCoverageModule('./contracts/modules/Module.sol',1);
bool isOwner = msg.sender == Ownable(securityToken).owner();
emit __CoverageModule('./contracts/modules/Module.sol',27);
        emit __StatementCoverageModule('./contracts/modules/Module.sol',2);
bool isFactory = msg.sender == factory;
emit __CoverageModule('./contracts/modules/Module.sol',28);
        emit __AssertPreCoverageModule('./contracts/modules/Module.sol',1);
emit __StatementCoverageModule('./contracts/modules/Module.sol',3);
require(isOwner||isFactory||ISecurityToken(securityToken).checkPermission(msg.sender, address(this), _perm), "Permission check failed");emit __AssertPostCoverageModule('./contracts/modules/Module.sol',1);

emit __CoverageModule('./contracts/modules/Module.sol',29);
        _;
    }

    modifier onlyOwner {emit __FunctionCoverageModule('./contracts/modules/Module.sol',3);

emit __CoverageModule('./contracts/modules/Module.sol',33);
        emit __AssertPreCoverageModule('./contracts/modules/Module.sol',2);
emit __StatementCoverageModule('./contracts/modules/Module.sol',4);
require(msg.sender == Ownable(securityToken).owner(), "Sender is not owner");emit __AssertPostCoverageModule('./contracts/modules/Module.sol',2);

emit __CoverageModule('./contracts/modules/Module.sol',34);
        _;
    }

    modifier onlyFactory {emit __FunctionCoverageModule('./contracts/modules/Module.sol',4);

emit __CoverageModule('./contracts/modules/Module.sol',38);
        emit __AssertPreCoverageModule('./contracts/modules/Module.sol',3);
emit __StatementCoverageModule('./contracts/modules/Module.sol',5);
require(msg.sender == factory, "Sender is not factory");emit __AssertPostCoverageModule('./contracts/modules/Module.sol',3);

emit __CoverageModule('./contracts/modules/Module.sol',39);
        _;
    }

    modifier onlyFactoryOwner {emit __FunctionCoverageModule('./contracts/modules/Module.sol',5);

emit __CoverageModule('./contracts/modules/Module.sol',43);
        emit __AssertPreCoverageModule('./contracts/modules/Module.sol',4);
emit __StatementCoverageModule('./contracts/modules/Module.sol',6);
require(msg.sender == Ownable(factory).owner(), "Sender is not factory owner");emit __AssertPostCoverageModule('./contracts/modules/Module.sol',4);

emit __CoverageModule('./contracts/modules/Module.sol',44);
        _;
    }

    modifier onlyFactoryOrOwner {emit __FunctionCoverageModule('./contracts/modules/Module.sol',6);

emit __CoverageModule('./contracts/modules/Module.sol',48);
        emit __AssertPreCoverageModule('./contracts/modules/Module.sol',5);
emit __StatementCoverageModule('./contracts/modules/Module.sol',7);
require((msg.sender == Ownable(securityToken).owner()) || (msg.sender == factory), "Sender is not factory or owner");emit __AssertPostCoverageModule('./contracts/modules/Module.sol',5);

emit __CoverageModule('./contracts/modules/Module.sol',49);
        _;
    }

    /**
     * @notice used to withdraw the fee by the factory owner
     */
    function takeFee(uint256 _amount) public withPerm(FEE_ADMIN) returns(bool) {emit __FunctionCoverageModule('./contracts/modules/Module.sol',7);

emit __CoverageModule('./contracts/modules/Module.sol',56);
        emit __AssertPreCoverageModule('./contracts/modules/Module.sol',6);
emit __StatementCoverageModule('./contracts/modules/Module.sol',8);
require(polyToken.transferFrom(securityToken, Ownable(factory).owner(), _amount), "Unable to take fee");emit __AssertPostCoverageModule('./contracts/modules/Module.sol',6);

emit __CoverageModule('./contracts/modules/Module.sol',57);
        emit __StatementCoverageModule('./contracts/modules/Module.sol',9);
return true;
    }
}
