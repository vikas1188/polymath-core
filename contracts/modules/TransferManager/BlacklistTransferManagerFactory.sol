pragma solidity ^0.4.24;

import "./BlacklistTransferManager.sol";
import "../ModuleFactory.sol";
import "../../libraries/Util.sol";

/**
 * @title Factory for deploying BlacklistManager module
 */
contract BlacklistTransferManagerFactory is ModuleFactory {event __CoverageBlacklistTransferManagerFactory(string fileName, uint256 lineNumber);
event __FunctionCoverageBlacklistTransferManagerFactory(string fileName, uint256 fnId);
event __StatementCoverageBlacklistTransferManagerFactory(string fileName, uint256 statementId);
event __BranchCoverageBlacklistTransferManagerFactory(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageBlacklistTransferManagerFactory(string fileName, uint256 branchId);
event __AssertPostCoverageBlacklistTransferManagerFactory(string fileName, uint256 branchId);


    /**
     * @notice Constructor
     * @param _polyAddress Address of the polytoken
     * @param _setupCost Setup cost of the module
     * @param _usageCost Usage cost of the module
     * @param _subscriptionCost Subscription cost of the module
     */
    constructor (address _polyAddress, uint256 _setupCost, uint256 _usageCost, uint256 _subscriptionCost) public
    ModuleFactory(_polyAddress, _setupCost, _usageCost, _subscriptionCost)
    {emit __FunctionCoverageBlacklistTransferManagerFactory('./contracts/modules/TransferManager/BlacklistTransferManagerFactory.sol',1);
   
emit __CoverageBlacklistTransferManagerFactory('./contracts/modules/TransferManager/BlacklistTransferManagerFactory.sol',22);
        emit __StatementCoverageBlacklistTransferManagerFactory('./contracts/modules/TransferManager/BlacklistTransferManagerFactory.sol',1);
version = "2.1.0";
emit __CoverageBlacklistTransferManagerFactory('./contracts/modules/TransferManager/BlacklistTransferManagerFactory.sol',23);
        emit __StatementCoverageBlacklistTransferManagerFactory('./contracts/modules/TransferManager/BlacklistTransferManagerFactory.sol',2);
name = "BlacklistTransferManager";
emit __CoverageBlacklistTransferManagerFactory('./contracts/modules/TransferManager/BlacklistTransferManagerFactory.sol',24);
        emit __StatementCoverageBlacklistTransferManagerFactory('./contracts/modules/TransferManager/BlacklistTransferManagerFactory.sol',3);
title = "Blacklist Transfer Manager";
emit __CoverageBlacklistTransferManagerFactory('./contracts/modules/TransferManager/BlacklistTransferManagerFactory.sol',25);
        emit __StatementCoverageBlacklistTransferManagerFactory('./contracts/modules/TransferManager/BlacklistTransferManagerFactory.sol',4);
description = "Automate blacklist to restrict selling";
emit __CoverageBlacklistTransferManagerFactory('./contracts/modules/TransferManager/BlacklistTransferManagerFactory.sol',26);
        emit __StatementCoverageBlacklistTransferManagerFactory('./contracts/modules/TransferManager/BlacklistTransferManagerFactory.sol',5);
compatibleSTVersionRange["lowerBound"] = VersionUtils.pack(uint8(0), uint8(0), uint8(0));
emit __CoverageBlacklistTransferManagerFactory('./contracts/modules/TransferManager/BlacklistTransferManagerFactory.sol',27);
        emit __StatementCoverageBlacklistTransferManagerFactory('./contracts/modules/TransferManager/BlacklistTransferManagerFactory.sol',6);
compatibleSTVersionRange["upperBound"] = VersionUtils.pack(uint8(0), uint8(0), uint8(0));
    }

     /**
     * @notice used to launch the Module with the help of factory
     * @return address Contract address of the Module
     */
    function deploy(bytes /* _data */) external returns(address) {emit __FunctionCoverageBlacklistTransferManagerFactory('./contracts/modules/TransferManager/BlacklistTransferManagerFactory.sol',2);

emit __CoverageBlacklistTransferManagerFactory('./contracts/modules/TransferManager/BlacklistTransferManagerFactory.sol',35);
        emit __StatementCoverageBlacklistTransferManagerFactory('./contracts/modules/TransferManager/BlacklistTransferManagerFactory.sol',7);
if (setupCost > 0)
            {emit __AssertPreCoverageBlacklistTransferManagerFactory('./contracts/modules/TransferManager/BlacklistTransferManagerFactory.sol',2);
emit __StatementCoverageBlacklistTransferManagerFactory('./contracts/modules/TransferManager/BlacklistTransferManagerFactory.sol',8);
emit __BranchCoverageBlacklistTransferManagerFactory('./contracts/modules/TransferManager/BlacklistTransferManagerFactory.sol',1,0);emit __CoverageBlacklistTransferManagerFactory('./contracts/modules/TransferManager/BlacklistTransferManagerFactory.sol',36);
require(polyToken.transferFrom(msg.sender, owner, setupCost), "Failed transferFrom because of sufficent Allowance is not provided");emit __AssertPostCoverageBlacklistTransferManagerFactory('./contracts/modules/TransferManager/BlacklistTransferManagerFactory.sol',2);
}else { emit __BranchCoverageBlacklistTransferManagerFactory('./contracts/modules/TransferManager/BlacklistTransferManagerFactory.sol',1,1);}

emit __CoverageBlacklistTransferManagerFactory('./contracts/modules/TransferManager/BlacklistTransferManagerFactory.sol',37);
        emit __StatementCoverageBlacklistTransferManagerFactory('./contracts/modules/TransferManager/BlacklistTransferManagerFactory.sol',9);
address blacklistTransferManager = new BlacklistTransferManager(msg.sender, address(polyToken));
        /*solium-disable-next-line security/no-block-members*/
emit __CoverageBlacklistTransferManagerFactory('./contracts/modules/TransferManager/BlacklistTransferManagerFactory.sol',39);
        emit __StatementCoverageBlacklistTransferManagerFactory('./contracts/modules/TransferManager/BlacklistTransferManagerFactory.sol',10);
emit GenerateModuleFromFactory(address(blacklistTransferManager), getName(), address(this), msg.sender, setupCost, now);
emit __CoverageBlacklistTransferManagerFactory('./contracts/modules/TransferManager/BlacklistTransferManagerFactory.sol',40);
        emit __StatementCoverageBlacklistTransferManagerFactory('./contracts/modules/TransferManager/BlacklistTransferManagerFactory.sol',11);
return address(blacklistTransferManager);
    }

    /**
     * @notice Type of the Module factory
     */
    function getTypes() external  returns(uint8[]) {emit __FunctionCoverageBlacklistTransferManagerFactory('./contracts/modules/TransferManager/BlacklistTransferManagerFactory.sol',3);

emit __CoverageBlacklistTransferManagerFactory('./contracts/modules/TransferManager/BlacklistTransferManagerFactory.sol',47);
        emit __StatementCoverageBlacklistTransferManagerFactory('./contracts/modules/TransferManager/BlacklistTransferManagerFactory.sol',12);
uint8[] memory res = new uint8[](1);
emit __CoverageBlacklistTransferManagerFactory('./contracts/modules/TransferManager/BlacklistTransferManagerFactory.sol',48);
        emit __StatementCoverageBlacklistTransferManagerFactory('./contracts/modules/TransferManager/BlacklistTransferManagerFactory.sol',13);
res[0] = 2;
emit __CoverageBlacklistTransferManagerFactory('./contracts/modules/TransferManager/BlacklistTransferManagerFactory.sol',49);
        emit __StatementCoverageBlacklistTransferManagerFactory('./contracts/modules/TransferManager/BlacklistTransferManagerFactory.sol',14);
return res;
    }

    /**
     * @notice Get the Instructions that helped to used the module
     */
    function getInstructions() public  returns(string) {emit __FunctionCoverageBlacklistTransferManagerFactory('./contracts/modules/TransferManager/BlacklistTransferManagerFactory.sol',4);

emit __CoverageBlacklistTransferManagerFactory('./contracts/modules/TransferManager/BlacklistTransferManagerFactory.sol',56);
        emit __StatementCoverageBlacklistTransferManagerFactory('./contracts/modules/TransferManager/BlacklistTransferManagerFactory.sol',15);
return "Allows an issuer to blacklist the addresses.";
    }

    /**
     * @notice Get the tags related to the module factory
     */
    function getTags() public  returns(bytes32[]) {emit __FunctionCoverageBlacklistTransferManagerFactory('./contracts/modules/TransferManager/BlacklistTransferManagerFactory.sol',5);

emit __CoverageBlacklistTransferManagerFactory('./contracts/modules/TransferManager/BlacklistTransferManagerFactory.sol',63);
        emit __StatementCoverageBlacklistTransferManagerFactory('./contracts/modules/TransferManager/BlacklistTransferManagerFactory.sol',16);
bytes32[] memory availableTags = new bytes32[](2);
emit __CoverageBlacklistTransferManagerFactory('./contracts/modules/TransferManager/BlacklistTransferManagerFactory.sol',64);
        emit __StatementCoverageBlacklistTransferManagerFactory('./contracts/modules/TransferManager/BlacklistTransferManagerFactory.sol',17);
availableTags[0] = "Blacklist";
emit __CoverageBlacklistTransferManagerFactory('./contracts/modules/TransferManager/BlacklistTransferManagerFactory.sol',65);
        emit __StatementCoverageBlacklistTransferManagerFactory('./contracts/modules/TransferManager/BlacklistTransferManagerFactory.sol',18);
availableTags[1] = "Restricted transfer";
emit __CoverageBlacklistTransferManagerFactory('./contracts/modules/TransferManager/BlacklistTransferManagerFactory.sol',66);
        emit __StatementCoverageBlacklistTransferManagerFactory('./contracts/modules/TransferManager/BlacklistTransferManagerFactory.sol',19);
return availableTags;
    }


}
