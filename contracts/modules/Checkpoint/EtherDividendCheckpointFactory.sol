pragma solidity ^0.4.24;

import "../../proxy/EtherDividendCheckpointProxy.sol";
import "../ModuleFactory.sol";

/**
 * @title Factory for deploying EtherDividendCheckpoint module
 */
contract EtherDividendCheckpointFactory is ModuleFactory {event __CoverageEtherDividendCheckpointFactory(string fileName, uint256 lineNumber);
event __FunctionCoverageEtherDividendCheckpointFactory(string fileName, uint256 fnId);
event __StatementCoverageEtherDividendCheckpointFactory(string fileName, uint256 statementId);
event __BranchCoverageEtherDividendCheckpointFactory(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageEtherDividendCheckpointFactory(string fileName, uint256 branchId);
event __AssertPostCoverageEtherDividendCheckpointFactory(string fileName, uint256 branchId);


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
    {emit __FunctionCoverageEtherDividendCheckpointFactory('./contracts/modules/Checkpoint/EtherDividendCheckpointFactory.sol',1);

emit __CoverageEtherDividendCheckpointFactory('./contracts/modules/Checkpoint/EtherDividendCheckpointFactory.sol',24);
        emit __AssertPreCoverageEtherDividendCheckpointFactory('./contracts/modules/Checkpoint/EtherDividendCheckpointFactory.sol',1);
emit __StatementCoverageEtherDividendCheckpointFactory('./contracts/modules/Checkpoint/EtherDividendCheckpointFactory.sol',1);
require(_logicContract != address(0), "Invalid logic contract");emit __AssertPostCoverageEtherDividendCheckpointFactory('./contracts/modules/Checkpoint/EtherDividendCheckpointFactory.sol',1);

emit __CoverageEtherDividendCheckpointFactory('./contracts/modules/Checkpoint/EtherDividendCheckpointFactory.sol',25);
        emit __StatementCoverageEtherDividendCheckpointFactory('./contracts/modules/Checkpoint/EtherDividendCheckpointFactory.sol',2);
version = "2.1.0";
emit __CoverageEtherDividendCheckpointFactory('./contracts/modules/Checkpoint/EtherDividendCheckpointFactory.sol',26);
        emit __StatementCoverageEtherDividendCheckpointFactory('./contracts/modules/Checkpoint/EtherDividendCheckpointFactory.sol',3);
name = "EtherDividendCheckpoint";
emit __CoverageEtherDividendCheckpointFactory('./contracts/modules/Checkpoint/EtherDividendCheckpointFactory.sol',27);
        emit __StatementCoverageEtherDividendCheckpointFactory('./contracts/modules/Checkpoint/EtherDividendCheckpointFactory.sol',4);
title = "Ether Dividend Checkpoint";
emit __CoverageEtherDividendCheckpointFactory('./contracts/modules/Checkpoint/EtherDividendCheckpointFactory.sol',28);
        emit __StatementCoverageEtherDividendCheckpointFactory('./contracts/modules/Checkpoint/EtherDividendCheckpointFactory.sol',5);
description = "Create ETH dividends for token holders at a specific checkpoint";
emit __CoverageEtherDividendCheckpointFactory('./contracts/modules/Checkpoint/EtherDividendCheckpointFactory.sol',29);
        emit __StatementCoverageEtherDividendCheckpointFactory('./contracts/modules/Checkpoint/EtherDividendCheckpointFactory.sol',6);
compatibleSTVersionRange["lowerBound"] = VersionUtils.pack(uint8(0), uint8(0), uint8(0));
emit __CoverageEtherDividendCheckpointFactory('./contracts/modules/Checkpoint/EtherDividendCheckpointFactory.sol',30);
        emit __StatementCoverageEtherDividendCheckpointFactory('./contracts/modules/Checkpoint/EtherDividendCheckpointFactory.sol',7);
compatibleSTVersionRange["upperBound"] = VersionUtils.pack(uint8(0), uint8(0), uint8(0));
emit __CoverageEtherDividendCheckpointFactory('./contracts/modules/Checkpoint/EtherDividendCheckpointFactory.sol',31);
        emit __StatementCoverageEtherDividendCheckpointFactory('./contracts/modules/Checkpoint/EtherDividendCheckpointFactory.sol',8);
logicContract = _logicContract;
    }

    /**
     * @notice Used to launch the Module with the help of factory
     * @return address Contract address of the Module
     */
    function deploy(bytes /* _data */) external returns(address) {emit __FunctionCoverageEtherDividendCheckpointFactory('./contracts/modules/Checkpoint/EtherDividendCheckpointFactory.sol',2);

emit __CoverageEtherDividendCheckpointFactory('./contracts/modules/Checkpoint/EtherDividendCheckpointFactory.sol',39);
        emit __StatementCoverageEtherDividendCheckpointFactory('./contracts/modules/Checkpoint/EtherDividendCheckpointFactory.sol',9);
if(setupCost > 0)
            {emit __AssertPreCoverageEtherDividendCheckpointFactory('./contracts/modules/Checkpoint/EtherDividendCheckpointFactory.sol',3);
emit __StatementCoverageEtherDividendCheckpointFactory('./contracts/modules/Checkpoint/EtherDividendCheckpointFactory.sol',10);
emit __BranchCoverageEtherDividendCheckpointFactory('./contracts/modules/Checkpoint/EtherDividendCheckpointFactory.sol',2,0);emit __CoverageEtherDividendCheckpointFactory('./contracts/modules/Checkpoint/EtherDividendCheckpointFactory.sol',40);
require(polyToken.transferFrom(msg.sender, owner, setupCost), "Insufficent allowance or balance");emit __AssertPostCoverageEtherDividendCheckpointFactory('./contracts/modules/Checkpoint/EtherDividendCheckpointFactory.sol',3);
}else { emit __BranchCoverageEtherDividendCheckpointFactory('./contracts/modules/Checkpoint/EtherDividendCheckpointFactory.sol',2,1);}

emit __CoverageEtherDividendCheckpointFactory('./contracts/modules/Checkpoint/EtherDividendCheckpointFactory.sol',41);
        emit __StatementCoverageEtherDividendCheckpointFactory('./contracts/modules/Checkpoint/EtherDividendCheckpointFactory.sol',11);
address ethDividendCheckpoint = new EtherDividendCheckpointProxy(msg.sender, address(polyToken), logicContract);
        /*solium-disable-next-line security/no-block-members*/
emit __CoverageEtherDividendCheckpointFactory('./contracts/modules/Checkpoint/EtherDividendCheckpointFactory.sol',43);
        emit __StatementCoverageEtherDividendCheckpointFactory('./contracts/modules/Checkpoint/EtherDividendCheckpointFactory.sol',12);
emit GenerateModuleFromFactory(ethDividendCheckpoint, getName(), address(this), msg.sender, setupCost, now);
emit __CoverageEtherDividendCheckpointFactory('./contracts/modules/Checkpoint/EtherDividendCheckpointFactory.sol',44);
        emit __StatementCoverageEtherDividendCheckpointFactory('./contracts/modules/Checkpoint/EtherDividendCheckpointFactory.sol',13);
return ethDividendCheckpoint;
    }

    /**
     * @notice Type of the Module factory
     */
    function getTypes() external  returns(uint8[]) {emit __FunctionCoverageEtherDividendCheckpointFactory('./contracts/modules/Checkpoint/EtherDividendCheckpointFactory.sol',3);

emit __CoverageEtherDividendCheckpointFactory('./contracts/modules/Checkpoint/EtherDividendCheckpointFactory.sol',51);
        emit __StatementCoverageEtherDividendCheckpointFactory('./contracts/modules/Checkpoint/EtherDividendCheckpointFactory.sol',14);
uint8[] memory res = new uint8[](1);
emit __CoverageEtherDividendCheckpointFactory('./contracts/modules/Checkpoint/EtherDividendCheckpointFactory.sol',52);
        emit __StatementCoverageEtherDividendCheckpointFactory('./contracts/modules/Checkpoint/EtherDividendCheckpointFactory.sol',15);
res[0] = 4;
emit __CoverageEtherDividendCheckpointFactory('./contracts/modules/Checkpoint/EtherDividendCheckpointFactory.sol',53);
        emit __StatementCoverageEtherDividendCheckpointFactory('./contracts/modules/Checkpoint/EtherDividendCheckpointFactory.sol',16);
return res;
    }

    /**
     * @notice Returns the instructions associated with the module
     */
    function getInstructions() external  returns(string) {emit __FunctionCoverageEtherDividendCheckpointFactory('./contracts/modules/Checkpoint/EtherDividendCheckpointFactory.sol',4);

emit __CoverageEtherDividendCheckpointFactory('./contracts/modules/Checkpoint/EtherDividendCheckpointFactory.sol',60);
        emit __StatementCoverageEtherDividendCheckpointFactory('./contracts/modules/Checkpoint/EtherDividendCheckpointFactory.sol',17);
return "Create a dividend which will be paid out to token holders proportionally according to their balances at the point the dividend is created";
    }

    /**
     * @notice Get the tags related to the module factory
     */
    function getTags() external  returns(bytes32[]) {emit __FunctionCoverageEtherDividendCheckpointFactory('./contracts/modules/Checkpoint/EtherDividendCheckpointFactory.sol',5);

emit __CoverageEtherDividendCheckpointFactory('./contracts/modules/Checkpoint/EtherDividendCheckpointFactory.sol',67);
        emit __StatementCoverageEtherDividendCheckpointFactory('./contracts/modules/Checkpoint/EtherDividendCheckpointFactory.sol',18);
bytes32[] memory availableTags = new bytes32[](3);
emit __CoverageEtherDividendCheckpointFactory('./contracts/modules/Checkpoint/EtherDividendCheckpointFactory.sol',68);
        emit __StatementCoverageEtherDividendCheckpointFactory('./contracts/modules/Checkpoint/EtherDividendCheckpointFactory.sol',19);
availableTags[0] = "ETH";
emit __CoverageEtherDividendCheckpointFactory('./contracts/modules/Checkpoint/EtherDividendCheckpointFactory.sol',69);
        emit __StatementCoverageEtherDividendCheckpointFactory('./contracts/modules/Checkpoint/EtherDividendCheckpointFactory.sol',20);
availableTags[1] = "Checkpoint";
emit __CoverageEtherDividendCheckpointFactory('./contracts/modules/Checkpoint/EtherDividendCheckpointFactory.sol',70);
        emit __StatementCoverageEtherDividendCheckpointFactory('./contracts/modules/Checkpoint/EtherDividendCheckpointFactory.sol',21);
availableTags[2] = "Dividend";
emit __CoverageEtherDividendCheckpointFactory('./contracts/modules/Checkpoint/EtherDividendCheckpointFactory.sol',71);
        emit __StatementCoverageEtherDividendCheckpointFactory('./contracts/modules/Checkpoint/EtherDividendCheckpointFactory.sol',22);
return availableTags;
    }
}
