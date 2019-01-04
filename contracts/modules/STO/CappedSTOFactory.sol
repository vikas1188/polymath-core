pragma solidity ^0.4.24;

import "./CappedSTO.sol";
import "../ModuleFactory.sol";
import "../../libraries/Util.sol";

/**
 * @title Factory for deploying CappedSTO module
 */
contract CappedSTOFactory is ModuleFactory {event __CoverageCappedSTOFactory(string fileName, uint256 lineNumber);
event __FunctionCoverageCappedSTOFactory(string fileName, uint256 fnId);
event __StatementCoverageCappedSTOFactory(string fileName, uint256 statementId);
event __BranchCoverageCappedSTOFactory(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageCappedSTOFactory(string fileName, uint256 branchId);
event __AssertPostCoverageCappedSTOFactory(string fileName, uint256 branchId);


    /**
     * @notice Constructor
     * @param _polyAddress Address of the polytoken
     */
    constructor (address _polyAddress, uint256 _setupCost, uint256 _usageCost, uint256 _subscriptionCost) public
    ModuleFactory(_polyAddress, _setupCost, _usageCost, _subscriptionCost)
    {emit __FunctionCoverageCappedSTOFactory('./contracts/modules/STO/CappedSTOFactory.sol',1);

emit __CoverageCappedSTOFactory('./contracts/modules/STO/CappedSTOFactory.sol',19);
        emit __StatementCoverageCappedSTOFactory('./contracts/modules/STO/CappedSTOFactory.sol',1);
version = "2.1.0";
emit __CoverageCappedSTOFactory('./contracts/modules/STO/CappedSTOFactory.sol',20);
        emit __StatementCoverageCappedSTOFactory('./contracts/modules/STO/CappedSTOFactory.sol',2);
name = "CappedSTO";
emit __CoverageCappedSTOFactory('./contracts/modules/STO/CappedSTOFactory.sol',21);
        emit __StatementCoverageCappedSTOFactory('./contracts/modules/STO/CappedSTOFactory.sol',3);
title = "Capped STO";
emit __CoverageCappedSTOFactory('./contracts/modules/STO/CappedSTOFactory.sol',22);
        emit __StatementCoverageCappedSTOFactory('./contracts/modules/STO/CappedSTOFactory.sol',4);
description = "This smart contract creates a maximum number of tokens (i.e. hard cap) which the total aggregate of tokens acquired by all investors cannot exceed. Security tokens are sent to the investor upon reception of the funds (ETH or POLY), and any security tokens left upon termination of the offering will not be minted.";
emit __CoverageCappedSTOFactory('./contracts/modules/STO/CappedSTOFactory.sol',23);
        emit __StatementCoverageCappedSTOFactory('./contracts/modules/STO/CappedSTOFactory.sol',5);
compatibleSTVersionRange["lowerBound"] = VersionUtils.pack(uint8(0), uint8(0), uint8(0));
emit __CoverageCappedSTOFactory('./contracts/modules/STO/CappedSTOFactory.sol',24);
        emit __StatementCoverageCappedSTOFactory('./contracts/modules/STO/CappedSTOFactory.sol',6);
compatibleSTVersionRange["upperBound"] = VersionUtils.pack(uint8(0), uint8(0), uint8(0));
    }

     /**
     * @notice Used to launch the Module with the help of factory
     * @return address Contract address of the Module
     */
    function deploy(bytes _data) external returns(address) {emit __FunctionCoverageCappedSTOFactory('./contracts/modules/STO/CappedSTOFactory.sol',2);

emit __CoverageCappedSTOFactory('./contracts/modules/STO/CappedSTOFactory.sol',32);
        emit __StatementCoverageCappedSTOFactory('./contracts/modules/STO/CappedSTOFactory.sol',7);
if(setupCost > 0)
            {emit __AssertPreCoverageCappedSTOFactory('./contracts/modules/STO/CappedSTOFactory.sol',2);
emit __StatementCoverageCappedSTOFactory('./contracts/modules/STO/CappedSTOFactory.sol',8);
emit __BranchCoverageCappedSTOFactory('./contracts/modules/STO/CappedSTOFactory.sol',1,0);emit __CoverageCappedSTOFactory('./contracts/modules/STO/CappedSTOFactory.sol',33);
require(polyToken.transferFrom(msg.sender, owner, setupCost), "Sufficent Allowance is not provided");emit __AssertPostCoverageCappedSTOFactory('./contracts/modules/STO/CappedSTOFactory.sol',2);
}else { emit __BranchCoverageCappedSTOFactory('./contracts/modules/STO/CappedSTOFactory.sol',1,1);}

        //Check valid bytes - can only call module init function
emit __CoverageCappedSTOFactory('./contracts/modules/STO/CappedSTOFactory.sol',35);
        emit __StatementCoverageCappedSTOFactory('./contracts/modules/STO/CappedSTOFactory.sol',9);
CappedSTO cappedSTO = new CappedSTO(msg.sender, address(polyToken));
        //Checks that _data is valid (not calling anything it shouldn't)
emit __CoverageCappedSTOFactory('./contracts/modules/STO/CappedSTOFactory.sol',37);
        emit __AssertPreCoverageCappedSTOFactory('./contracts/modules/STO/CappedSTOFactory.sol',3);
emit __StatementCoverageCappedSTOFactory('./contracts/modules/STO/CappedSTOFactory.sol',10);
require(Util.getSig(_data) == cappedSTO.getInitFunction(), "Invalid data");emit __AssertPostCoverageCappedSTOFactory('./contracts/modules/STO/CappedSTOFactory.sol',3);

        /*solium-disable-next-line security/no-low-level-calls*/
emit __CoverageCappedSTOFactory('./contracts/modules/STO/CappedSTOFactory.sol',39);
        emit __AssertPreCoverageCappedSTOFactory('./contracts/modules/STO/CappedSTOFactory.sol',4);
emit __StatementCoverageCappedSTOFactory('./contracts/modules/STO/CappedSTOFactory.sol',11);
require(address(cappedSTO).call(_data), "Unsuccessfull call");emit __AssertPostCoverageCappedSTOFactory('./contracts/modules/STO/CappedSTOFactory.sol',4);

        /*solium-disable-next-line security/no-block-members*/
emit __CoverageCappedSTOFactory('./contracts/modules/STO/CappedSTOFactory.sol',41);
        emit __StatementCoverageCappedSTOFactory('./contracts/modules/STO/CappedSTOFactory.sol',12);
emit GenerateModuleFromFactory(address(cappedSTO), getName(), address(this), msg.sender, setupCost, now);
emit __CoverageCappedSTOFactory('./contracts/modules/STO/CappedSTOFactory.sol',42);
        emit __StatementCoverageCappedSTOFactory('./contracts/modules/STO/CappedSTOFactory.sol',13);
return address(cappedSTO);
    }

    /**
     * @notice Type of the Module factory
     */
    function getTypes() external  returns(uint8[]) {emit __FunctionCoverageCappedSTOFactory('./contracts/modules/STO/CappedSTOFactory.sol',3);

emit __CoverageCappedSTOFactory('./contracts/modules/STO/CappedSTOFactory.sol',49);
        emit __StatementCoverageCappedSTOFactory('./contracts/modules/STO/CappedSTOFactory.sol',14);
uint8[] memory res = new uint8[](1);
emit __CoverageCappedSTOFactory('./contracts/modules/STO/CappedSTOFactory.sol',50);
        emit __StatementCoverageCappedSTOFactory('./contracts/modules/STO/CappedSTOFactory.sol',15);
res[0] = 3;
emit __CoverageCappedSTOFactory('./contracts/modules/STO/CappedSTOFactory.sol',51);
        emit __StatementCoverageCappedSTOFactory('./contracts/modules/STO/CappedSTOFactory.sol',16);
return res;
    }

    /**
     * @notice Returns the instructions associated with the module
     */
    function getInstructions() external  returns(string) {emit __FunctionCoverageCappedSTOFactory('./contracts/modules/STO/CappedSTOFactory.sol',4);

        /*solium-disable-next-line max-len*/
emit __CoverageCappedSTOFactory('./contracts/modules/STO/CappedSTOFactory.sol',59);
        emit __StatementCoverageCappedSTOFactory('./contracts/modules/STO/CappedSTOFactory.sol',17);
return "Initialises a capped STO. Init parameters are _startTime (time STO starts), _endTime (time STO ends), _cap (cap in tokens for STO), _rate (POLY/ETH to token rate), _fundRaiseType (whether you are raising in POLY or ETH), _polyToken (address of POLY token), _fundsReceiver (address which will receive funds)";
    }

    /**
     * @notice Get the tags related to the module factory
     */
    function getTags() external  returns(bytes32[]) {emit __FunctionCoverageCappedSTOFactory('./contracts/modules/STO/CappedSTOFactory.sol',5);

emit __CoverageCappedSTOFactory('./contracts/modules/STO/CappedSTOFactory.sol',66);
        emit __StatementCoverageCappedSTOFactory('./contracts/modules/STO/CappedSTOFactory.sol',18);
bytes32[] memory availableTags = new bytes32[](4);
emit __CoverageCappedSTOFactory('./contracts/modules/STO/CappedSTOFactory.sol',67);
        emit __StatementCoverageCappedSTOFactory('./contracts/modules/STO/CappedSTOFactory.sol',19);
availableTags[0] = "Capped";
emit __CoverageCappedSTOFactory('./contracts/modules/STO/CappedSTOFactory.sol',68);
        emit __StatementCoverageCappedSTOFactory('./contracts/modules/STO/CappedSTOFactory.sol',20);
availableTags[1] = "Non-refundable";
emit __CoverageCappedSTOFactory('./contracts/modules/STO/CappedSTOFactory.sol',69);
        emit __StatementCoverageCappedSTOFactory('./contracts/modules/STO/CappedSTOFactory.sol',21);
availableTags[2] = "POLY";
emit __CoverageCappedSTOFactory('./contracts/modules/STO/CappedSTOFactory.sol',70);
        emit __StatementCoverageCappedSTOFactory('./contracts/modules/STO/CappedSTOFactory.sol',22);
availableTags[3] = "ETH";
emit __CoverageCappedSTOFactory('./contracts/modules/STO/CappedSTOFactory.sol',71);
        emit __StatementCoverageCappedSTOFactory('./contracts/modules/STO/CappedSTOFactory.sol',23);
return availableTags;
    }

}
