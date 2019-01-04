pragma solidity ^0.4.24;

import "../../proxy/GeneralTransferManagerProxy.sol";
import "../ModuleFactory.sol";

/**
 * @title Factory for deploying GeneralTransferManager module
 */
contract GeneralTransferManagerFactory is ModuleFactory {event __CoverageGeneralTransferManagerFactory(string fileName, uint256 lineNumber);
event __FunctionCoverageGeneralTransferManagerFactory(string fileName, uint256 fnId);
event __StatementCoverageGeneralTransferManagerFactory(string fileName, uint256 statementId);
event __BranchCoverageGeneralTransferManagerFactory(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageGeneralTransferManagerFactory(string fileName, uint256 branchId);
event __AssertPostCoverageGeneralTransferManagerFactory(string fileName, uint256 branchId);


    address public logicContract;

    /**
     * @notice Constructor
     * @param _polyAddress Address of the polytoken
     * @param _setupCost Setup cost of the module
     * @param _usageCost Usage cost of the module
     * @param _subscriptionCost Subscription cost of the module
     * @param _logicContract Contract address that contains the logic related to `description`
     */
    constructor (address _polyAddress, uint256 _setupCost, uint256 _usageCost, uint256 _subscriptionCost, address _logicContract) public
    ModuleFactory(_polyAddress, _setupCost, _usageCost, _subscriptionCost)
    {emit __FunctionCoverageGeneralTransferManagerFactory('./contracts/modules/TransferManager/GeneralTransferManagerFactory.sol',1);

emit __CoverageGeneralTransferManagerFactory('./contracts/modules/TransferManager/GeneralTransferManagerFactory.sol',24);
        emit __AssertPreCoverageGeneralTransferManagerFactory('./contracts/modules/TransferManager/GeneralTransferManagerFactory.sol',1);
emit __StatementCoverageGeneralTransferManagerFactory('./contracts/modules/TransferManager/GeneralTransferManagerFactory.sol',1);
require(_logicContract != address(0), "Invalid logic contract");emit __AssertPostCoverageGeneralTransferManagerFactory('./contracts/modules/TransferManager/GeneralTransferManagerFactory.sol',1);

emit __CoverageGeneralTransferManagerFactory('./contracts/modules/TransferManager/GeneralTransferManagerFactory.sol',25);
        emit __StatementCoverageGeneralTransferManagerFactory('./contracts/modules/TransferManager/GeneralTransferManagerFactory.sol',2);
version = "2.1.0";
emit __CoverageGeneralTransferManagerFactory('./contracts/modules/TransferManager/GeneralTransferManagerFactory.sol',26);
        emit __StatementCoverageGeneralTransferManagerFactory('./contracts/modules/TransferManager/GeneralTransferManagerFactory.sol',3);
name = "GeneralTransferManager";
emit __CoverageGeneralTransferManagerFactory('./contracts/modules/TransferManager/GeneralTransferManagerFactory.sol',27);
        emit __StatementCoverageGeneralTransferManagerFactory('./contracts/modules/TransferManager/GeneralTransferManagerFactory.sol',4);
title = "General Transfer Manager";
emit __CoverageGeneralTransferManagerFactory('./contracts/modules/TransferManager/GeneralTransferManagerFactory.sol',28);
        emit __StatementCoverageGeneralTransferManagerFactory('./contracts/modules/TransferManager/GeneralTransferManagerFactory.sol',5);
description = "Manage transfers using a time based whitelist";
emit __CoverageGeneralTransferManagerFactory('./contracts/modules/TransferManager/GeneralTransferManagerFactory.sol',29);
        emit __StatementCoverageGeneralTransferManagerFactory('./contracts/modules/TransferManager/GeneralTransferManagerFactory.sol',6);
compatibleSTVersionRange["lowerBound"] = VersionUtils.pack(uint8(0), uint8(0), uint8(0));
emit __CoverageGeneralTransferManagerFactory('./contracts/modules/TransferManager/GeneralTransferManagerFactory.sol',30);
        emit __StatementCoverageGeneralTransferManagerFactory('./contracts/modules/TransferManager/GeneralTransferManagerFactory.sol',7);
compatibleSTVersionRange["upperBound"] = VersionUtils.pack(uint8(0), uint8(0), uint8(0));
emit __CoverageGeneralTransferManagerFactory('./contracts/modules/TransferManager/GeneralTransferManagerFactory.sol',31);
        emit __StatementCoverageGeneralTransferManagerFactory('./contracts/modules/TransferManager/GeneralTransferManagerFactory.sol',8);
logicContract = _logicContract;
    }


     /**
     * @notice Used to launch the Module with the help of factory
     * @return address Contract address of the Module
     */
    function deploy(bytes /* _data */) external returns(address) {emit __FunctionCoverageGeneralTransferManagerFactory('./contracts/modules/TransferManager/GeneralTransferManagerFactory.sol',2);

emit __CoverageGeneralTransferManagerFactory('./contracts/modules/TransferManager/GeneralTransferManagerFactory.sol',40);
        emit __StatementCoverageGeneralTransferManagerFactory('./contracts/modules/TransferManager/GeneralTransferManagerFactory.sol',9);
if (setupCost > 0)
            {emit __AssertPreCoverageGeneralTransferManagerFactory('./contracts/modules/TransferManager/GeneralTransferManagerFactory.sol',3);
emit __StatementCoverageGeneralTransferManagerFactory('./contracts/modules/TransferManager/GeneralTransferManagerFactory.sol',10);
emit __BranchCoverageGeneralTransferManagerFactory('./contracts/modules/TransferManager/GeneralTransferManagerFactory.sol',2,0);emit __CoverageGeneralTransferManagerFactory('./contracts/modules/TransferManager/GeneralTransferManagerFactory.sol',41);
require(polyToken.transferFrom(msg.sender, owner, setupCost), "Failed transferFrom because of sufficent Allowance is not provided");emit __AssertPostCoverageGeneralTransferManagerFactory('./contracts/modules/TransferManager/GeneralTransferManagerFactory.sol',3);
}else { emit __BranchCoverageGeneralTransferManagerFactory('./contracts/modules/TransferManager/GeneralTransferManagerFactory.sol',2,1);}

emit __CoverageGeneralTransferManagerFactory('./contracts/modules/TransferManager/GeneralTransferManagerFactory.sol',42);
        emit __StatementCoverageGeneralTransferManagerFactory('./contracts/modules/TransferManager/GeneralTransferManagerFactory.sol',11);
address generalTransferManager = new GeneralTransferManagerProxy(msg.sender, address(polyToken), logicContract);
        /*solium-disable-next-line security/no-block-members*/
emit __CoverageGeneralTransferManagerFactory('./contracts/modules/TransferManager/GeneralTransferManagerFactory.sol',44);
        emit __StatementCoverageGeneralTransferManagerFactory('./contracts/modules/TransferManager/GeneralTransferManagerFactory.sol',12);
emit GenerateModuleFromFactory(address(generalTransferManager), getName(), address(this), msg.sender, setupCost, now);
emit __CoverageGeneralTransferManagerFactory('./contracts/modules/TransferManager/GeneralTransferManagerFactory.sol',45);
        emit __StatementCoverageGeneralTransferManagerFactory('./contracts/modules/TransferManager/GeneralTransferManagerFactory.sol',13);
return address(generalTransferManager);
    }


    /**
     * @notice Type of the Module factory
     */
    function getTypes() external  returns(uint8[]) {emit __FunctionCoverageGeneralTransferManagerFactory('./contracts/modules/TransferManager/GeneralTransferManagerFactory.sol',3);

emit __CoverageGeneralTransferManagerFactory('./contracts/modules/TransferManager/GeneralTransferManagerFactory.sol',53);
        emit __StatementCoverageGeneralTransferManagerFactory('./contracts/modules/TransferManager/GeneralTransferManagerFactory.sol',14);
uint8[] memory res = new uint8[](1);
emit __CoverageGeneralTransferManagerFactory('./contracts/modules/TransferManager/GeneralTransferManagerFactory.sol',54);
        emit __StatementCoverageGeneralTransferManagerFactory('./contracts/modules/TransferManager/GeneralTransferManagerFactory.sol',15);
res[0] = 2;
emit __CoverageGeneralTransferManagerFactory('./contracts/modules/TransferManager/GeneralTransferManagerFactory.sol',55);
        emit __StatementCoverageGeneralTransferManagerFactory('./contracts/modules/TransferManager/GeneralTransferManagerFactory.sol',16);
return res;
    }

    /**
     * @notice Returns the instructions associated with the module
     */
    function getInstructions() external  returns(string) {emit __FunctionCoverageGeneralTransferManagerFactory('./contracts/modules/TransferManager/GeneralTransferManagerFactory.sol',4);

        /*solium-disable-next-line max-len*/
emit __CoverageGeneralTransferManagerFactory('./contracts/modules/TransferManager/GeneralTransferManagerFactory.sol',63);
        emit __StatementCoverageGeneralTransferManagerFactory('./contracts/modules/TransferManager/GeneralTransferManagerFactory.sol',17);
return "Allows an issuer to maintain a time based whitelist of authorised token holders.Addresses are added via modifyWhitelist and take a fromTime (the time from which they can send tokens) and a toTime (the time from which they can receive tokens). There are additional flags, allowAllWhitelistIssuances, allowAllWhitelistTransfers & allowAllTransfers which allow you to set corresponding contract level behaviour. Init function takes no parameters.";
    }

    /**
     * @notice Get the tags related to the module factory
     */
    function getTags() public  returns(bytes32[]) {emit __FunctionCoverageGeneralTransferManagerFactory('./contracts/modules/TransferManager/GeneralTransferManagerFactory.sol',5);

emit __CoverageGeneralTransferManagerFactory('./contracts/modules/TransferManager/GeneralTransferManagerFactory.sol',70);
        emit __StatementCoverageGeneralTransferManagerFactory('./contracts/modules/TransferManager/GeneralTransferManagerFactory.sol',18);
bytes32[] memory availableTags = new bytes32[](2);
emit __CoverageGeneralTransferManagerFactory('./contracts/modules/TransferManager/GeneralTransferManagerFactory.sol',71);
        emit __StatementCoverageGeneralTransferManagerFactory('./contracts/modules/TransferManager/GeneralTransferManagerFactory.sol',19);
availableTags[0] = "General";
emit __CoverageGeneralTransferManagerFactory('./contracts/modules/TransferManager/GeneralTransferManagerFactory.sol',72);
        emit __StatementCoverageGeneralTransferManagerFactory('./contracts/modules/TransferManager/GeneralTransferManagerFactory.sol',20);
availableTags[1] = "Transfer Restriction";
emit __CoverageGeneralTransferManagerFactory('./contracts/modules/TransferManager/GeneralTransferManagerFactory.sol',73);
        emit __StatementCoverageGeneralTransferManagerFactory('./contracts/modules/TransferManager/GeneralTransferManagerFactory.sol',21);
return availableTags;
    }


}
