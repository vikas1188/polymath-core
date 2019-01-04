pragma solidity ^0.4.24;

import "./PreSaleSTO.sol";
import "../ModuleFactory.sol";
import "../../libraries/Util.sol";

/**
 * @title Factory for deploying PreSaleSTO module
 */
contract PreSaleSTOFactory is ModuleFactory {event __CoveragePreSaleSTOFactory(string fileName, uint256 lineNumber);
event __FunctionCoveragePreSaleSTOFactory(string fileName, uint256 fnId);
event __StatementCoveragePreSaleSTOFactory(string fileName, uint256 statementId);
event __BranchCoveragePreSaleSTOFactory(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoveragePreSaleSTOFactory(string fileName, uint256 branchId);
event __AssertPostCoveragePreSaleSTOFactory(string fileName, uint256 branchId);


    /**
     * @notice Constructor
     * @param _polyAddress Address of the polytoken
     */
    constructor (address _polyAddress, uint256 _setupCost, uint256 _usageCost, uint256 _subscriptionCost) public
    ModuleFactory(_polyAddress, _setupCost, _usageCost, _subscriptionCost)
    {emit __FunctionCoveragePreSaleSTOFactory('./contracts/modules/STO/PreSaleSTOFactory.sol',1);

emit __CoveragePreSaleSTOFactory('./contracts/modules/STO/PreSaleSTOFactory.sol',19);
        emit __StatementCoveragePreSaleSTOFactory('./contracts/modules/STO/PreSaleSTOFactory.sol',1);
version = "1.0.0";
emit __CoveragePreSaleSTOFactory('./contracts/modules/STO/PreSaleSTOFactory.sol',20);
        emit __StatementCoveragePreSaleSTOFactory('./contracts/modules/STO/PreSaleSTOFactory.sol',2);
name = "PreSaleSTO";
emit __CoveragePreSaleSTOFactory('./contracts/modules/STO/PreSaleSTOFactory.sol',21);
        emit __StatementCoveragePreSaleSTOFactory('./contracts/modules/STO/PreSaleSTOFactory.sol',3);
title = "PreSale STO";
emit __CoveragePreSaleSTOFactory('./contracts/modules/STO/PreSaleSTOFactory.sol',22);
        emit __StatementCoveragePreSaleSTOFactory('./contracts/modules/STO/PreSaleSTOFactory.sol',4);
description = "Allows Issuer to configure pre-sale token allocations";
emit __CoveragePreSaleSTOFactory('./contracts/modules/STO/PreSaleSTOFactory.sol',23);
        emit __StatementCoveragePreSaleSTOFactory('./contracts/modules/STO/PreSaleSTOFactory.sol',5);
compatibleSTVersionRange["lowerBound"] = VersionUtils.pack(uint8(0), uint8(0), uint8(0));
emit __CoveragePreSaleSTOFactory('./contracts/modules/STO/PreSaleSTOFactory.sol',24);
        emit __StatementCoveragePreSaleSTOFactory('./contracts/modules/STO/PreSaleSTOFactory.sol',6);
compatibleSTVersionRange["upperBound"] = VersionUtils.pack(uint8(0), uint8(0), uint8(0));
    }

    /**
     * @notice Used to launch the Module with the help of factory
     * @param _data Data used for the intialization of the module factory variables
     * @return address Contract address of the Module
     */
    function deploy(bytes _data) external returns(address) {emit __FunctionCoveragePreSaleSTOFactory('./contracts/modules/STO/PreSaleSTOFactory.sol',2);

emit __CoveragePreSaleSTOFactory('./contracts/modules/STO/PreSaleSTOFactory.sol',33);
        emit __StatementCoveragePreSaleSTOFactory('./contracts/modules/STO/PreSaleSTOFactory.sol',7);
if (setupCost > 0) {emit __BranchCoveragePreSaleSTOFactory('./contracts/modules/STO/PreSaleSTOFactory.sol',1,0);
emit __CoveragePreSaleSTOFactory('./contracts/modules/STO/PreSaleSTOFactory.sol',34);
            emit __AssertPreCoveragePreSaleSTOFactory('./contracts/modules/STO/PreSaleSTOFactory.sol',2);
emit __StatementCoveragePreSaleSTOFactory('./contracts/modules/STO/PreSaleSTOFactory.sol',8);
require(polyToken.transferFrom(msg.sender, owner, setupCost), "Sufficent Allowance is not provided");emit __AssertPostCoveragePreSaleSTOFactory('./contracts/modules/STO/PreSaleSTOFactory.sol',2);

        }else { emit __BranchCoveragePreSaleSTOFactory('./contracts/modules/STO/PreSaleSTOFactory.sol',1,1);}

        //Check valid bytes - can only call module init function
emit __CoveragePreSaleSTOFactory('./contracts/modules/STO/PreSaleSTOFactory.sol',37);
        emit __StatementCoveragePreSaleSTOFactory('./contracts/modules/STO/PreSaleSTOFactory.sol',9);
PreSaleSTO preSaleSTO = new PreSaleSTO(msg.sender, address(polyToken));
        //Checks that _data is valid (not calling anything it shouldn't)
emit __CoveragePreSaleSTOFactory('./contracts/modules/STO/PreSaleSTOFactory.sol',39);
        emit __AssertPreCoveragePreSaleSTOFactory('./contracts/modules/STO/PreSaleSTOFactory.sol',3);
emit __StatementCoveragePreSaleSTOFactory('./contracts/modules/STO/PreSaleSTOFactory.sol',10);
require(Util.getSig(_data) == preSaleSTO.getInitFunction(), "Invalid data");emit __AssertPostCoveragePreSaleSTOFactory('./contracts/modules/STO/PreSaleSTOFactory.sol',3);

        /*solium-disable-next-line security/no-low-level-calls*/
emit __CoveragePreSaleSTOFactory('./contracts/modules/STO/PreSaleSTOFactory.sol',41);
        emit __AssertPreCoveragePreSaleSTOFactory('./contracts/modules/STO/PreSaleSTOFactory.sol',4);
emit __StatementCoveragePreSaleSTOFactory('./contracts/modules/STO/PreSaleSTOFactory.sol',11);
require(address(preSaleSTO).call(_data), "Unsuccessfull call");emit __AssertPostCoveragePreSaleSTOFactory('./contracts/modules/STO/PreSaleSTOFactory.sol',4);

        /*solium-disable-next-line security/no-block-members*/
emit __CoveragePreSaleSTOFactory('./contracts/modules/STO/PreSaleSTOFactory.sol',43);
        emit __StatementCoveragePreSaleSTOFactory('./contracts/modules/STO/PreSaleSTOFactory.sol',12);
emit GenerateModuleFromFactory(address(preSaleSTO), getName(), address(this), msg.sender, setupCost, now);
emit __CoveragePreSaleSTOFactory('./contracts/modules/STO/PreSaleSTOFactory.sol',44);
        emit __StatementCoveragePreSaleSTOFactory('./contracts/modules/STO/PreSaleSTOFactory.sol',13);
return address(preSaleSTO);
    }

    /**
     * @notice Type of the Module factory
     */
    function getTypes() external  returns(uint8[]) {emit __FunctionCoveragePreSaleSTOFactory('./contracts/modules/STO/PreSaleSTOFactory.sol',3);

emit __CoveragePreSaleSTOFactory('./contracts/modules/STO/PreSaleSTOFactory.sol',51);
        emit __StatementCoveragePreSaleSTOFactory('./contracts/modules/STO/PreSaleSTOFactory.sol',14);
uint8[] memory res = new uint8[](1);
emit __CoveragePreSaleSTOFactory('./contracts/modules/STO/PreSaleSTOFactory.sol',52);
        emit __StatementCoveragePreSaleSTOFactory('./contracts/modules/STO/PreSaleSTOFactory.sol',15);
res[0] = 3;
emit __CoveragePreSaleSTOFactory('./contracts/modules/STO/PreSaleSTOFactory.sol',53);
        emit __StatementCoveragePreSaleSTOFactory('./contracts/modules/STO/PreSaleSTOFactory.sol',16);
return res;
    }
    
    /**
     * @notice Returns the instructions associated with the module
     */
    function getInstructions() external  returns(string) {emit __FunctionCoveragePreSaleSTOFactory('./contracts/modules/STO/PreSaleSTOFactory.sol',4);

emit __CoveragePreSaleSTOFactory('./contracts/modules/STO/PreSaleSTOFactory.sol',60);
        emit __StatementCoveragePreSaleSTOFactory('./contracts/modules/STO/PreSaleSTOFactory.sol',17);
return "Configure and track pre-sale token allocations";
    }

    /**
     * @notice Get the tags related to the module factory
     */
    function getTags() external  returns(bytes32[]) {emit __FunctionCoveragePreSaleSTOFactory('./contracts/modules/STO/PreSaleSTOFactory.sol',5);

emit __CoveragePreSaleSTOFactory('./contracts/modules/STO/PreSaleSTOFactory.sol',67);
        emit __StatementCoveragePreSaleSTOFactory('./contracts/modules/STO/PreSaleSTOFactory.sol',18);
bytes32[] memory availableTags = new bytes32[](1);
emit __CoveragePreSaleSTOFactory('./contracts/modules/STO/PreSaleSTOFactory.sol',68);
        emit __StatementCoveragePreSaleSTOFactory('./contracts/modules/STO/PreSaleSTOFactory.sol',19);
availableTags[0] = "Presale";
emit __CoveragePreSaleSTOFactory('./contracts/modules/STO/PreSaleSTOFactory.sol',69);
        emit __StatementCoveragePreSaleSTOFactory('./contracts/modules/STO/PreSaleSTOFactory.sol',20);
return availableTags;
    }

}
