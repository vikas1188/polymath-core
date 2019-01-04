pragma solidity ^0.4.24;

import "../../Pausable.sol";
import "../Module.sol";
import "../../interfaces/IERC20.sol";
import "./ISTOStorage.sol";
import "openzeppelin-solidity/contracts/math/SafeMath.sol";

/**
 * @title Interface to be implemented by all STO modules
 */
contract ISTO is ISTOStorage, Module, Pausable  {event __CoverageISTO(string fileName, uint256 lineNumber);
event __FunctionCoverageISTO(string fileName, uint256 fnId);
event __StatementCoverageISTO(string fileName, uint256 statementId);
event __BranchCoverageISTO(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageISTO(string fileName, uint256 branchId);
event __AssertPostCoverageISTO(string fileName, uint256 branchId);

    using SafeMath for uint256;

    enum FundRaiseType { ETH, POLY, SC }
    
    // Event
    event SetFundRaiseTypes(FundRaiseType[] _fundRaiseTypes);

    /**
    * @notice Reclaims ERC20Basic compatible tokens
    * @dev We duplicate here due to the overriden owner & onlyOwner
    * @param _tokenContract The address of the token contract
    */
    function reclaimERC20(address _tokenContract) external onlyOwner {emit __FunctionCoverageISTO('./contracts/modules/STO/ISTO.sol',1);

emit __CoverageISTO('./contracts/modules/STO/ISTO.sol',26);
        emit __AssertPreCoverageISTO('./contracts/modules/STO/ISTO.sol',1);
emit __StatementCoverageISTO('./contracts/modules/STO/ISTO.sol',1);
require(_tokenContract != address(0), "Invalid address");emit __AssertPostCoverageISTO('./contracts/modules/STO/ISTO.sol',1);

emit __CoverageISTO('./contracts/modules/STO/ISTO.sol',27);
        emit __StatementCoverageISTO('./contracts/modules/STO/ISTO.sol',2);
IERC20 token = IERC20(_tokenContract);
emit __CoverageISTO('./contracts/modules/STO/ISTO.sol',28);
        emit __StatementCoverageISTO('./contracts/modules/STO/ISTO.sol',3);
uint256 balance = token.balanceOf(address(this));
emit __CoverageISTO('./contracts/modules/STO/ISTO.sol',29);
        emit __AssertPreCoverageISTO('./contracts/modules/STO/ISTO.sol',2);
emit __StatementCoverageISTO('./contracts/modules/STO/ISTO.sol',4);
require(token.transfer(msg.sender, balance), "Transfer failed");emit __AssertPostCoverageISTO('./contracts/modules/STO/ISTO.sol',2);

    }

    /**
     * @notice Returns funds raised by the STO
     */
    function getRaised(FundRaiseType _fundRaiseType) public  returns (uint256) {emit __FunctionCoverageISTO('./contracts/modules/STO/ISTO.sol',2);

emit __CoverageISTO('./contracts/modules/STO/ISTO.sol',36);
        emit __StatementCoverageISTO('./contracts/modules/STO/ISTO.sol',5);
return fundsRaised[uint8(_fundRaiseType)];
    }

    /**
     * @notice Returns the total no. of tokens sold
     */
    function getTokensSold() public  returns (uint256);

    /**
     * @notice Pause (overridden function)
     */
    function pause() public onlyOwner {emit __FunctionCoverageISTO('./contracts/modules/STO/ISTO.sol',3);

        /*solium-disable-next-line security/no-block-members*/
emit __CoverageISTO('./contracts/modules/STO/ISTO.sol',49);
        emit __AssertPreCoverageISTO('./contracts/modules/STO/ISTO.sol',3);
emit __StatementCoverageISTO('./contracts/modules/STO/ISTO.sol',6);
require(now < endTime, "STO has been finalized");emit __AssertPostCoverageISTO('./contracts/modules/STO/ISTO.sol',3);

emit __CoverageISTO('./contracts/modules/STO/ISTO.sol',50);
        super._pause();
    }

    /**
     * @notice Unpause (overridden function)
     */
    function unpause() public onlyOwner {emit __FunctionCoverageISTO('./contracts/modules/STO/ISTO.sol',4);

emit __CoverageISTO('./contracts/modules/STO/ISTO.sol',57);
        super._unpause();
    }

    function _setFundRaiseType(FundRaiseType[] _fundRaiseTypes) internal {emit __FunctionCoverageISTO('./contracts/modules/STO/ISTO.sol',5);

        // FundRaiseType[] parameter type ensures only valid values for _fundRaiseTypes
emit __CoverageISTO('./contracts/modules/STO/ISTO.sol',62);
        emit __AssertPreCoverageISTO('./contracts/modules/STO/ISTO.sol',4);
emit __StatementCoverageISTO('./contracts/modules/STO/ISTO.sol',7);
require(_fundRaiseTypes.length > 0, "Raise type is not specified");emit __AssertPostCoverageISTO('./contracts/modules/STO/ISTO.sol',4);

emit __CoverageISTO('./contracts/modules/STO/ISTO.sol',63);
        emit __StatementCoverageISTO('./contracts/modules/STO/ISTO.sol',8);
fundRaiseTypes[uint8(FundRaiseType.ETH)] = false;
emit __CoverageISTO('./contracts/modules/STO/ISTO.sol',64);
        emit __StatementCoverageISTO('./contracts/modules/STO/ISTO.sol',9);
fundRaiseTypes[uint8(FundRaiseType.POLY)] = false;
emit __CoverageISTO('./contracts/modules/STO/ISTO.sol',65);
        emit __StatementCoverageISTO('./contracts/modules/STO/ISTO.sol',10);
fundRaiseTypes[uint8(FundRaiseType.SC)] = false;
emit __CoverageISTO('./contracts/modules/STO/ISTO.sol',66);
        emit __StatementCoverageISTO('./contracts/modules/STO/ISTO.sol',11);
for (uint8 j = 0; j < _fundRaiseTypes.length; j++) {
emit __CoverageISTO('./contracts/modules/STO/ISTO.sol',67);
            emit __StatementCoverageISTO('./contracts/modules/STO/ISTO.sol',12);
fundRaiseTypes[uint8(_fundRaiseTypes[j])] = true;
        }
emit __CoverageISTO('./contracts/modules/STO/ISTO.sol',69);
        emit __StatementCoverageISTO('./contracts/modules/STO/ISTO.sol',13);
emit SetFundRaiseTypes(_fundRaiseTypes);
    }

}
