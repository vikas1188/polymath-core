pragma solidity ^0.4.24;

import "../../interfaces/IBoot.sol";
import "../../proxy/USDTieredSTOProxy.sol";
import "../ModuleFactory.sol";
import "../../libraries/Util.sol";

/**
 * @title Factory for deploying CappedSTO module
 */
contract USDTieredSTOFactory is ModuleFactory {event __CoverageUSDTieredSTOFactory(string fileName, uint256 lineNumber);
event __FunctionCoverageUSDTieredSTOFactory(string fileName, uint256 fnId);
event __StatementCoverageUSDTieredSTOFactory(string fileName, uint256 statementId);
event __BranchCoverageUSDTieredSTOFactory(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageUSDTieredSTOFactory(string fileName, uint256 branchId);
event __AssertPostCoverageUSDTieredSTOFactory(string fileName, uint256 branchId);


    address public logicContract;

    /**
     * @notice Constructor
     * @param _polyAddress Address of the polytoken
     */
    constructor (address _polyAddress, uint256 _setupCost, uint256 _usageCost, uint256 _subscriptionCost, address _logicContract) public
    ModuleFactory(_polyAddress, _setupCost, _usageCost, _subscriptionCost)
    {emit __FunctionCoverageUSDTieredSTOFactory('./contracts/modules/STO/USDTieredSTOFactory.sol',1);

emit __CoverageUSDTieredSTOFactory('./contracts/modules/STO/USDTieredSTOFactory.sol',22);
        emit __AssertPreCoverageUSDTieredSTOFactory('./contracts/modules/STO/USDTieredSTOFactory.sol',1);
emit __StatementCoverageUSDTieredSTOFactory('./contracts/modules/STO/USDTieredSTOFactory.sol',1);
require(_logicContract != address(0), "0x address is not allowed");emit __AssertPostCoverageUSDTieredSTOFactory('./contracts/modules/STO/USDTieredSTOFactory.sol',1);

emit __CoverageUSDTieredSTOFactory('./contracts/modules/STO/USDTieredSTOFactory.sol',23);
        emit __StatementCoverageUSDTieredSTOFactory('./contracts/modules/STO/USDTieredSTOFactory.sol',2);
logicContract = _logicContract;
emit __CoverageUSDTieredSTOFactory('./contracts/modules/STO/USDTieredSTOFactory.sol',24);
        emit __StatementCoverageUSDTieredSTOFactory('./contracts/modules/STO/USDTieredSTOFactory.sol',3);
version = "2.1.0";
emit __CoverageUSDTieredSTOFactory('./contracts/modules/STO/USDTieredSTOFactory.sol',25);
        emit __StatementCoverageUSDTieredSTOFactory('./contracts/modules/STO/USDTieredSTOFactory.sol',4);
name = "USDTieredSTO";
emit __CoverageUSDTieredSTOFactory('./contracts/modules/STO/USDTieredSTOFactory.sol',26);
        emit __StatementCoverageUSDTieredSTOFactory('./contracts/modules/STO/USDTieredSTOFactory.sol',5);
title = "USD Tiered STO";
        /*solium-disable-next-line max-len*/
emit __CoverageUSDTieredSTOFactory('./contracts/modules/STO/USDTieredSTOFactory.sol',28);
        emit __StatementCoverageUSDTieredSTOFactory('./contracts/modules/STO/USDTieredSTOFactory.sol',6);
description = "It allows both accredited and non-accredited investors to contribute into the STO. Non-accredited investors will be capped at a maximum investment limit (as a default or specific to their jurisdiction). Tokens will be sold according to tiers sequentially & each tier has its own price and volume of tokens to sell. Upon receipt of funds (ETH, POLY or DAI), security tokens will automatically transfer to investor’s wallet address";
emit __CoverageUSDTieredSTOFactory('./contracts/modules/STO/USDTieredSTOFactory.sol',29);
        emit __StatementCoverageUSDTieredSTOFactory('./contracts/modules/STO/USDTieredSTOFactory.sol',7);
compatibleSTVersionRange["lowerBound"] = VersionUtils.pack(uint8(0), uint8(0), uint8(0));
emit __CoverageUSDTieredSTOFactory('./contracts/modules/STO/USDTieredSTOFactory.sol',30);
        emit __StatementCoverageUSDTieredSTOFactory('./contracts/modules/STO/USDTieredSTOFactory.sol',8);
compatibleSTVersionRange["upperBound"] = VersionUtils.pack(uint8(0), uint8(0), uint8(0));
    }

     /**
     * @notice Used to launch the Module with the help of factory
     * @return address Contract address of the Module
     */
    function deploy(bytes _data) external returns(address) {emit __FunctionCoverageUSDTieredSTOFactory('./contracts/modules/STO/USDTieredSTOFactory.sol',2);

emit __CoverageUSDTieredSTOFactory('./contracts/modules/STO/USDTieredSTOFactory.sol',38);
        emit __StatementCoverageUSDTieredSTOFactory('./contracts/modules/STO/USDTieredSTOFactory.sol',9);
if(setupCost > 0)
            {emit __AssertPreCoverageUSDTieredSTOFactory('./contracts/modules/STO/USDTieredSTOFactory.sol',3);
emit __StatementCoverageUSDTieredSTOFactory('./contracts/modules/STO/USDTieredSTOFactory.sol',10);
emit __BranchCoverageUSDTieredSTOFactory('./contracts/modules/STO/USDTieredSTOFactory.sol',2,0);emit __CoverageUSDTieredSTOFactory('./contracts/modules/STO/USDTieredSTOFactory.sol',39);
require(polyToken.transferFrom(msg.sender, owner, setupCost), "Sufficent Allowance is not provided");emit __AssertPostCoverageUSDTieredSTOFactory('./contracts/modules/STO/USDTieredSTOFactory.sol',3);
}else { emit __BranchCoverageUSDTieredSTOFactory('./contracts/modules/STO/USDTieredSTOFactory.sol',2,1);}

        //Check valid bytes - can only call module init function
emit __CoverageUSDTieredSTOFactory('./contracts/modules/STO/USDTieredSTOFactory.sol',41);
        emit __StatementCoverageUSDTieredSTOFactory('./contracts/modules/STO/USDTieredSTOFactory.sol',11);
address usdTieredSTO = new USDTieredSTOProxy(msg.sender, address(polyToken), logicContract);
        //Checks that _data is valid (not calling anything it shouldn't)
emit __CoverageUSDTieredSTOFactory('./contracts/modules/STO/USDTieredSTOFactory.sol',43);
        emit __AssertPreCoverageUSDTieredSTOFactory('./contracts/modules/STO/USDTieredSTOFactory.sol',4);
emit __StatementCoverageUSDTieredSTOFactory('./contracts/modules/STO/USDTieredSTOFactory.sol',12);
require(Util.getSig(_data) == IBoot(usdTieredSTO).getInitFunction(), "Invalid data");emit __AssertPostCoverageUSDTieredSTOFactory('./contracts/modules/STO/USDTieredSTOFactory.sol',4);

        /*solium-disable-next-line security/no-low-level-calls*/
emit __CoverageUSDTieredSTOFactory('./contracts/modules/STO/USDTieredSTOFactory.sol',45);
        emit __AssertPreCoverageUSDTieredSTOFactory('./contracts/modules/STO/USDTieredSTOFactory.sol',5);
emit __StatementCoverageUSDTieredSTOFactory('./contracts/modules/STO/USDTieredSTOFactory.sol',13);
require(address(usdTieredSTO).call(_data), "Unsuccessfull call");emit __AssertPostCoverageUSDTieredSTOFactory('./contracts/modules/STO/USDTieredSTOFactory.sol',5);

        /*solium-disable-next-line security/no-block-members*/
emit __CoverageUSDTieredSTOFactory('./contracts/modules/STO/USDTieredSTOFactory.sol',47);
        emit __StatementCoverageUSDTieredSTOFactory('./contracts/modules/STO/USDTieredSTOFactory.sol',14);
emit GenerateModuleFromFactory(usdTieredSTO, getName(), address(this), msg.sender, setupCost, now);
emit __CoverageUSDTieredSTOFactory('./contracts/modules/STO/USDTieredSTOFactory.sol',48);
        emit __StatementCoverageUSDTieredSTOFactory('./contracts/modules/STO/USDTieredSTOFactory.sol',15);
return address(usdTieredSTO);
    }

    /**
     * @notice Type of the Module factory
     */
    function getTypes() external  returns(uint8[]) {emit __FunctionCoverageUSDTieredSTOFactory('./contracts/modules/STO/USDTieredSTOFactory.sol',3);

emit __CoverageUSDTieredSTOFactory('./contracts/modules/STO/USDTieredSTOFactory.sol',55);
        emit __StatementCoverageUSDTieredSTOFactory('./contracts/modules/STO/USDTieredSTOFactory.sol',16);
uint8[] memory res = new uint8[](1);
emit __CoverageUSDTieredSTOFactory('./contracts/modules/STO/USDTieredSTOFactory.sol',56);
        emit __StatementCoverageUSDTieredSTOFactory('./contracts/modules/STO/USDTieredSTOFactory.sol',17);
res[0] = 3;
emit __CoverageUSDTieredSTOFactory('./contracts/modules/STO/USDTieredSTOFactory.sol',57);
        emit __StatementCoverageUSDTieredSTOFactory('./contracts/modules/STO/USDTieredSTOFactory.sol',18);
return res;
    }

    /**
     * @notice Returns the instructions associated with the module
     */
    function getInstructions() external  returns(string) {emit __FunctionCoverageUSDTieredSTOFactory('./contracts/modules/STO/USDTieredSTOFactory.sol',4);

emit __CoverageUSDTieredSTOFactory('./contracts/modules/STO/USDTieredSTOFactory.sol',64);
        emit __StatementCoverageUSDTieredSTOFactory('./contracts/modules/STO/USDTieredSTOFactory.sol',19);
return "Initialises a USD tiered STO.";
    }

    /**
     * @notice Get the tags related to the module factory
     */
    function getTags() external  returns(bytes32[]) {emit __FunctionCoverageUSDTieredSTOFactory('./contracts/modules/STO/USDTieredSTOFactory.sol',5);

emit __CoverageUSDTieredSTOFactory('./contracts/modules/STO/USDTieredSTOFactory.sol',71);
        emit __StatementCoverageUSDTieredSTOFactory('./contracts/modules/STO/USDTieredSTOFactory.sol',20);
bytes32[] memory availableTags = new bytes32[](4);
emit __CoverageUSDTieredSTOFactory('./contracts/modules/STO/USDTieredSTOFactory.sol',72);
        emit __StatementCoverageUSDTieredSTOFactory('./contracts/modules/STO/USDTieredSTOFactory.sol',21);
availableTags[0] = "USD";
emit __CoverageUSDTieredSTOFactory('./contracts/modules/STO/USDTieredSTOFactory.sol',73);
        emit __StatementCoverageUSDTieredSTOFactory('./contracts/modules/STO/USDTieredSTOFactory.sol',22);
availableTags[1] = "Tiered";
emit __CoverageUSDTieredSTOFactory('./contracts/modules/STO/USDTieredSTOFactory.sol',74);
        emit __StatementCoverageUSDTieredSTOFactory('./contracts/modules/STO/USDTieredSTOFactory.sol',23);
availableTags[2] = "POLY";
emit __CoverageUSDTieredSTOFactory('./contracts/modules/STO/USDTieredSTOFactory.sol',75);
        emit __StatementCoverageUSDTieredSTOFactory('./contracts/modules/STO/USDTieredSTOFactory.sol',24);
availableTags[3] = "ETH";
emit __CoverageUSDTieredSTOFactory('./contracts/modules/STO/USDTieredSTOFactory.sol',76);
        emit __StatementCoverageUSDTieredSTOFactory('./contracts/modules/STO/USDTieredSTOFactory.sol',25);
return availableTags;
    }

}
