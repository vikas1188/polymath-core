pragma solidity ^0.4.24;

import "../../proxy/ERC20DividendCheckpointProxy.sol";
import "../ModuleFactory.sol";

/**
 * @title Factory for deploying ERC20DividendCheckpoint module
 */
contract ERC20DividendCheckpointFactory is ModuleFactory {event __CoverageERC20DividendCheckpointFactory(string fileName, uint256 lineNumber);
event __FunctionCoverageERC20DividendCheckpointFactory(string fileName, uint256 fnId);
event __StatementCoverageERC20DividendCheckpointFactory(string fileName, uint256 statementId);
event __BranchCoverageERC20DividendCheckpointFactory(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageERC20DividendCheckpointFactory(string fileName, uint256 branchId);
event __AssertPostCoverageERC20DividendCheckpointFactory(string fileName, uint256 branchId);


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
    {emit __FunctionCoverageERC20DividendCheckpointFactory('./contracts/modules/Checkpoint/ERC20DividendCheckpointFactory.sol',1);

emit __CoverageERC20DividendCheckpointFactory('./contracts/modules/Checkpoint/ERC20DividendCheckpointFactory.sol',24);
        emit __AssertPreCoverageERC20DividendCheckpointFactory('./contracts/modules/Checkpoint/ERC20DividendCheckpointFactory.sol',1);
emit __StatementCoverageERC20DividendCheckpointFactory('./contracts/modules/Checkpoint/ERC20DividendCheckpointFactory.sol',1);
require(_logicContract != address(0), "Invalid logic contract");emit __AssertPostCoverageERC20DividendCheckpointFactory('./contracts/modules/Checkpoint/ERC20DividendCheckpointFactory.sol',1);

emit __CoverageERC20DividendCheckpointFactory('./contracts/modules/Checkpoint/ERC20DividendCheckpointFactory.sol',25);
        emit __StatementCoverageERC20DividendCheckpointFactory('./contracts/modules/Checkpoint/ERC20DividendCheckpointFactory.sol',2);
version = "2.1.0";
emit __CoverageERC20DividendCheckpointFactory('./contracts/modules/Checkpoint/ERC20DividendCheckpointFactory.sol',26);
        emit __StatementCoverageERC20DividendCheckpointFactory('./contracts/modules/Checkpoint/ERC20DividendCheckpointFactory.sol',3);
name = "ERC20DividendCheckpoint";
emit __CoverageERC20DividendCheckpointFactory('./contracts/modules/Checkpoint/ERC20DividendCheckpointFactory.sol',27);
        emit __StatementCoverageERC20DividendCheckpointFactory('./contracts/modules/Checkpoint/ERC20DividendCheckpointFactory.sol',4);
title = "ERC20 Dividend Checkpoint";
emit __CoverageERC20DividendCheckpointFactory('./contracts/modules/Checkpoint/ERC20DividendCheckpointFactory.sol',28);
        emit __StatementCoverageERC20DividendCheckpointFactory('./contracts/modules/Checkpoint/ERC20DividendCheckpointFactory.sol',5);
description = "Create ERC20 dividends for token holders at a specific checkpoint";
emit __CoverageERC20DividendCheckpointFactory('./contracts/modules/Checkpoint/ERC20DividendCheckpointFactory.sol',29);
        emit __StatementCoverageERC20DividendCheckpointFactory('./contracts/modules/Checkpoint/ERC20DividendCheckpointFactory.sol',6);
compatibleSTVersionRange["lowerBound"] = VersionUtils.pack(uint8(0), uint8(0), uint8(0));
emit __CoverageERC20DividendCheckpointFactory('./contracts/modules/Checkpoint/ERC20DividendCheckpointFactory.sol',30);
        emit __StatementCoverageERC20DividendCheckpointFactory('./contracts/modules/Checkpoint/ERC20DividendCheckpointFactory.sol',7);
compatibleSTVersionRange["upperBound"] = VersionUtils.pack(uint8(0), uint8(0), uint8(0));
emit __CoverageERC20DividendCheckpointFactory('./contracts/modules/Checkpoint/ERC20DividendCheckpointFactory.sol',31);
        emit __StatementCoverageERC20DividendCheckpointFactory('./contracts/modules/Checkpoint/ERC20DividendCheckpointFactory.sol',8);
logicContract = _logicContract;
    }

    /**
     * @notice Used to launch the Module with the help of factory
     * @return Address Contract address of the Module
     */
    function deploy(bytes /* _data */) external returns(address) {emit __FunctionCoverageERC20DividendCheckpointFactory('./contracts/modules/Checkpoint/ERC20DividendCheckpointFactory.sol',2);

emit __CoverageERC20DividendCheckpointFactory('./contracts/modules/Checkpoint/ERC20DividendCheckpointFactory.sol',39);
        emit __StatementCoverageERC20DividendCheckpointFactory('./contracts/modules/Checkpoint/ERC20DividendCheckpointFactory.sol',9);
if (setupCost > 0)
            {emit __AssertPreCoverageERC20DividendCheckpointFactory('./contracts/modules/Checkpoint/ERC20DividendCheckpointFactory.sol',3);
emit __StatementCoverageERC20DividendCheckpointFactory('./contracts/modules/Checkpoint/ERC20DividendCheckpointFactory.sol',10);
emit __BranchCoverageERC20DividendCheckpointFactory('./contracts/modules/Checkpoint/ERC20DividendCheckpointFactory.sol',2,0);emit __CoverageERC20DividendCheckpointFactory('./contracts/modules/Checkpoint/ERC20DividendCheckpointFactory.sol',40);
require(polyToken.transferFrom(msg.sender, owner, setupCost), "insufficent allowance");emit __AssertPostCoverageERC20DividendCheckpointFactory('./contracts/modules/Checkpoint/ERC20DividendCheckpointFactory.sol',3);
}else { emit __BranchCoverageERC20DividendCheckpointFactory('./contracts/modules/Checkpoint/ERC20DividendCheckpointFactory.sol',2,1);}

emit __CoverageERC20DividendCheckpointFactory('./contracts/modules/Checkpoint/ERC20DividendCheckpointFactory.sol',41);
        emit __StatementCoverageERC20DividendCheckpointFactory('./contracts/modules/Checkpoint/ERC20DividendCheckpointFactory.sol',11);
address erc20DividendCheckpoint = new ERC20DividendCheckpointProxy(msg.sender, address(polyToken), logicContract);
        /*solium-disable-next-line security/no-block-members*/
emit __CoverageERC20DividendCheckpointFactory('./contracts/modules/Checkpoint/ERC20DividendCheckpointFactory.sol',43);
        emit __StatementCoverageERC20DividendCheckpointFactory('./contracts/modules/Checkpoint/ERC20DividendCheckpointFactory.sol',12);
emit GenerateModuleFromFactory(erc20DividendCheckpoint, getName(), address(this), msg.sender, setupCost, now);
emit __CoverageERC20DividendCheckpointFactory('./contracts/modules/Checkpoint/ERC20DividendCheckpointFactory.sol',44);
        emit __StatementCoverageERC20DividendCheckpointFactory('./contracts/modules/Checkpoint/ERC20DividendCheckpointFactory.sol',13);
return erc20DividendCheckpoint;
    }

    /**
     * @notice Type of the Module factory
     */
    function getTypes() external  returns(uint8[]) {emit __FunctionCoverageERC20DividendCheckpointFactory('./contracts/modules/Checkpoint/ERC20DividendCheckpointFactory.sol',3);

emit __CoverageERC20DividendCheckpointFactory('./contracts/modules/Checkpoint/ERC20DividendCheckpointFactory.sol',51);
        emit __StatementCoverageERC20DividendCheckpointFactory('./contracts/modules/Checkpoint/ERC20DividendCheckpointFactory.sol',14);
uint8[] memory res = new uint8[](1);
emit __CoverageERC20DividendCheckpointFactory('./contracts/modules/Checkpoint/ERC20DividendCheckpointFactory.sol',52);
        emit __StatementCoverageERC20DividendCheckpointFactory('./contracts/modules/Checkpoint/ERC20DividendCheckpointFactory.sol',15);
res[0] = 4;
emit __CoverageERC20DividendCheckpointFactory('./contracts/modules/Checkpoint/ERC20DividendCheckpointFactory.sol',53);
        emit __StatementCoverageERC20DividendCheckpointFactory('./contracts/modules/Checkpoint/ERC20DividendCheckpointFactory.sol',16);
return res;
    }

    /**
     * @notice Returns the instructions associated with the module
     */
    function getInstructions() external  returns(string) {emit __FunctionCoverageERC20DividendCheckpointFactory('./contracts/modules/Checkpoint/ERC20DividendCheckpointFactory.sol',4);

emit __CoverageERC20DividendCheckpointFactory('./contracts/modules/Checkpoint/ERC20DividendCheckpointFactory.sol',60);
        emit __StatementCoverageERC20DividendCheckpointFactory('./contracts/modules/Checkpoint/ERC20DividendCheckpointFactory.sol',17);
return "Create ERC20 dividend to be paid out to token holders based on their balances at dividend creation time";
    }

    /**
     * @notice Get the tags related to the module factory
     */
    function getTags() external  returns(bytes32[]) {emit __FunctionCoverageERC20DividendCheckpointFactory('./contracts/modules/Checkpoint/ERC20DividendCheckpointFactory.sol',5);

emit __CoverageERC20DividendCheckpointFactory('./contracts/modules/Checkpoint/ERC20DividendCheckpointFactory.sol',67);
        emit __StatementCoverageERC20DividendCheckpointFactory('./contracts/modules/Checkpoint/ERC20DividendCheckpointFactory.sol',18);
bytes32[] memory availableTags = new bytes32[](3);
emit __CoverageERC20DividendCheckpointFactory('./contracts/modules/Checkpoint/ERC20DividendCheckpointFactory.sol',68);
        emit __StatementCoverageERC20DividendCheckpointFactory('./contracts/modules/Checkpoint/ERC20DividendCheckpointFactory.sol',19);
availableTags[0] = "ERC20";
emit __CoverageERC20DividendCheckpointFactory('./contracts/modules/Checkpoint/ERC20DividendCheckpointFactory.sol',69);
        emit __StatementCoverageERC20DividendCheckpointFactory('./contracts/modules/Checkpoint/ERC20DividendCheckpointFactory.sol',20);
availableTags[1] = "Dividend";
emit __CoverageERC20DividendCheckpointFactory('./contracts/modules/Checkpoint/ERC20DividendCheckpointFactory.sol',70);
        emit __StatementCoverageERC20DividendCheckpointFactory('./contracts/modules/Checkpoint/ERC20DividendCheckpointFactory.sol',21);
availableTags[2] = "Checkpoint";
emit __CoverageERC20DividendCheckpointFactory('./contracts/modules/Checkpoint/ERC20DividendCheckpointFactory.sol',71);
        emit __StatementCoverageERC20DividendCheckpointFactory('./contracts/modules/Checkpoint/ERC20DividendCheckpointFactory.sol',22);
return availableTags;
    }
}
