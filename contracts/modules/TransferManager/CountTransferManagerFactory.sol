pragma solidity ^0.4.24;

import "./CountTransferManager.sol";
import "../ModuleFactory.sol";
import "../../libraries/Util.sol";

/**
 * @title Factory for deploying CountTransferManager module
 */
contract CountTransferManagerFactory is ModuleFactory {event __CoverageCountTransferManagerFactory(string fileName, uint256 lineNumber);
event __FunctionCoverageCountTransferManagerFactory(string fileName, uint256 fnId);
event __StatementCoverageCountTransferManagerFactory(string fileName, uint256 statementId);
event __BranchCoverageCountTransferManagerFactory(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageCountTransferManagerFactory(string fileName, uint256 branchId);
event __AssertPostCoverageCountTransferManagerFactory(string fileName, uint256 branchId);


    /**
     * @notice Constructor
     * @param _polyAddress Address of the polytoken
     */
    constructor (address _polyAddress, uint256 _setupCost, uint256 _usageCost, uint256 _subscriptionCost) public
    ModuleFactory(_polyAddress, _setupCost, _usageCost, _subscriptionCost)
    {emit __FunctionCoverageCountTransferManagerFactory('./contracts/modules/TransferManager/CountTransferManagerFactory.sol',1);

emit __CoverageCountTransferManagerFactory('./contracts/modules/TransferManager/CountTransferManagerFactory.sol',19);
        emit __StatementCoverageCountTransferManagerFactory('./contracts/modules/TransferManager/CountTransferManagerFactory.sol',1);
version = "2.1.0";
emit __CoverageCountTransferManagerFactory('./contracts/modules/TransferManager/CountTransferManagerFactory.sol',20);
        emit __StatementCoverageCountTransferManagerFactory('./contracts/modules/TransferManager/CountTransferManagerFactory.sol',2);
name = "CountTransferManager";
emit __CoverageCountTransferManagerFactory('./contracts/modules/TransferManager/CountTransferManagerFactory.sol',21);
        emit __StatementCoverageCountTransferManagerFactory('./contracts/modules/TransferManager/CountTransferManagerFactory.sol',3);
title = "Count Transfer Manager";
emit __CoverageCountTransferManagerFactory('./contracts/modules/TransferManager/CountTransferManagerFactory.sol',22);
        emit __StatementCoverageCountTransferManagerFactory('./contracts/modules/TransferManager/CountTransferManagerFactory.sol',4);
description = "Restrict the number of investors";
emit __CoverageCountTransferManagerFactory('./contracts/modules/TransferManager/CountTransferManagerFactory.sol',23);
        emit __StatementCoverageCountTransferManagerFactory('./contracts/modules/TransferManager/CountTransferManagerFactory.sol',5);
compatibleSTVersionRange["lowerBound"] = VersionUtils.pack(uint8(0), uint8(0), uint8(0));
emit __CoverageCountTransferManagerFactory('./contracts/modules/TransferManager/CountTransferManagerFactory.sol',24);
        emit __StatementCoverageCountTransferManagerFactory('./contracts/modules/TransferManager/CountTransferManagerFactory.sol',6);
compatibleSTVersionRange["upperBound"] = VersionUtils.pack(uint8(0), uint8(0), uint8(0));
    }

    /**
     * @notice Used to launch the Module with the help of factory
     * @param _data Data used for the intialization of the module factory variables
     * @return address Contract address of the Module
     */
    function deploy(bytes _data) external returns(address) {emit __FunctionCoverageCountTransferManagerFactory('./contracts/modules/TransferManager/CountTransferManagerFactory.sol',2);

emit __CoverageCountTransferManagerFactory('./contracts/modules/TransferManager/CountTransferManagerFactory.sol',33);
        emit __StatementCoverageCountTransferManagerFactory('./contracts/modules/TransferManager/CountTransferManagerFactory.sol',7);
if(setupCost > 0)
            {emit __AssertPreCoverageCountTransferManagerFactory('./contracts/modules/TransferManager/CountTransferManagerFactory.sol',2);
emit __StatementCoverageCountTransferManagerFactory('./contracts/modules/TransferManager/CountTransferManagerFactory.sol',8);
emit __BranchCoverageCountTransferManagerFactory('./contracts/modules/TransferManager/CountTransferManagerFactory.sol',1,0);emit __CoverageCountTransferManagerFactory('./contracts/modules/TransferManager/CountTransferManagerFactory.sol',34);
require(polyToken.transferFrom(msg.sender, owner, setupCost), "Failed transferFrom due to insufficent Allowance provided");emit __AssertPostCoverageCountTransferManagerFactory('./contracts/modules/TransferManager/CountTransferManagerFactory.sol',2);
}else { emit __BranchCoverageCountTransferManagerFactory('./contracts/modules/TransferManager/CountTransferManagerFactory.sol',1,1);}

emit __CoverageCountTransferManagerFactory('./contracts/modules/TransferManager/CountTransferManagerFactory.sol',35);
        emit __StatementCoverageCountTransferManagerFactory('./contracts/modules/TransferManager/CountTransferManagerFactory.sol',9);
CountTransferManager countTransferManager = new CountTransferManager(msg.sender, address(polyToken));
emit __CoverageCountTransferManagerFactory('./contracts/modules/TransferManager/CountTransferManagerFactory.sol',36);
        emit __AssertPreCoverageCountTransferManagerFactory('./contracts/modules/TransferManager/CountTransferManagerFactory.sol',3);
emit __StatementCoverageCountTransferManagerFactory('./contracts/modules/TransferManager/CountTransferManagerFactory.sol',10);
require(Util.getSig(_data) == countTransferManager.getInitFunction(), "Provided data is not valid");emit __AssertPostCoverageCountTransferManagerFactory('./contracts/modules/TransferManager/CountTransferManagerFactory.sol',3);

        /*solium-disable-next-line security/no-low-level-calls*/
emit __CoverageCountTransferManagerFactory('./contracts/modules/TransferManager/CountTransferManagerFactory.sol',38);
        emit __AssertPreCoverageCountTransferManagerFactory('./contracts/modules/TransferManager/CountTransferManagerFactory.sol',4);
emit __StatementCoverageCountTransferManagerFactory('./contracts/modules/TransferManager/CountTransferManagerFactory.sol',11);
require(address(countTransferManager).call(_data), "Unsuccessful call");emit __AssertPostCoverageCountTransferManagerFactory('./contracts/modules/TransferManager/CountTransferManagerFactory.sol',4);

        /*solium-disable-next-line security/no-block-members*/
emit __CoverageCountTransferManagerFactory('./contracts/modules/TransferManager/CountTransferManagerFactory.sol',40);
        emit __StatementCoverageCountTransferManagerFactory('./contracts/modules/TransferManager/CountTransferManagerFactory.sol',12);
emit GenerateModuleFromFactory(address(countTransferManager), getName(), address(this), msg.sender, setupCost, now);
emit __CoverageCountTransferManagerFactory('./contracts/modules/TransferManager/CountTransferManagerFactory.sol',41);
        emit __StatementCoverageCountTransferManagerFactory('./contracts/modules/TransferManager/CountTransferManagerFactory.sol',13);
return address(countTransferManager);

    }

    /**
     * @notice Type of the Module factory
     */
    function getTypes() external  returns(uint8[]) {emit __FunctionCoverageCountTransferManagerFactory('./contracts/modules/TransferManager/CountTransferManagerFactory.sol',3);

emit __CoverageCountTransferManagerFactory('./contracts/modules/TransferManager/CountTransferManagerFactory.sol',49);
        emit __StatementCoverageCountTransferManagerFactory('./contracts/modules/TransferManager/CountTransferManagerFactory.sol',14);
uint8[] memory res = new uint8[](1);
emit __CoverageCountTransferManagerFactory('./contracts/modules/TransferManager/CountTransferManagerFactory.sol',50);
        emit __StatementCoverageCountTransferManagerFactory('./contracts/modules/TransferManager/CountTransferManagerFactory.sol',15);
res[0] = 2;
emit __CoverageCountTransferManagerFactory('./contracts/modules/TransferManager/CountTransferManagerFactory.sol',51);
        emit __StatementCoverageCountTransferManagerFactory('./contracts/modules/TransferManager/CountTransferManagerFactory.sol',16);
return res;
    }

    /**
     * @notice Returns the instructions associated with the module
     */
    function getInstructions() external  returns(string) {emit __FunctionCoverageCountTransferManagerFactory('./contracts/modules/TransferManager/CountTransferManagerFactory.sol',4);

emit __CoverageCountTransferManagerFactory('./contracts/modules/TransferManager/CountTransferManagerFactory.sol',58);
        emit __StatementCoverageCountTransferManagerFactory('./contracts/modules/TransferManager/CountTransferManagerFactory.sol',17);
return "Allows an issuer to restrict the total number of non-zero token holders";
    }

    /**
     * @notice Get the tags related to the module factory
     */
    function getTags() external  returns(bytes32[]) {emit __FunctionCoverageCountTransferManagerFactory('./contracts/modules/TransferManager/CountTransferManagerFactory.sol',5);

emit __CoverageCountTransferManagerFactory('./contracts/modules/TransferManager/CountTransferManagerFactory.sol',65);
        emit __StatementCoverageCountTransferManagerFactory('./contracts/modules/TransferManager/CountTransferManagerFactory.sol',18);
bytes32[] memory availableTags = new bytes32[](2);
emit __CoverageCountTransferManagerFactory('./contracts/modules/TransferManager/CountTransferManagerFactory.sol',66);
        emit __StatementCoverageCountTransferManagerFactory('./contracts/modules/TransferManager/CountTransferManagerFactory.sol',19);
availableTags[0] = "Count";
emit __CoverageCountTransferManagerFactory('./contracts/modules/TransferManager/CountTransferManagerFactory.sol',67);
        emit __StatementCoverageCountTransferManagerFactory('./contracts/modules/TransferManager/CountTransferManagerFactory.sol',20);
availableTags[1] = "Transfer Restriction";
emit __CoverageCountTransferManagerFactory('./contracts/modules/TransferManager/CountTransferManagerFactory.sol',68);
        emit __StatementCoverageCountTransferManagerFactory('./contracts/modules/TransferManager/CountTransferManagerFactory.sol',21);
return availableTags;
    }
}
