pragma solidity ^0.4.24;

import "./GeneralPermissionManager.sol";
import "../ModuleFactory.sol";

/**
 * @title Factory for deploying GeneralPermissionManager module
 */
contract GeneralPermissionManagerFactory is ModuleFactory {event __CoverageGeneralPermissionManagerFactory(string fileName, uint256 lineNumber);
event __FunctionCoverageGeneralPermissionManagerFactory(string fileName, uint256 fnId);
event __StatementCoverageGeneralPermissionManagerFactory(string fileName, uint256 statementId);
event __BranchCoverageGeneralPermissionManagerFactory(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageGeneralPermissionManagerFactory(string fileName, uint256 branchId);
event __AssertPostCoverageGeneralPermissionManagerFactory(string fileName, uint256 branchId);


    /**
     * @notice Constructor
     * @param _polyAddress Address of the polytoken
     */
    constructor (address _polyAddress, uint256 _setupCost, uint256 _usageCost, uint256 _subscriptionCost) public
    ModuleFactory(_polyAddress, _setupCost, _usageCost, _subscriptionCost)
    {emit __FunctionCoverageGeneralPermissionManagerFactory('./contracts/modules/PermissionManager/GeneralPermissionManagerFactory.sol',1);

emit __CoverageGeneralPermissionManagerFactory('./contracts/modules/PermissionManager/GeneralPermissionManagerFactory.sol',18);
        emit __StatementCoverageGeneralPermissionManagerFactory('./contracts/modules/PermissionManager/GeneralPermissionManagerFactory.sol',1);
version = "1.0.0";
emit __CoverageGeneralPermissionManagerFactory('./contracts/modules/PermissionManager/GeneralPermissionManagerFactory.sol',19);
        emit __StatementCoverageGeneralPermissionManagerFactory('./contracts/modules/PermissionManager/GeneralPermissionManagerFactory.sol',2);
name = "GeneralPermissionManager";
emit __CoverageGeneralPermissionManagerFactory('./contracts/modules/PermissionManager/GeneralPermissionManagerFactory.sol',20);
        emit __StatementCoverageGeneralPermissionManagerFactory('./contracts/modules/PermissionManager/GeneralPermissionManagerFactory.sol',3);
title = "General Permission Manager";
emit __CoverageGeneralPermissionManagerFactory('./contracts/modules/PermissionManager/GeneralPermissionManagerFactory.sol',21);
        emit __StatementCoverageGeneralPermissionManagerFactory('./contracts/modules/PermissionManager/GeneralPermissionManagerFactory.sol',4);
description = "Manage permissions within the Security Token and attached modules";
emit __CoverageGeneralPermissionManagerFactory('./contracts/modules/PermissionManager/GeneralPermissionManagerFactory.sol',22);
        emit __StatementCoverageGeneralPermissionManagerFactory('./contracts/modules/PermissionManager/GeneralPermissionManagerFactory.sol',5);
compatibleSTVersionRange["lowerBound"] = VersionUtils.pack(uint8(0), uint8(0), uint8(0));
emit __CoverageGeneralPermissionManagerFactory('./contracts/modules/PermissionManager/GeneralPermissionManagerFactory.sol',23);
        emit __StatementCoverageGeneralPermissionManagerFactory('./contracts/modules/PermissionManager/GeneralPermissionManagerFactory.sol',6);
compatibleSTVersionRange["upperBound"] = VersionUtils.pack(uint8(0), uint8(0), uint8(0));
    }

    /**
     * @notice Used to launch the Module with the help of factory
     * @return address Contract address of the Module
     */
    function deploy(bytes /* _data */) external returns(address) {emit __FunctionCoverageGeneralPermissionManagerFactory('./contracts/modules/PermissionManager/GeneralPermissionManagerFactory.sol',2);

emit __CoverageGeneralPermissionManagerFactory('./contracts/modules/PermissionManager/GeneralPermissionManagerFactory.sol',31);
        emit __StatementCoverageGeneralPermissionManagerFactory('./contracts/modules/PermissionManager/GeneralPermissionManagerFactory.sol',7);
if(setupCost > 0)
            {emit __AssertPreCoverageGeneralPermissionManagerFactory('./contracts/modules/PermissionManager/GeneralPermissionManagerFactory.sol',2);
emit __StatementCoverageGeneralPermissionManagerFactory('./contracts/modules/PermissionManager/GeneralPermissionManagerFactory.sol',8);
emit __BranchCoverageGeneralPermissionManagerFactory('./contracts/modules/PermissionManager/GeneralPermissionManagerFactory.sol',1,0);emit __CoverageGeneralPermissionManagerFactory('./contracts/modules/PermissionManager/GeneralPermissionManagerFactory.sol',32);
require(polyToken.transferFrom(msg.sender, owner, setupCost), "Failed transferFrom due to insufficent Allowance provided");emit __AssertPostCoverageGeneralPermissionManagerFactory('./contracts/modules/PermissionManager/GeneralPermissionManagerFactory.sol',2);
}else { emit __BranchCoverageGeneralPermissionManagerFactory('./contracts/modules/PermissionManager/GeneralPermissionManagerFactory.sol',1,1);}

emit __CoverageGeneralPermissionManagerFactory('./contracts/modules/PermissionManager/GeneralPermissionManagerFactory.sol',33);
        emit __StatementCoverageGeneralPermissionManagerFactory('./contracts/modules/PermissionManager/GeneralPermissionManagerFactory.sol',9);
address permissionManager = new GeneralPermissionManager(msg.sender, address(polyToken));
        /*solium-disable-next-line security/no-block-members*/
emit __CoverageGeneralPermissionManagerFactory('./contracts/modules/PermissionManager/GeneralPermissionManagerFactory.sol',35);
        emit __StatementCoverageGeneralPermissionManagerFactory('./contracts/modules/PermissionManager/GeneralPermissionManagerFactory.sol',10);
emit GenerateModuleFromFactory(address(permissionManager), getName(), address(this), msg.sender, setupCost, now);
emit __CoverageGeneralPermissionManagerFactory('./contracts/modules/PermissionManager/GeneralPermissionManagerFactory.sol',36);
        emit __StatementCoverageGeneralPermissionManagerFactory('./contracts/modules/PermissionManager/GeneralPermissionManagerFactory.sol',11);
return permissionManager;
    }

    /**
     * @notice Type of the Module factory
     */
    function getTypes() external  returns(uint8[]) {emit __FunctionCoverageGeneralPermissionManagerFactory('./contracts/modules/PermissionManager/GeneralPermissionManagerFactory.sol',3);

emit __CoverageGeneralPermissionManagerFactory('./contracts/modules/PermissionManager/GeneralPermissionManagerFactory.sol',43);
        emit __StatementCoverageGeneralPermissionManagerFactory('./contracts/modules/PermissionManager/GeneralPermissionManagerFactory.sol',12);
uint8[] memory res = new uint8[](1);
emit __CoverageGeneralPermissionManagerFactory('./contracts/modules/PermissionManager/GeneralPermissionManagerFactory.sol',44);
        emit __StatementCoverageGeneralPermissionManagerFactory('./contracts/modules/PermissionManager/GeneralPermissionManagerFactory.sol',13);
res[0] = 1;
emit __CoverageGeneralPermissionManagerFactory('./contracts/modules/PermissionManager/GeneralPermissionManagerFactory.sol',45);
        emit __StatementCoverageGeneralPermissionManagerFactory('./contracts/modules/PermissionManager/GeneralPermissionManagerFactory.sol',14);
return res;
    }

    /**
     * @notice Returns the instructions associated with the module
     */
    function getInstructions() external  returns(string) {emit __FunctionCoverageGeneralPermissionManagerFactory('./contracts/modules/PermissionManager/GeneralPermissionManagerFactory.sol',4);

        /*solium-disable-next-line max-len*/
emit __CoverageGeneralPermissionManagerFactory('./contracts/modules/PermissionManager/GeneralPermissionManagerFactory.sol',53);
        emit __StatementCoverageGeneralPermissionManagerFactory('./contracts/modules/PermissionManager/GeneralPermissionManagerFactory.sol',15);
return "Add and remove permissions for the SecurityToken and associated modules. Permission types should be encoded as bytes32 values and attached using withPerm modifier to relevant functions. No initFunction required.";
    }

    /**
     * @notice Get the tags related to the module factory
     */
    function getTags() external  returns(bytes32[]) {emit __FunctionCoverageGeneralPermissionManagerFactory('./contracts/modules/PermissionManager/GeneralPermissionManagerFactory.sol',5);

emit __CoverageGeneralPermissionManagerFactory('./contracts/modules/PermissionManager/GeneralPermissionManagerFactory.sol',60);
        emit __StatementCoverageGeneralPermissionManagerFactory('./contracts/modules/PermissionManager/GeneralPermissionManagerFactory.sol',16);
bytes32[] memory availableTags = new bytes32[](0);
emit __CoverageGeneralPermissionManagerFactory('./contracts/modules/PermissionManager/GeneralPermissionManagerFactory.sol',61);
        emit __StatementCoverageGeneralPermissionManagerFactory('./contracts/modules/PermissionManager/GeneralPermissionManagerFactory.sol',17);
return availableTags;
    }
}
