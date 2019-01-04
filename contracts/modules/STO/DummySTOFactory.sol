pragma solidity ^0.4.24;

import "./DummySTO.sol";
import "../ModuleFactory.sol";
import "../../libraries/Util.sol";

/**
 * @title Factory for deploying DummySTO module
 */
contract DummySTOFactory is ModuleFactory {event __CoverageDummySTOFactory(string fileName, uint256 lineNumber);
event __FunctionCoverageDummySTOFactory(string fileName, uint256 fnId);
event __StatementCoverageDummySTOFactory(string fileName, uint256 statementId);
event __BranchCoverageDummySTOFactory(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageDummySTOFactory(string fileName, uint256 branchId);
event __AssertPostCoverageDummySTOFactory(string fileName, uint256 branchId);


    /**
     * @notice Constructor
     * @param _polyAddress Address of the polytoken
     */
    constructor (address _polyAddress, uint256 _setupCost, uint256 _usageCost, uint256 _subscriptionCost) public
    ModuleFactory(_polyAddress, _setupCost, _usageCost, _subscriptionCost)
    {emit __FunctionCoverageDummySTOFactory('./contracts/modules/STO/DummySTOFactory.sol',1);

emit __CoverageDummySTOFactory('./contracts/modules/STO/DummySTOFactory.sol',19);
        emit __StatementCoverageDummySTOFactory('./contracts/modules/STO/DummySTOFactory.sol',1);
version = "1.0.0";
emit __CoverageDummySTOFactory('./contracts/modules/STO/DummySTOFactory.sol',20);
        emit __StatementCoverageDummySTOFactory('./contracts/modules/STO/DummySTOFactory.sol',2);
name = "DummySTO";
emit __CoverageDummySTOFactory('./contracts/modules/STO/DummySTOFactory.sol',21);
        emit __StatementCoverageDummySTOFactory('./contracts/modules/STO/DummySTOFactory.sol',3);
title = "Dummy STO";
emit __CoverageDummySTOFactory('./contracts/modules/STO/DummySTOFactory.sol',22);
        emit __StatementCoverageDummySTOFactory('./contracts/modules/STO/DummySTOFactory.sol',4);
description = "Dummy STO";
emit __CoverageDummySTOFactory('./contracts/modules/STO/DummySTOFactory.sol',23);
        emit __StatementCoverageDummySTOFactory('./contracts/modules/STO/DummySTOFactory.sol',5);
compatibleSTVersionRange["lowerBound"] = VersionUtils.pack(uint8(0), uint8(0), uint8(0));
emit __CoverageDummySTOFactory('./contracts/modules/STO/DummySTOFactory.sol',24);
        emit __StatementCoverageDummySTOFactory('./contracts/modules/STO/DummySTOFactory.sol',6);
compatibleSTVersionRange["upperBound"] = VersionUtils.pack(uint8(0), uint8(0), uint8(0));
    }
    /**
     * @notice Used to launch the Module with the help of factory
     * @return address Contract address of the Module
     */
    function deploy(bytes _data) external returns(address) {emit __FunctionCoverageDummySTOFactory('./contracts/modules/STO/DummySTOFactory.sol',2);

emit __CoverageDummySTOFactory('./contracts/modules/STO/DummySTOFactory.sol',31);
        emit __StatementCoverageDummySTOFactory('./contracts/modules/STO/DummySTOFactory.sol',7);
if (setupCost > 0)
            {emit __AssertPreCoverageDummySTOFactory('./contracts/modules/STO/DummySTOFactory.sol',2);
emit __StatementCoverageDummySTOFactory('./contracts/modules/STO/DummySTOFactory.sol',8);
emit __BranchCoverageDummySTOFactory('./contracts/modules/STO/DummySTOFactory.sol',1,0);emit __CoverageDummySTOFactory('./contracts/modules/STO/DummySTOFactory.sol',32);
require(polyToken.transferFrom(msg.sender, owner, setupCost), "Sufficent Allowance is not provided");emit __AssertPostCoverageDummySTOFactory('./contracts/modules/STO/DummySTOFactory.sol',2);
}else { emit __BranchCoverageDummySTOFactory('./contracts/modules/STO/DummySTOFactory.sol',1,1);}

        //Check valid bytes - can only call module init function
emit __CoverageDummySTOFactory('./contracts/modules/STO/DummySTOFactory.sol',34);
        emit __StatementCoverageDummySTOFactory('./contracts/modules/STO/DummySTOFactory.sol',9);
DummySTO dummySTO = new DummySTO(msg.sender, address(polyToken));
        //Checks that _data is valid (not calling anything it shouldn't)
emit __CoverageDummySTOFactory('./contracts/modules/STO/DummySTOFactory.sol',36);
        emit __AssertPreCoverageDummySTOFactory('./contracts/modules/STO/DummySTOFactory.sol',3);
emit __StatementCoverageDummySTOFactory('./contracts/modules/STO/DummySTOFactory.sol',10);
require(Util.getSig(_data) == dummySTO.getInitFunction(), "Invalid data");emit __AssertPostCoverageDummySTOFactory('./contracts/modules/STO/DummySTOFactory.sol',3);

        /*solium-disable-next-line security/no-low-level-calls*/
emit __CoverageDummySTOFactory('./contracts/modules/STO/DummySTOFactory.sol',38);
        emit __AssertPreCoverageDummySTOFactory('./contracts/modules/STO/DummySTOFactory.sol',4);
emit __StatementCoverageDummySTOFactory('./contracts/modules/STO/DummySTOFactory.sol',11);
require(address(dummySTO).call(_data), "Unsuccessfull call");emit __AssertPostCoverageDummySTOFactory('./contracts/modules/STO/DummySTOFactory.sol',4);

        /*solium-disable-next-line security/no-block-members*/
emit __CoverageDummySTOFactory('./contracts/modules/STO/DummySTOFactory.sol',40);
        emit __StatementCoverageDummySTOFactory('./contracts/modules/STO/DummySTOFactory.sol',12);
emit GenerateModuleFromFactory(address(dummySTO), getName(), address(this), msg.sender, setupCost, now);
emit __CoverageDummySTOFactory('./contracts/modules/STO/DummySTOFactory.sol',41);
        emit __StatementCoverageDummySTOFactory('./contracts/modules/STO/DummySTOFactory.sol',13);
return address(dummySTO);
    }

    /**
     * @notice Type of the Module factory
     */
    function getTypes() external  returns(uint8[]) {emit __FunctionCoverageDummySTOFactory('./contracts/modules/STO/DummySTOFactory.sol',3);

emit __CoverageDummySTOFactory('./contracts/modules/STO/DummySTOFactory.sol',48);
        emit __StatementCoverageDummySTOFactory('./contracts/modules/STO/DummySTOFactory.sol',14);
uint8[] memory res = new uint8[](1);
emit __CoverageDummySTOFactory('./contracts/modules/STO/DummySTOFactory.sol',49);
        emit __StatementCoverageDummySTOFactory('./contracts/modules/STO/DummySTOFactory.sol',15);
res[0] = 3;
emit __CoverageDummySTOFactory('./contracts/modules/STO/DummySTOFactory.sol',50);
        emit __StatementCoverageDummySTOFactory('./contracts/modules/STO/DummySTOFactory.sol',16);
return res;
    }

    /**
     * @notice Returns the instructions associated with the module
     */
    function getInstructions() external  returns(string) {emit __FunctionCoverageDummySTOFactory('./contracts/modules/STO/DummySTOFactory.sol',4);

emit __CoverageDummySTOFactory('./contracts/modules/STO/DummySTOFactory.sol',57);
        emit __StatementCoverageDummySTOFactory('./contracts/modules/STO/DummySTOFactory.sol',17);
return "Dummy STO - you can mint tokens at will";
    }

    /**
     * @notice Get the tags related to the module factory
     */
    function getTags() external  returns(bytes32[]) {emit __FunctionCoverageDummySTOFactory('./contracts/modules/STO/DummySTOFactory.sol',5);

emit __CoverageDummySTOFactory('./contracts/modules/STO/DummySTOFactory.sol',64);
        emit __StatementCoverageDummySTOFactory('./contracts/modules/STO/DummySTOFactory.sol',18);
bytes32[] memory availableTags = new bytes32[](4);
emit __CoverageDummySTOFactory('./contracts/modules/STO/DummySTOFactory.sol',65);
        emit __StatementCoverageDummySTOFactory('./contracts/modules/STO/DummySTOFactory.sol',19);
availableTags[0] = "Dummy";
emit __CoverageDummySTOFactory('./contracts/modules/STO/DummySTOFactory.sol',66);
        emit __StatementCoverageDummySTOFactory('./contracts/modules/STO/DummySTOFactory.sol',20);
availableTags[1] = "Non-refundable";
emit __CoverageDummySTOFactory('./contracts/modules/STO/DummySTOFactory.sol',67);
        emit __StatementCoverageDummySTOFactory('./contracts/modules/STO/DummySTOFactory.sol',21);
availableTags[2] = "ETH";
emit __CoverageDummySTOFactory('./contracts/modules/STO/DummySTOFactory.sol',68);
        emit __StatementCoverageDummySTOFactory('./contracts/modules/STO/DummySTOFactory.sol',22);
return availableTags;
    }
}
