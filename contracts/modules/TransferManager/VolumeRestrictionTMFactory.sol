pragma solidity ^0.4.24;

import "../../proxy/VolumeRestrictionTMProxy.sol";
import "../ModuleFactory.sol";

/**
 * @title Factory for deploying VolumeRestrictionTM module
 */
contract VolumeRestrictionTMFactory is ModuleFactory {event __CoverageVolumeRestrictionTMFactory(string fileName, uint256 lineNumber);
event __FunctionCoverageVolumeRestrictionTMFactory(string fileName, uint256 fnId);
event __StatementCoverageVolumeRestrictionTMFactory(string fileName, uint256 statementId);
event __BranchCoverageVolumeRestrictionTMFactory(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageVolumeRestrictionTMFactory(string fileName, uint256 branchId);
event __AssertPostCoverageVolumeRestrictionTMFactory(string fileName, uint256 branchId);

    
    address public logicContract;

    /**
     * @notice Constructor
     * @param _polyAddress Address of the polytoken
     */
    constructor (address _polyAddress, uint256 _setupCost, uint256 _usageCost, uint256 _subscriptionCost, address _logicContract) public
    ModuleFactory(_polyAddress, _setupCost, _usageCost, _subscriptionCost)
    {emit __FunctionCoverageVolumeRestrictionTMFactory('./contracts/modules/TransferManager/VolumeRestrictionTMFactory.sol',1);
   
emit __CoverageVolumeRestrictionTMFactory('./contracts/modules/TransferManager/VolumeRestrictionTMFactory.sol',20);
        emit __AssertPreCoverageVolumeRestrictionTMFactory('./contracts/modules/TransferManager/VolumeRestrictionTMFactory.sol',1);
emit __StatementCoverageVolumeRestrictionTMFactory('./contracts/modules/TransferManager/VolumeRestrictionTMFactory.sol',1);
require(_logicContract != address(0), "Invalid address");emit __AssertPostCoverageVolumeRestrictionTMFactory('./contracts/modules/TransferManager/VolumeRestrictionTMFactory.sol',1);

emit __CoverageVolumeRestrictionTMFactory('./contracts/modules/TransferManager/VolumeRestrictionTMFactory.sol',21);
        emit __StatementCoverageVolumeRestrictionTMFactory('./contracts/modules/TransferManager/VolumeRestrictionTMFactory.sol',2);
version = "1.0.0";
emit __CoverageVolumeRestrictionTMFactory('./contracts/modules/TransferManager/VolumeRestrictionTMFactory.sol',22);
        emit __StatementCoverageVolumeRestrictionTMFactory('./contracts/modules/TransferManager/VolumeRestrictionTMFactory.sol',3);
name = "VolumeRestrictionTM";
emit __CoverageVolumeRestrictionTMFactory('./contracts/modules/TransferManager/VolumeRestrictionTMFactory.sol',23);
        emit __StatementCoverageVolumeRestrictionTMFactory('./contracts/modules/TransferManager/VolumeRestrictionTMFactory.sol',4);
title = "Volume Restriction Transfer Manager";
emit __CoverageVolumeRestrictionTMFactory('./contracts/modules/TransferManager/VolumeRestrictionTMFactory.sol',24);
        emit __StatementCoverageVolumeRestrictionTMFactory('./contracts/modules/TransferManager/VolumeRestrictionTMFactory.sol',5);
description = "Manage transfers based on the volume of tokens that needs to be transact";
emit __CoverageVolumeRestrictionTMFactory('./contracts/modules/TransferManager/VolumeRestrictionTMFactory.sol',25);
        emit __StatementCoverageVolumeRestrictionTMFactory('./contracts/modules/TransferManager/VolumeRestrictionTMFactory.sol',6);
compatibleSTVersionRange["lowerBound"] = VersionUtils.pack(uint8(0), uint8(0), uint8(0));
emit __CoverageVolumeRestrictionTMFactory('./contracts/modules/TransferManager/VolumeRestrictionTMFactory.sol',26);
        emit __StatementCoverageVolumeRestrictionTMFactory('./contracts/modules/TransferManager/VolumeRestrictionTMFactory.sol',7);
compatibleSTVersionRange["upperBound"] = VersionUtils.pack(uint8(0), uint8(0), uint8(0));
emit __CoverageVolumeRestrictionTMFactory('./contracts/modules/TransferManager/VolumeRestrictionTMFactory.sol',27);
        emit __StatementCoverageVolumeRestrictionTMFactory('./contracts/modules/TransferManager/VolumeRestrictionTMFactory.sol',8);
logicContract = _logicContract;
    }


     /**
     * @notice Used to launch the Module with the help of factory
     * @return address Contract address of the Module
     */
    function deploy(bytes /* _data */) external returns(address) {emit __FunctionCoverageVolumeRestrictionTMFactory('./contracts/modules/TransferManager/VolumeRestrictionTMFactory.sol',2);

emit __CoverageVolumeRestrictionTMFactory('./contracts/modules/TransferManager/VolumeRestrictionTMFactory.sol',36);
        emit __StatementCoverageVolumeRestrictionTMFactory('./contracts/modules/TransferManager/VolumeRestrictionTMFactory.sol',9);
if (setupCost > 0)
            {emit __AssertPreCoverageVolumeRestrictionTMFactory('./contracts/modules/TransferManager/VolumeRestrictionTMFactory.sol',3);
emit __StatementCoverageVolumeRestrictionTMFactory('./contracts/modules/TransferManager/VolumeRestrictionTMFactory.sol',10);
emit __BranchCoverageVolumeRestrictionTMFactory('./contracts/modules/TransferManager/VolumeRestrictionTMFactory.sol',2,0);emit __CoverageVolumeRestrictionTMFactory('./contracts/modules/TransferManager/VolumeRestrictionTMFactory.sol',37);
require(polyToken.transferFrom(msg.sender, owner, setupCost), "Insufficent Allowance");emit __AssertPostCoverageVolumeRestrictionTMFactory('./contracts/modules/TransferManager/VolumeRestrictionTMFactory.sol',3);
}else { emit __BranchCoverageVolumeRestrictionTMFactory('./contracts/modules/TransferManager/VolumeRestrictionTMFactory.sol',2,1);}

emit __CoverageVolumeRestrictionTMFactory('./contracts/modules/TransferManager/VolumeRestrictionTMFactory.sol',38);
        emit __StatementCoverageVolumeRestrictionTMFactory('./contracts/modules/TransferManager/VolumeRestrictionTMFactory.sol',11);
address volumeRestrictionTransferManager = new VolumeRestrictionTMProxy(msg.sender, address(polyToken), logicContract);
        /*solium-disable-next-line security/no-block-members*/
emit __CoverageVolumeRestrictionTMFactory('./contracts/modules/TransferManager/VolumeRestrictionTMFactory.sol',40);
        emit __StatementCoverageVolumeRestrictionTMFactory('./contracts/modules/TransferManager/VolumeRestrictionTMFactory.sol',12);
emit GenerateModuleFromFactory(volumeRestrictionTransferManager, getName(), address(this), msg.sender, setupCost, now);
emit __CoverageVolumeRestrictionTMFactory('./contracts/modules/TransferManager/VolumeRestrictionTMFactory.sol',41);
        emit __StatementCoverageVolumeRestrictionTMFactory('./contracts/modules/TransferManager/VolumeRestrictionTMFactory.sol',13);
return volumeRestrictionTransferManager;
    }


    /**
     * @notice Type of the Module factory
     */
    function getTypes() external  returns(uint8[]) {emit __FunctionCoverageVolumeRestrictionTMFactory('./contracts/modules/TransferManager/VolumeRestrictionTMFactory.sol',3);

emit __CoverageVolumeRestrictionTMFactory('./contracts/modules/TransferManager/VolumeRestrictionTMFactory.sol',49);
        emit __StatementCoverageVolumeRestrictionTMFactory('./contracts/modules/TransferManager/VolumeRestrictionTMFactory.sol',14);
uint8[] memory res = new uint8[](1);
emit __CoverageVolumeRestrictionTMFactory('./contracts/modules/TransferManager/VolumeRestrictionTMFactory.sol',50);
        emit __StatementCoverageVolumeRestrictionTMFactory('./contracts/modules/TransferManager/VolumeRestrictionTMFactory.sol',15);
res[0] = 2;
emit __CoverageVolumeRestrictionTMFactory('./contracts/modules/TransferManager/VolumeRestrictionTMFactory.sol',51);
        emit __StatementCoverageVolumeRestrictionTMFactory('./contracts/modules/TransferManager/VolumeRestrictionTMFactory.sol',16);
return res;
    }

    /**
     * @notice Returns the instructions associated with the module
     */
    function getInstructions() external  returns(string) {emit __FunctionCoverageVolumeRestrictionTMFactory('./contracts/modules/TransferManager/VolumeRestrictionTMFactory.sol',4);

        /*solium-disable-next-line max-len*/
emit __CoverageVolumeRestrictionTMFactory('./contracts/modules/TransferManager/VolumeRestrictionTMFactory.sol',59);
        emit __StatementCoverageVolumeRestrictionTMFactory('./contracts/modules/TransferManager/VolumeRestrictionTMFactory.sol',17);
return "Module used to restrict the volume of tokens traded by the token holders";
    }

    /**
     * @notice Get the tags related to the module factory
     */
    function getTags() public  returns(bytes32[]) {emit __FunctionCoverageVolumeRestrictionTMFactory('./contracts/modules/TransferManager/VolumeRestrictionTMFactory.sol',5);

emit __CoverageVolumeRestrictionTMFactory('./contracts/modules/TransferManager/VolumeRestrictionTMFactory.sol',66);
        emit __StatementCoverageVolumeRestrictionTMFactory('./contracts/modules/TransferManager/VolumeRestrictionTMFactory.sol',18);
bytes32[] memory availableTags = new bytes32[](5);
emit __CoverageVolumeRestrictionTMFactory('./contracts/modules/TransferManager/VolumeRestrictionTMFactory.sol',67);
        emit __StatementCoverageVolumeRestrictionTMFactory('./contracts/modules/TransferManager/VolumeRestrictionTMFactory.sol',19);
availableTags[0] = "Maximum Volume";
emit __CoverageVolumeRestrictionTMFactory('./contracts/modules/TransferManager/VolumeRestrictionTMFactory.sol',68);
        emit __StatementCoverageVolumeRestrictionTMFactory('./contracts/modules/TransferManager/VolumeRestrictionTMFactory.sol',20);
availableTags[1] = "Transfer Restriction";
emit __CoverageVolumeRestrictionTMFactory('./contracts/modules/TransferManager/VolumeRestrictionTMFactory.sol',69);
        emit __StatementCoverageVolumeRestrictionTMFactory('./contracts/modules/TransferManager/VolumeRestrictionTMFactory.sol',21);
availableTags[2] = "Daily Restriction";
emit __CoverageVolumeRestrictionTMFactory('./contracts/modules/TransferManager/VolumeRestrictionTMFactory.sol',70);
        emit __StatementCoverageVolumeRestrictionTMFactory('./contracts/modules/TransferManager/VolumeRestrictionTMFactory.sol',22);
availableTags[3] = "Individual Restriction";
emit __CoverageVolumeRestrictionTMFactory('./contracts/modules/TransferManager/VolumeRestrictionTMFactory.sol',71);
        emit __StatementCoverageVolumeRestrictionTMFactory('./contracts/modules/TransferManager/VolumeRestrictionTMFactory.sol',23);
availableTags[4] = "Default Restriction";
emit __CoverageVolumeRestrictionTMFactory('./contracts/modules/TransferManager/VolumeRestrictionTMFactory.sol',72);
        emit __StatementCoverageVolumeRestrictionTMFactory('./contracts/modules/TransferManager/VolumeRestrictionTMFactory.sol',24);
return availableTags;
    }

}