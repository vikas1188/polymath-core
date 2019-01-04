pragma solidity  ^0.4.24;

import "openzeppelin-solidity/contracts/math/SafeMath.sol";

library DecimalMath {event __CoverageDecimalMath(string fileName, uint256 lineNumber);
event __FunctionCoverageDecimalMath(string fileName, uint256 fnId);
event __StatementCoverageDecimalMath(string fileName, uint256 statementId);
event __BranchCoverageDecimalMath(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageDecimalMath(string fileName, uint256 branchId);
event __AssertPostCoverageDecimalMath(string fileName, uint256 branchId);


    using SafeMath for uint256;

     /**
     * @notice This function multiplies two decimals represented as (decimal * 10**DECIMALS)
     * @return uint256 Result of multiplication represented as (decimal * 10**DECIMALS)
     */
    function mul(uint256 x, uint256 y) internal  returns (uint256 z) {emit __FunctionCoverageDecimalMath('./contracts/libraries/DecimalMath.sol',1);

emit __CoverageDecimalMath('./contracts/libraries/DecimalMath.sol',14);
        emit __StatementCoverageDecimalMath('./contracts/libraries/DecimalMath.sol',1);
z = SafeMath.add(SafeMath.mul(x, y), (10 ** 18) / 2) / (10 ** 18);
    }

    /**
     * @notice This function divides two decimals represented as (decimal * 10**DECIMALS)
     * @return uint256 Result of division represented as (decimal * 10**DECIMALS)
     */
    function div(uint256 x, uint256 y) internal  returns (uint256 z) {emit __FunctionCoverageDecimalMath('./contracts/libraries/DecimalMath.sol',2);

emit __CoverageDecimalMath('./contracts/libraries/DecimalMath.sol',22);
        emit __StatementCoverageDecimalMath('./contracts/libraries/DecimalMath.sol',2);
z = SafeMath.add(SafeMath.mul(x, (10 ** 18)), y / 2) / y;
    }

}