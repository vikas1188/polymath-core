pragma solidity ^0.4.24;

import "./ISTO.sol";
import "../../interfaces/ISecurityToken.sol";

/**
 * @title STO module for sample implementation of a different crowdsale module
 */
contract DummySTO is ISTO {event __CoverageDummySTO(string fileName, uint256 lineNumber);
event __FunctionCoverageDummySTO(string fileName, uint256 fnId);
event __StatementCoverageDummySTO(string fileName, uint256 statementId);
event __BranchCoverageDummySTO(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageDummySTO(string fileName, uint256 branchId);
event __AssertPostCoverageDummySTO(string fileName, uint256 branchId);


    bytes32 public constant ADMIN = "ADMIN";

    uint256 public investorCount;

    uint256 public cap;
    string public someString;

    event GenerateTokens(address _investor, uint256 _amount);

    mapping (address => uint256) public investors;

    /**
     * @notice Constructor
     * @param _securityToken Address of the security token
     * @param _polyAddress Address of the polytoken
     */
    constructor (address _securityToken, address _polyAddress) public
    Module(_securityToken, _polyAddress)
    {emit __FunctionCoverageDummySTO('./contracts/modules/STO/DummySTO.sol',1);

    }

    /**
     * @notice Function used to intialize the differnet variables
     * @param _startTime Unix timestamp at which offering get started
     * @param _endTime Unix timestamp at which offering get ended
     * @param _cap Maximum No. of tokens for sale
     * @param _someString Any string that contails the details
     */
    function configure(uint256 _startTime, uint256 _endTime, uint256 _cap, string _someString) public onlyFactory {emit __FunctionCoverageDummySTO('./contracts/modules/STO/DummySTO.sol',2);

emit __CoverageDummySTO('./contracts/modules/STO/DummySTO.sol',40);
        emit __StatementCoverageDummySTO('./contracts/modules/STO/DummySTO.sol',1);
startTime = _startTime;
emit __CoverageDummySTO('./contracts/modules/STO/DummySTO.sol',41);
        emit __StatementCoverageDummySTO('./contracts/modules/STO/DummySTO.sol',2);
endTime = _endTime;
emit __CoverageDummySTO('./contracts/modules/STO/DummySTO.sol',42);
        emit __StatementCoverageDummySTO('./contracts/modules/STO/DummySTO.sol',3);
cap = _cap;
emit __CoverageDummySTO('./contracts/modules/STO/DummySTO.sol',43);
        emit __StatementCoverageDummySTO('./contracts/modules/STO/DummySTO.sol',4);
someString = _someString;
    }

    /**
     * @notice This function returns the signature of configure function
     */
    function getInitFunction() public  returns (bytes4) {emit __FunctionCoverageDummySTO('./contracts/modules/STO/DummySTO.sol',3);

emit __CoverageDummySTO('./contracts/modules/STO/DummySTO.sol',50);
        emit __StatementCoverageDummySTO('./contracts/modules/STO/DummySTO.sol',5);
return bytes4(keccak256("configure(uint256,uint256,uint256,string)"));
    }

    /**
     * @notice Function used to generate the tokens
     * @param _investor Address of the investor
     * @param _amount Amount of ETH or Poly invested by the investor
     */
    function generateTokens(address _investor, uint256 _amount) public withPerm(ADMIN) {emit __FunctionCoverageDummySTO('./contracts/modules/STO/DummySTO.sol',4);

emit __CoverageDummySTO('./contracts/modules/STO/DummySTO.sol',59);
        emit __AssertPreCoverageDummySTO('./contracts/modules/STO/DummySTO.sol',1);
emit __StatementCoverageDummySTO('./contracts/modules/STO/DummySTO.sol',6);
require(!paused, "Should not be paused");emit __AssertPostCoverageDummySTO('./contracts/modules/STO/DummySTO.sol',1);

emit __CoverageDummySTO('./contracts/modules/STO/DummySTO.sol',60);
        emit __AssertPreCoverageDummySTO('./contracts/modules/STO/DummySTO.sol',2);
emit __StatementCoverageDummySTO('./contracts/modules/STO/DummySTO.sol',7);
require(_amount > 0, "Amount should be greater than 0");emit __AssertPostCoverageDummySTO('./contracts/modules/STO/DummySTO.sol',2);

emit __CoverageDummySTO('./contracts/modules/STO/DummySTO.sol',61);
        emit __StatementCoverageDummySTO('./contracts/modules/STO/DummySTO.sol',8);
ISecurityToken(securityToken).mint(_investor, _amount);
emit __CoverageDummySTO('./contracts/modules/STO/DummySTO.sol',62);
        emit __StatementCoverageDummySTO('./contracts/modules/STO/DummySTO.sol',9);
if (investors[_investor] == 0) {emit __BranchCoverageDummySTO('./contracts/modules/STO/DummySTO.sol',3,0);
emit __CoverageDummySTO('./contracts/modules/STO/DummySTO.sol',63);
            emit __StatementCoverageDummySTO('./contracts/modules/STO/DummySTO.sol',10);
investorCount = investorCount + 1;
        }else { emit __BranchCoverageDummySTO('./contracts/modules/STO/DummySTO.sol',3,1);}

        //TODO: Add SafeMath maybe
emit __CoverageDummySTO('./contracts/modules/STO/DummySTO.sol',66);
        emit __StatementCoverageDummySTO('./contracts/modules/STO/DummySTO.sol',11);
investors[_investor] = investors[_investor] + _amount;
emit __CoverageDummySTO('./contracts/modules/STO/DummySTO.sol',67);
        emit __StatementCoverageDummySTO('./contracts/modules/STO/DummySTO.sol',12);
emit GenerateTokens (_investor, _amount);
    }

    /**
     * @notice Returns the total no. of investors
     */
    function getNumberInvestors() public  returns (uint256) {emit __FunctionCoverageDummySTO('./contracts/modules/STO/DummySTO.sol',5);

emit __CoverageDummySTO('./contracts/modules/STO/DummySTO.sol',74);
        emit __StatementCoverageDummySTO('./contracts/modules/STO/DummySTO.sol',13);
return investorCount;
    }

    /**
     * @notice Returns the total no. of investors
     */
    function getTokensSold() public  returns (uint256) {emit __FunctionCoverageDummySTO('./contracts/modules/STO/DummySTO.sol',6);

emit __CoverageDummySTO('./contracts/modules/STO/DummySTO.sol',81);
        emit __StatementCoverageDummySTO('./contracts/modules/STO/DummySTO.sol',14);
return 0;
    }

    /**
     * @notice Returns the permissions flag that are associated with STO
     */
    function getPermissions() public  returns(bytes32[]) {emit __FunctionCoverageDummySTO('./contracts/modules/STO/DummySTO.sol',7);

emit __CoverageDummySTO('./contracts/modules/STO/DummySTO.sol',88);
        emit __StatementCoverageDummySTO('./contracts/modules/STO/DummySTO.sol',15);
bytes32[] memory allPermissions = new bytes32[](1);
emit __CoverageDummySTO('./contracts/modules/STO/DummySTO.sol',89);
        emit __StatementCoverageDummySTO('./contracts/modules/STO/DummySTO.sol',16);
allPermissions[0] = ADMIN;
emit __CoverageDummySTO('./contracts/modules/STO/DummySTO.sol',90);
        emit __StatementCoverageDummySTO('./contracts/modules/STO/DummySTO.sol',17);
return allPermissions;
    }

}
