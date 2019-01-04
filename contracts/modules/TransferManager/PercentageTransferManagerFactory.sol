pragma solidity ^0.4.24;

import "./PercentageTransferManager.sol";
import "../ModuleFactory.sol";
import "../../libraries/Util.sol";

/**
 * @title Factory for deploying PercentageTransferManager module
 */
contract PercentageTransferManagerFactory is ModuleFactory {event __CoveragePercentageTransferManagerFactory(string fileName, uint256 lineNumber);
event __FunctionCoveragePercentageTransferManagerFactory(string fileName, uint256 fnId);
event __StatementCoveragePercentageTransferManagerFactory(string fileName, uint256 statementId);
event __BranchCoveragePercentageTransferManagerFactory(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoveragePercentageTransferManagerFactory(string fileName, uint256 branchId);
event __AssertPostCoveragePercentageTransferManagerFactory(string fileName, uint256 branchId);


    /**
     * @notice Constructor
     * @param _polyAddress Address of the polytoken
     */
    constructor (address _polyAddress, uint256 _setupCost, uint256 _usageCost, uint256 _subscriptionCost) public
    ModuleFactory(_polyAddress, _setupCost, _usageCost, _subscriptionCost)
    {emit __FunctionCoveragePercentageTransferManagerFactory('./contracts/modules/TransferManager/PercentageTransferManagerFactory.sol',1);

emit __CoveragePercentageTransferManagerFactory('./contracts/modules/TransferManager/PercentageTransferManagerFactory.sol',19);
        emit __StatementCoveragePercentageTransferManagerFactory('./contracts/modules/TransferManager/PercentageTransferManagerFactory.sol',1);
version = "1.0.0";
emit __CoveragePercentageTransferManagerFactory('./contracts/modules/TransferManager/PercentageTransferManagerFactory.sol',20);
        emit __StatementCoveragePercentageTransferManagerFactory('./contracts/modules/TransferManager/PercentageTransferManagerFactory.sol',2);
name = "PercentageTransferManager";
emit __CoveragePercentageTransferManagerFactory('./contracts/modules/TransferManager/PercentageTransferManagerFactory.sol',21);
        emit __StatementCoveragePercentageTransferManagerFactory('./contracts/modules/TransferManager/PercentageTransferManagerFactory.sol',3);
title = "Percentage Transfer Manager";
emit __CoveragePercentageTransferManagerFactory('./contracts/modules/TransferManager/PercentageTransferManagerFactory.sol',22);
        emit __StatementCoveragePercentageTransferManagerFactory('./contracts/modules/TransferManager/PercentageTransferManagerFactory.sol',4);
description = "Restrict the number of investors";
emit __CoveragePercentageTransferManagerFactory('./contracts/modules/TransferManager/PercentageTransferManagerFactory.sol',23);
        emit __StatementCoveragePercentageTransferManagerFactory('./contracts/modules/TransferManager/PercentageTransferManagerFactory.sol',5);
compatibleSTVersionRange["lowerBound"] = VersionUtils.pack(uint8(0), uint8(0), uint8(0));
emit __CoveragePercentageTransferManagerFactory('./contracts/modules/TransferManager/PercentageTransferManagerFactory.sol',24);
        emit __StatementCoveragePercentageTransferManagerFactory('./contracts/modules/TransferManager/PercentageTransferManagerFactory.sol',6);
compatibleSTVersionRange["upperBound"] = VersionUtils.pack(uint8(0), uint8(0), uint8(0));
    }

    /**
     * @notice used to launch the Module with the help of factory
     * @param _data Data used for the intialization of the module factory variables
     * @return address Contract address of the Module
     */
    function deploy(bytes _data) external returns(address) {emit __FunctionCoveragePercentageTransferManagerFactory('./contracts/modules/TransferManager/PercentageTransferManagerFactory.sol',2);

emit __CoveragePercentageTransferManagerFactory('./contracts/modules/TransferManager/PercentageTransferManagerFactory.sol',33);
        emit __StatementCoveragePercentageTransferManagerFactory('./contracts/modules/TransferManager/PercentageTransferManagerFactory.sol',7);
if(setupCost > 0)
            {emit __AssertPreCoveragePercentageTransferManagerFactory('./contracts/modules/TransferManager/PercentageTransferManagerFactory.sol',2);
emit __StatementCoveragePercentageTransferManagerFactory('./contracts/modules/TransferManager/PercentageTransferManagerFactory.sol',8);
emit __BranchCoveragePercentageTransferManagerFactory('./contracts/modules/TransferManager/PercentageTransferManagerFactory.sol',1,0);emit __CoveragePercentageTransferManagerFactory('./contracts/modules/TransferManager/PercentageTransferManagerFactory.sol',34);
require(polyToken.transferFrom(msg.sender, owner, setupCost), "Failed transferFrom because of sufficent Allowance is not provided");emit __AssertPostCoveragePercentageTransferManagerFactory('./contracts/modules/TransferManager/PercentageTransferManagerFactory.sol',2);
}else { emit __BranchCoveragePercentageTransferManagerFactory('./contracts/modules/TransferManager/PercentageTransferManagerFactory.sol',1,1);}

emit __CoveragePercentageTransferManagerFactory('./contracts/modules/TransferManager/PercentageTransferManagerFactory.sol',35);
        emit __StatementCoveragePercentageTransferManagerFactory('./contracts/modules/TransferManager/PercentageTransferManagerFactory.sol',9);
PercentageTransferManager percentageTransferManager = new PercentageTransferManager(msg.sender, address(polyToken));
emit __CoveragePercentageTransferManagerFactory('./contracts/modules/TransferManager/PercentageTransferManagerFactory.sol',36);
        emit __AssertPreCoveragePercentageTransferManagerFactory('./contracts/modules/TransferManager/PercentageTransferManagerFactory.sol',3);
emit __StatementCoveragePercentageTransferManagerFactory('./contracts/modules/TransferManager/PercentageTransferManagerFactory.sol',10);
require(Util.getSig(_data) == percentageTransferManager.getInitFunction(), "Provided data is not valid");emit __AssertPostCoveragePercentageTransferManagerFactory('./contracts/modules/TransferManager/PercentageTransferManagerFactory.sol',3);

        /*solium-disable-next-line security/no-low-level-calls*/
emit __CoveragePercentageTransferManagerFactory('./contracts/modules/TransferManager/PercentageTransferManagerFactory.sol',38);
        emit __AssertPreCoveragePercentageTransferManagerFactory('./contracts/modules/TransferManager/PercentageTransferManagerFactory.sol',4);
emit __StatementCoveragePercentageTransferManagerFactory('./contracts/modules/TransferManager/PercentageTransferManagerFactory.sol',11);
require(address(percentageTransferManager).call(_data), "Unsuccessful call");emit __AssertPostCoveragePercentageTransferManagerFactory('./contracts/modules/TransferManager/PercentageTransferManagerFactory.sol',4);

        /*solium-disable-next-line security/no-block-members*/
emit __CoveragePercentageTransferManagerFactory('./contracts/modules/TransferManager/PercentageTransferManagerFactory.sol',40);
        emit __StatementCoveragePercentageTransferManagerFactory('./contracts/modules/TransferManager/PercentageTransferManagerFactory.sol',12);
emit GenerateModuleFromFactory(address(percentageTransferManager), getName(), address(this), msg.sender, setupCost, now);
emit __CoveragePercentageTransferManagerFactory('./contracts/modules/TransferManager/PercentageTransferManagerFactory.sol',41);
        emit __StatementCoveragePercentageTransferManagerFactory('./contracts/modules/TransferManager/PercentageTransferManagerFactory.sol',13);
return address(percentageTransferManager);

    }

    /**
     * @notice Type of the Module factory
     * @return uint8
     */
    function getTypes() external  returns(uint8[]) {emit __FunctionCoveragePercentageTransferManagerFactory('./contracts/modules/TransferManager/PercentageTransferManagerFactory.sol',3);

emit __CoveragePercentageTransferManagerFactory('./contracts/modules/TransferManager/PercentageTransferManagerFactory.sol',50);
        emit __StatementCoveragePercentageTransferManagerFactory('./contracts/modules/TransferManager/PercentageTransferManagerFactory.sol',14);
uint8[] memory res = new uint8[](1);
emit __CoveragePercentageTransferManagerFactory('./contracts/modules/TransferManager/PercentageTransferManagerFactory.sol',51);
        emit __StatementCoveragePercentageTransferManagerFactory('./contracts/modules/TransferManager/PercentageTransferManagerFactory.sol',15);
res[0] = 2;
emit __CoveragePercentageTransferManagerFactory('./contracts/modules/TransferManager/PercentageTransferManagerFactory.sol',52);
        emit __StatementCoveragePercentageTransferManagerFactory('./contracts/modules/TransferManager/PercentageTransferManagerFactory.sol',16);
return res;
    }

    /**
     * @notice Returns the instructions associated with the module
     */
    function getInstructions() external  returns(string) {emit __FunctionCoveragePercentageTransferManagerFactory('./contracts/modules/TransferManager/PercentageTransferManagerFactory.sol',4);

emit __CoveragePercentageTransferManagerFactory('./contracts/modules/TransferManager/PercentageTransferManagerFactory.sol',59);
        emit __StatementCoveragePercentageTransferManagerFactory('./contracts/modules/TransferManager/PercentageTransferManagerFactory.sol',17);
return "Allows an issuer to restrict the total number of non-zero token holders";
    }

    /**
     * @notice Get the tags related to the module factory
     */
    function getTags() external  returns(bytes32[]) {emit __FunctionCoveragePercentageTransferManagerFactory('./contracts/modules/TransferManager/PercentageTransferManagerFactory.sol',5);

emit __CoveragePercentageTransferManagerFactory('./contracts/modules/TransferManager/PercentageTransferManagerFactory.sol',66);
        emit __StatementCoveragePercentageTransferManagerFactory('./contracts/modules/TransferManager/PercentageTransferManagerFactory.sol',18);
bytes32[] memory availableTags = new bytes32[](2);
emit __CoveragePercentageTransferManagerFactory('./contracts/modules/TransferManager/PercentageTransferManagerFactory.sol',67);
        emit __StatementCoveragePercentageTransferManagerFactory('./contracts/modules/TransferManager/PercentageTransferManagerFactory.sol',19);
availableTags[0] = "Percentage";
emit __CoveragePercentageTransferManagerFactory('./contracts/modules/TransferManager/PercentageTransferManagerFactory.sol',68);
        emit __StatementCoveragePercentageTransferManagerFactory('./contracts/modules/TransferManager/PercentageTransferManagerFactory.sol',20);
availableTags[1] = "Transfer Restriction";
emit __CoveragePercentageTransferManagerFactory('./contracts/modules/TransferManager/PercentageTransferManagerFactory.sol',69);
        emit __StatementCoveragePercentageTransferManagerFactory('./contracts/modules/TransferManager/PercentageTransferManagerFactory.sol',21);
return availableTags;
    }
}
