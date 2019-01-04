pragma solidity ^0.4.24;

import "../../proxy/VestingEscrowWalletProxy.sol";
import "../../interfaces/IBoot.sol";
import "../ModuleFactory.sol";
import "../../libraries/Util.sol";

/**
 * @title Factory for deploying VestingEscrowWallet module
 */
contract VestingEscrowWalletFactory is ModuleFactory {event __CoverageVestingEscrowWalletFactory(string fileName, uint256 lineNumber);
event __FunctionCoverageVestingEscrowWalletFactory(string fileName, uint256 fnId);
event __StatementCoverageVestingEscrowWalletFactory(string fileName, uint256 statementId);
event __BranchCoverageVestingEscrowWalletFactory(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageVestingEscrowWalletFactory(string fileName, uint256 branchId);
event __AssertPostCoverageVestingEscrowWalletFactory(string fileName, uint256 branchId);

    
    address public logicContract;
    /**
     * @notice Constructor
     * @param _polyAddress Address of the polytoken
     */
    constructor (address _polyAddress, uint256 _setupCost, uint256 _usageCost, uint256 _subscriptionCost, address _logicContract) public
    ModuleFactory(_polyAddress, _setupCost, _usageCost, _subscriptionCost)
    {emit __FunctionCoverageVestingEscrowWalletFactory('./contracts/modules/Wallet/VestingEscrowWalletFactory.sol',1);

emit __CoverageVestingEscrowWalletFactory('./contracts/modules/Wallet/VestingEscrowWalletFactory.sol',21);
        emit __AssertPreCoverageVestingEscrowWalletFactory('./contracts/modules/Wallet/VestingEscrowWalletFactory.sol',1);
emit __StatementCoverageVestingEscrowWalletFactory('./contracts/modules/Wallet/VestingEscrowWalletFactory.sol',1);
require(_logicContract != address(0), "Invalid address");emit __AssertPostCoverageVestingEscrowWalletFactory('./contracts/modules/Wallet/VestingEscrowWalletFactory.sol',1);

emit __CoverageVestingEscrowWalletFactory('./contracts/modules/Wallet/VestingEscrowWalletFactory.sol',22);
        emit __StatementCoverageVestingEscrowWalletFactory('./contracts/modules/Wallet/VestingEscrowWalletFactory.sol',2);
version = "1.0.0";
emit __CoverageVestingEscrowWalletFactory('./contracts/modules/Wallet/VestingEscrowWalletFactory.sol',23);
        emit __StatementCoverageVestingEscrowWalletFactory('./contracts/modules/Wallet/VestingEscrowWalletFactory.sol',3);
name = "VestingEscrowWallet";
emit __CoverageVestingEscrowWalletFactory('./contracts/modules/Wallet/VestingEscrowWalletFactory.sol',24);
        emit __StatementCoverageVestingEscrowWalletFactory('./contracts/modules/Wallet/VestingEscrowWalletFactory.sol',4);
title = "Vesting Escrow Wallet";
emit __CoverageVestingEscrowWalletFactory('./contracts/modules/Wallet/VestingEscrowWalletFactory.sol',25);
        emit __StatementCoverageVestingEscrowWalletFactory('./contracts/modules/Wallet/VestingEscrowWalletFactory.sol',5);
description = "Manage vesting schedules to employees / affiliates";
emit __CoverageVestingEscrowWalletFactory('./contracts/modules/Wallet/VestingEscrowWalletFactory.sol',26);
        emit __StatementCoverageVestingEscrowWalletFactory('./contracts/modules/Wallet/VestingEscrowWalletFactory.sol',6);
compatibleSTVersionRange["lowerBound"] = VersionUtils.pack(uint8(0), uint8(0), uint8(0));
emit __CoverageVestingEscrowWalletFactory('./contracts/modules/Wallet/VestingEscrowWalletFactory.sol',27);
        emit __StatementCoverageVestingEscrowWalletFactory('./contracts/modules/Wallet/VestingEscrowWalletFactory.sol',7);
compatibleSTVersionRange["upperBound"] = VersionUtils.pack(uint8(0), uint8(0), uint8(0));
emit __CoverageVestingEscrowWalletFactory('./contracts/modules/Wallet/VestingEscrowWalletFactory.sol',28);
        emit __StatementCoverageVestingEscrowWalletFactory('./contracts/modules/Wallet/VestingEscrowWalletFactory.sol',8);
logicContract = _logicContract;
    }

    /**
     * @notice Used to launch the Module with the help of factory
     * _data Data used for the intialization of the module factory variables
     * @return address Contract address of the Module
     */
    function deploy(bytes _data) external returns(address) {emit __FunctionCoverageVestingEscrowWalletFactory('./contracts/modules/Wallet/VestingEscrowWalletFactory.sol',2);

emit __CoverageVestingEscrowWalletFactory('./contracts/modules/Wallet/VestingEscrowWalletFactory.sol',37);
        emit __StatementCoverageVestingEscrowWalletFactory('./contracts/modules/Wallet/VestingEscrowWalletFactory.sol',9);
if (setupCost > 0) {emit __BranchCoverageVestingEscrowWalletFactory('./contracts/modules/Wallet/VestingEscrowWalletFactory.sol',2,0);
emit __CoverageVestingEscrowWalletFactory('./contracts/modules/Wallet/VestingEscrowWalletFactory.sol',38);
            emit __AssertPreCoverageVestingEscrowWalletFactory('./contracts/modules/Wallet/VestingEscrowWalletFactory.sol',3);
emit __StatementCoverageVestingEscrowWalletFactory('./contracts/modules/Wallet/VestingEscrowWalletFactory.sol',10);
require(polyToken.transferFrom(msg.sender, owner, setupCost), "Failed transferFrom due to insufficent Allowance provided");emit __AssertPostCoverageVestingEscrowWalletFactory('./contracts/modules/Wallet/VestingEscrowWalletFactory.sol',3);

        }else { emit __BranchCoverageVestingEscrowWalletFactory('./contracts/modules/Wallet/VestingEscrowWalletFactory.sol',2,1);}

emit __CoverageVestingEscrowWalletFactory('./contracts/modules/Wallet/VestingEscrowWalletFactory.sol',40);
        emit __StatementCoverageVestingEscrowWalletFactory('./contracts/modules/Wallet/VestingEscrowWalletFactory.sol',11);
VestingEscrowWalletProxy vestingEscrowWallet = new VestingEscrowWalletProxy(msg.sender, address(polyToken), logicContract);
        //Checks that _data is valid (not calling anything it shouldn't)
emit __CoverageVestingEscrowWalletFactory('./contracts/modules/Wallet/VestingEscrowWalletFactory.sol',42);
        emit __AssertPreCoverageVestingEscrowWalletFactory('./contracts/modules/Wallet/VestingEscrowWalletFactory.sol',4);
emit __StatementCoverageVestingEscrowWalletFactory('./contracts/modules/Wallet/VestingEscrowWalletFactory.sol',12);
require(Util.getSig(_data) == IBoot(vestingEscrowWallet).getInitFunction(), "Invalid data");emit __AssertPostCoverageVestingEscrowWalletFactory('./contracts/modules/Wallet/VestingEscrowWalletFactory.sol',4);

        /*solium-disable-next-line security/no-low-level-calls*/
emit __CoverageVestingEscrowWalletFactory('./contracts/modules/Wallet/VestingEscrowWalletFactory.sol',44);
        emit __AssertPreCoverageVestingEscrowWalletFactory('./contracts/modules/Wallet/VestingEscrowWalletFactory.sol',5);
emit __StatementCoverageVestingEscrowWalletFactory('./contracts/modules/Wallet/VestingEscrowWalletFactory.sol',13);
require(address(vestingEscrowWallet).call(_data), "Unsuccessfull call");emit __AssertPostCoverageVestingEscrowWalletFactory('./contracts/modules/Wallet/VestingEscrowWalletFactory.sol',5);

        /*solium-disable-next-line security/no-block-members*/
emit __CoverageVestingEscrowWalletFactory('./contracts/modules/Wallet/VestingEscrowWalletFactory.sol',46);
        emit __StatementCoverageVestingEscrowWalletFactory('./contracts/modules/Wallet/VestingEscrowWalletFactory.sol',14);
emit GenerateModuleFromFactory(address(vestingEscrowWallet), getName(), address(this), msg.sender, setupCost, now);
emit __CoverageVestingEscrowWalletFactory('./contracts/modules/Wallet/VestingEscrowWalletFactory.sol',47);
        emit __StatementCoverageVestingEscrowWalletFactory('./contracts/modules/Wallet/VestingEscrowWalletFactory.sol',15);
return address(vestingEscrowWallet);
    }

    /**
     * @notice Type of the Module factory
     */
    function getTypes() external  returns(uint8[]) {emit __FunctionCoverageVestingEscrowWalletFactory('./contracts/modules/Wallet/VestingEscrowWalletFactory.sol',3);

emit __CoverageVestingEscrowWalletFactory('./contracts/modules/Wallet/VestingEscrowWalletFactory.sol',54);
        emit __StatementCoverageVestingEscrowWalletFactory('./contracts/modules/Wallet/VestingEscrowWalletFactory.sol',16);
uint8[] memory res = new uint8[](1);
emit __CoverageVestingEscrowWalletFactory('./contracts/modules/Wallet/VestingEscrowWalletFactory.sol',55);
        emit __StatementCoverageVestingEscrowWalletFactory('./contracts/modules/Wallet/VestingEscrowWalletFactory.sol',17);
res[0] = 6;
emit __CoverageVestingEscrowWalletFactory('./contracts/modules/Wallet/VestingEscrowWalletFactory.sol',56);
        emit __StatementCoverageVestingEscrowWalletFactory('./contracts/modules/Wallet/VestingEscrowWalletFactory.sol',18);
return res;
    }

    /**
     * @notice Returns the instructions associated with the module
     */
    function getInstructions() external  returns(string) {emit __FunctionCoverageVestingEscrowWalletFactory('./contracts/modules/Wallet/VestingEscrowWalletFactory.sol',4);

        /*solium-disable-next-line max-len*/
emit __CoverageVestingEscrowWalletFactory('./contracts/modules/Wallet/VestingEscrowWalletFactory.sol',64);
        emit __StatementCoverageVestingEscrowWalletFactory('./contracts/modules/Wallet/VestingEscrowWalletFactory.sol',19);
return "Issuer can deposit tokens to the contract and create the vesting schedule for the given address (Affiliate/Employee). These address can withdraw tokens according to there vesting schedule.";
    }

    /**
     * @notice Get the tags related to the module factory
     */
    function getTags() external  returns(bytes32[]) {emit __FunctionCoverageVestingEscrowWalletFactory('./contracts/modules/Wallet/VestingEscrowWalletFactory.sol',5);

emit __CoverageVestingEscrowWalletFactory('./contracts/modules/Wallet/VestingEscrowWalletFactory.sol',71);
        emit __StatementCoverageVestingEscrowWalletFactory('./contracts/modules/Wallet/VestingEscrowWalletFactory.sol',20);
bytes32[] memory availableTags = new bytes32[](2);
emit __CoverageVestingEscrowWalletFactory('./contracts/modules/Wallet/VestingEscrowWalletFactory.sol',72);
        emit __StatementCoverageVestingEscrowWalletFactory('./contracts/modules/Wallet/VestingEscrowWalletFactory.sol',21);
availableTags[0] = "Vested";
emit __CoverageVestingEscrowWalletFactory('./contracts/modules/Wallet/VestingEscrowWalletFactory.sol',73);
        emit __StatementCoverageVestingEscrowWalletFactory('./contracts/modules/Wallet/VestingEscrowWalletFactory.sol',22);
availableTags[1] = "Escrow Wallet";
emit __CoverageVestingEscrowWalletFactory('./contracts/modules/Wallet/VestingEscrowWalletFactory.sol',74);
        emit __StatementCoverageVestingEscrowWalletFactory('./contracts/modules/Wallet/VestingEscrowWalletFactory.sol',23);
return availableTags;
    }
}
