pragma solidity ^0.4.24;

import "./ManualApprovalTransferManager.sol";
import "../ModuleFactory.sol";

/**
 * @title Factory for deploying ManualApprovalTransferManager module
 */
contract ManualApprovalTransferManagerFactory is ModuleFactory {event __CoverageManualApprovalTransferManagerFactory(string fileName, uint256 lineNumber);
event __FunctionCoverageManualApprovalTransferManagerFactory(string fileName, uint256 fnId);
event __StatementCoverageManualApprovalTransferManagerFactory(string fileName, uint256 statementId);
event __BranchCoverageManualApprovalTransferManagerFactory(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageManualApprovalTransferManagerFactory(string fileName, uint256 branchId);
event __AssertPostCoverageManualApprovalTransferManagerFactory(string fileName, uint256 branchId);


    /**
     * @notice Constructor
     * @param _polyAddress Address of the polytoken
     * @param _setupCost Setup cost of the module
     * @param _usageCost Usage cost of the module
     * @param _subscriptionCost Subscription cost of the module
     */
    constructor (address _polyAddress, uint256 _setupCost, uint256 _usageCost, uint256 _subscriptionCost) public
    ModuleFactory(_polyAddress, _setupCost, _usageCost, _subscriptionCost)
    {emit __FunctionCoverageManualApprovalTransferManagerFactory('./contracts/modules/TransferManager/ManualApprovalTransferManagerFactory.sol',1);

emit __CoverageManualApprovalTransferManagerFactory('./contracts/modules/TransferManager/ManualApprovalTransferManagerFactory.sol',21);
        emit __StatementCoverageManualApprovalTransferManagerFactory('./contracts/modules/TransferManager/ManualApprovalTransferManagerFactory.sol',1);
version = "2.1.0";
emit __CoverageManualApprovalTransferManagerFactory('./contracts/modules/TransferManager/ManualApprovalTransferManagerFactory.sol',22);
        emit __StatementCoverageManualApprovalTransferManagerFactory('./contracts/modules/TransferManager/ManualApprovalTransferManagerFactory.sol',2);
name = "ManualApprovalTransferManager";
emit __CoverageManualApprovalTransferManagerFactory('./contracts/modules/TransferManager/ManualApprovalTransferManagerFactory.sol',23);
        emit __StatementCoverageManualApprovalTransferManagerFactory('./contracts/modules/TransferManager/ManualApprovalTransferManagerFactory.sol',3);
title = "Manual Approval Transfer Manager";
emit __CoverageManualApprovalTransferManagerFactory('./contracts/modules/TransferManager/ManualApprovalTransferManagerFactory.sol',24);
        emit __StatementCoverageManualApprovalTransferManagerFactory('./contracts/modules/TransferManager/ManualApprovalTransferManagerFactory.sol',4);
description = "Manage transfers using single approvals";
emit __CoverageManualApprovalTransferManagerFactory('./contracts/modules/TransferManager/ManualApprovalTransferManagerFactory.sol',25);
        emit __StatementCoverageManualApprovalTransferManagerFactory('./contracts/modules/TransferManager/ManualApprovalTransferManagerFactory.sol',5);
compatibleSTVersionRange["lowerBound"] = VersionUtils.pack(uint8(0), uint8(0), uint8(0));
emit __CoverageManualApprovalTransferManagerFactory('./contracts/modules/TransferManager/ManualApprovalTransferManagerFactory.sol',26);
        emit __StatementCoverageManualApprovalTransferManagerFactory('./contracts/modules/TransferManager/ManualApprovalTransferManagerFactory.sol',6);
compatibleSTVersionRange["upperBound"] = VersionUtils.pack(uint8(0), uint8(0), uint8(0));
    }

     /**
     * @notice used to launch the Module with the help of factory
     * @return address Contract address of the Module
     */
    function deploy(bytes /* _data */) external returns(address) {emit __FunctionCoverageManualApprovalTransferManagerFactory('./contracts/modules/TransferManager/ManualApprovalTransferManagerFactory.sol',2);

emit __CoverageManualApprovalTransferManagerFactory('./contracts/modules/TransferManager/ManualApprovalTransferManagerFactory.sol',34);
        emit __StatementCoverageManualApprovalTransferManagerFactory('./contracts/modules/TransferManager/ManualApprovalTransferManagerFactory.sol',7);
if (setupCost > 0)
            {emit __AssertPreCoverageManualApprovalTransferManagerFactory('./contracts/modules/TransferManager/ManualApprovalTransferManagerFactory.sol',2);
emit __StatementCoverageManualApprovalTransferManagerFactory('./contracts/modules/TransferManager/ManualApprovalTransferManagerFactory.sol',8);
emit __BranchCoverageManualApprovalTransferManagerFactory('./contracts/modules/TransferManager/ManualApprovalTransferManagerFactory.sol',1,0);emit __CoverageManualApprovalTransferManagerFactory('./contracts/modules/TransferManager/ManualApprovalTransferManagerFactory.sol',35);
require(polyToken.transferFrom(msg.sender, owner, setupCost), "Failed transferFrom because of sufficent Allowance is not provided");emit __AssertPostCoverageManualApprovalTransferManagerFactory('./contracts/modules/TransferManager/ManualApprovalTransferManagerFactory.sol',2);
}else { emit __BranchCoverageManualApprovalTransferManagerFactory('./contracts/modules/TransferManager/ManualApprovalTransferManagerFactory.sol',1,1);}

emit __CoverageManualApprovalTransferManagerFactory('./contracts/modules/TransferManager/ManualApprovalTransferManagerFactory.sol',36);
        emit __StatementCoverageManualApprovalTransferManagerFactory('./contracts/modules/TransferManager/ManualApprovalTransferManagerFactory.sol',9);
address manualTransferManager = new ManualApprovalTransferManager(msg.sender, address(polyToken));
        /*solium-disable-next-line security/no-block-members*/
emit __CoverageManualApprovalTransferManagerFactory('./contracts/modules/TransferManager/ManualApprovalTransferManagerFactory.sol',38);
        emit __StatementCoverageManualApprovalTransferManagerFactory('./contracts/modules/TransferManager/ManualApprovalTransferManagerFactory.sol',10);
emit GenerateModuleFromFactory(address(manualTransferManager), getName(), address(this), msg.sender, setupCost, now);
emit __CoverageManualApprovalTransferManagerFactory('./contracts/modules/TransferManager/ManualApprovalTransferManagerFactory.sol',39);
        emit __StatementCoverageManualApprovalTransferManagerFactory('./contracts/modules/TransferManager/ManualApprovalTransferManagerFactory.sol',11);
return address(manualTransferManager);
    }

    /**
     * @notice Type of the Module factory
     */
    function getTypes() external  returns(uint8[]) {emit __FunctionCoverageManualApprovalTransferManagerFactory('./contracts/modules/TransferManager/ManualApprovalTransferManagerFactory.sol',3);

emit __CoverageManualApprovalTransferManagerFactory('./contracts/modules/TransferManager/ManualApprovalTransferManagerFactory.sol',46);
        emit __StatementCoverageManualApprovalTransferManagerFactory('./contracts/modules/TransferManager/ManualApprovalTransferManagerFactory.sol',12);
uint8[] memory res = new uint8[](1);
emit __CoverageManualApprovalTransferManagerFactory('./contracts/modules/TransferManager/ManualApprovalTransferManagerFactory.sol',47);
        emit __StatementCoverageManualApprovalTransferManagerFactory('./contracts/modules/TransferManager/ManualApprovalTransferManagerFactory.sol',13);
res[0] = 2;
emit __CoverageManualApprovalTransferManagerFactory('./contracts/modules/TransferManager/ManualApprovalTransferManagerFactory.sol',48);
        emit __StatementCoverageManualApprovalTransferManagerFactory('./contracts/modules/TransferManager/ManualApprovalTransferManagerFactory.sol',14);
return res;
    }

    /**
     * @notice Returns the instructions associated with the module
     */
    function getInstructions() external  returns(string) {emit __FunctionCoverageManualApprovalTransferManagerFactory('./contracts/modules/TransferManager/ManualApprovalTransferManagerFactory.sol',4);

        /*solium-disable-next-line max-len*/
emit __CoverageManualApprovalTransferManagerFactory('./contracts/modules/TransferManager/ManualApprovalTransferManagerFactory.sol',56);
        emit __StatementCoverageManualApprovalTransferManagerFactory('./contracts/modules/TransferManager/ManualApprovalTransferManagerFactory.sol',15);
return "Allows an issuer to set manual approvals for specific pairs of addresses and amounts. Init function takes no parameters.";
    }

    /**
     * @notice Get the tags related to the module factory
     */
    function getTags() external  returns(bytes32[]) {emit __FunctionCoverageManualApprovalTransferManagerFactory('./contracts/modules/TransferManager/ManualApprovalTransferManagerFactory.sol',5);

emit __CoverageManualApprovalTransferManagerFactory('./contracts/modules/TransferManager/ManualApprovalTransferManagerFactory.sol',63);
        emit __StatementCoverageManualApprovalTransferManagerFactory('./contracts/modules/TransferManager/ManualApprovalTransferManagerFactory.sol',16);
bytes32[] memory availableTags = new bytes32[](2);
emit __CoverageManualApprovalTransferManagerFactory('./contracts/modules/TransferManager/ManualApprovalTransferManagerFactory.sol',64);
        emit __StatementCoverageManualApprovalTransferManagerFactory('./contracts/modules/TransferManager/ManualApprovalTransferManagerFactory.sol',17);
availableTags[0] = "ManualApproval";
emit __CoverageManualApprovalTransferManagerFactory('./contracts/modules/TransferManager/ManualApprovalTransferManagerFactory.sol',65);
        emit __StatementCoverageManualApprovalTransferManagerFactory('./contracts/modules/TransferManager/ManualApprovalTransferManagerFactory.sol',18);
availableTags[1] = "Transfer Restriction";
emit __CoverageManualApprovalTransferManagerFactory('./contracts/modules/TransferManager/ManualApprovalTransferManagerFactory.sol',66);
        emit __StatementCoverageManualApprovalTransferManagerFactory('./contracts/modules/TransferManager/ManualApprovalTransferManagerFactory.sol',19);
return availableTags;
    }


}
