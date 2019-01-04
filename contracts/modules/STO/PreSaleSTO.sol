pragma solidity ^0.4.24;

import "./ISTO.sol";
import "../../interfaces/ISecurityToken.sol";
import "openzeppelin-solidity/contracts/math/SafeMath.sol";

/**
 * @title STO module for private presales
 */
contract PreSaleSTO is ISTO {event __CoveragePreSaleSTO(string fileName, uint256 lineNumber);
event __FunctionCoveragePreSaleSTO(string fileName, uint256 fnId);
event __StatementCoveragePreSaleSTO(string fileName, uint256 statementId);
event __BranchCoveragePreSaleSTO(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoveragePreSaleSTO(string fileName, uint256 branchId);
event __AssertPostCoveragePreSaleSTO(string fileName, uint256 branchId);

    using SafeMath for uint256;

    bytes32 public constant PRE_SALE_ADMIN = "PRE_SALE_ADMIN";

    event TokensAllocated(address _investor, uint256 _amount);

    mapping (address => uint256) public investors;

    /**
     * @notice Constructor
     * @param _securityToken Address of the security token
     * @param _polyAddress Address of the polytoken
     */
    constructor (address _securityToken, address _polyAddress) public
    Module(_securityToken, _polyAddress)
    {emit __FunctionCoveragePreSaleSTO('./contracts/modules/STO/PreSaleSTO.sol',1);

    }

    /**
     * @notice Function used to initialize the different variables
     * @param _endTime Unix timestamp at which offering ends
     */
    function configure(uint256 _endTime) public onlyFactory {emit __FunctionCoveragePreSaleSTO('./contracts/modules/STO/PreSaleSTO.sol',2);

emit __CoveragePreSaleSTO('./contracts/modules/STO/PreSaleSTO.sol',34);
        emit __AssertPreCoveragePreSaleSTO('./contracts/modules/STO/PreSaleSTO.sol',1);
emit __StatementCoveragePreSaleSTO('./contracts/modules/STO/PreSaleSTO.sol',1);
require(_endTime != 0, "endTime should not be 0");emit __AssertPostCoveragePreSaleSTO('./contracts/modules/STO/PreSaleSTO.sol',1);

emit __CoveragePreSaleSTO('./contracts/modules/STO/PreSaleSTO.sol',35);
        emit __StatementCoveragePreSaleSTO('./contracts/modules/STO/PreSaleSTO.sol',2);
endTime = _endTime;
    }

    /**
     * @notice This function returns the signature of the configure function
     */
    function getInitFunction() public  returns (bytes4) {emit __FunctionCoveragePreSaleSTO('./contracts/modules/STO/PreSaleSTO.sol',3);

emit __CoveragePreSaleSTO('./contracts/modules/STO/PreSaleSTO.sol',42);
        emit __StatementCoveragePreSaleSTO('./contracts/modules/STO/PreSaleSTO.sol',3);
return bytes4(keccak256("configure(uint256)"));
    }

    /**
     * @notice Returns the total no. of investors
     */
    function getNumberInvestors() public  returns (uint256) {emit __FunctionCoveragePreSaleSTO('./contracts/modules/STO/PreSaleSTO.sol',4);

emit __CoveragePreSaleSTO('./contracts/modules/STO/PreSaleSTO.sol',49);
        emit __StatementCoveragePreSaleSTO('./contracts/modules/STO/PreSaleSTO.sol',4);
return investorCount;
    }

    /**
     * @notice Returns the total no. of tokens sold
     */
    function getTokensSold() public  returns (uint256) {emit __FunctionCoveragePreSaleSTO('./contracts/modules/STO/PreSaleSTO.sol',5);

emit __CoveragePreSaleSTO('./contracts/modules/STO/PreSaleSTO.sol',56);
        emit __StatementCoveragePreSaleSTO('./contracts/modules/STO/PreSaleSTO.sol',5);
return totalTokensSold;
    }

    /**
     * @notice Returns the permissions flag that are associated with STO
     */
    function getPermissions() public  returns(bytes32[]) {emit __FunctionCoveragePreSaleSTO('./contracts/modules/STO/PreSaleSTO.sol',6);

emit __CoveragePreSaleSTO('./contracts/modules/STO/PreSaleSTO.sol',63);
        emit __StatementCoveragePreSaleSTO('./contracts/modules/STO/PreSaleSTO.sol',6);
bytes32[] memory allPermissions = new bytes32[](1);
emit __CoveragePreSaleSTO('./contracts/modules/STO/PreSaleSTO.sol',64);
        emit __StatementCoveragePreSaleSTO('./contracts/modules/STO/PreSaleSTO.sol',7);
allPermissions[0] = PRE_SALE_ADMIN;
emit __CoveragePreSaleSTO('./contracts/modules/STO/PreSaleSTO.sol',65);
        emit __StatementCoveragePreSaleSTO('./contracts/modules/STO/PreSaleSTO.sol',8);
return allPermissions;
    }

    /**
     * @notice Function used to allocate tokens to the investor
     * @param _investor Address of the investor
     * @param _amount No. of tokens to be transferred to the investor
     * @param _etherContributed How much ETH was contributed
     * @param _polyContributed How much POLY was contributed
     */
    function allocateTokens(
        address _investor,
        uint256 _amount,
        uint256 _etherContributed,
        uint256 _polyContributed
    )
        public
        withPerm(PRE_SALE_ADMIN)
    {emit __FunctionCoveragePreSaleSTO('./contracts/modules/STO/PreSaleSTO.sol',7);

        /*solium-disable-next-line security/no-block-members*/
emit __CoveragePreSaleSTO('./contracts/modules/STO/PreSaleSTO.sol',85);
        emit __AssertPreCoveragePreSaleSTO('./contracts/modules/STO/PreSaleSTO.sol',2);
emit __StatementCoveragePreSaleSTO('./contracts/modules/STO/PreSaleSTO.sol',9);
require(now <= endTime, "Already passed Endtime");emit __AssertPostCoveragePreSaleSTO('./contracts/modules/STO/PreSaleSTO.sol',2);

emit __CoveragePreSaleSTO('./contracts/modules/STO/PreSaleSTO.sol',86);
        emit __AssertPreCoveragePreSaleSTO('./contracts/modules/STO/PreSaleSTO.sol',3);
emit __StatementCoveragePreSaleSTO('./contracts/modules/STO/PreSaleSTO.sol',10);
require(_amount > 0, "No. of tokens provided should be greater the zero");emit __AssertPostCoveragePreSaleSTO('./contracts/modules/STO/PreSaleSTO.sol',3);

emit __CoveragePreSaleSTO('./contracts/modules/STO/PreSaleSTO.sol',87);
        emit __StatementCoveragePreSaleSTO('./contracts/modules/STO/PreSaleSTO.sol',11);
ISecurityToken(securityToken).mint(_investor, _amount);
emit __CoveragePreSaleSTO('./contracts/modules/STO/PreSaleSTO.sol',88);
        emit __StatementCoveragePreSaleSTO('./contracts/modules/STO/PreSaleSTO.sol',12);
if (investors[_investor] == uint256(0)) {emit __BranchCoveragePreSaleSTO('./contracts/modules/STO/PreSaleSTO.sol',4,0);
emit __CoveragePreSaleSTO('./contracts/modules/STO/PreSaleSTO.sol',89);
            emit __StatementCoveragePreSaleSTO('./contracts/modules/STO/PreSaleSTO.sol',13);
investorCount = investorCount.add(1);
        }else { emit __BranchCoveragePreSaleSTO('./contracts/modules/STO/PreSaleSTO.sol',4,1);}

emit __CoveragePreSaleSTO('./contracts/modules/STO/PreSaleSTO.sol',91);
        emit __StatementCoveragePreSaleSTO('./contracts/modules/STO/PreSaleSTO.sol',14);
investors[_investor] = investors[_investor].add(_amount);
emit __CoveragePreSaleSTO('./contracts/modules/STO/PreSaleSTO.sol',92);
        emit __StatementCoveragePreSaleSTO('./contracts/modules/STO/PreSaleSTO.sol',15);
fundsRaised[uint8(FundRaiseType.ETH)] = fundsRaised[uint8(FundRaiseType.ETH)].add(_etherContributed);
emit __CoveragePreSaleSTO('./contracts/modules/STO/PreSaleSTO.sol',93);
        emit __StatementCoveragePreSaleSTO('./contracts/modules/STO/PreSaleSTO.sol',16);
fundsRaised[uint8(FundRaiseType.POLY)] = fundsRaised[uint8(FundRaiseType.POLY)].add(_polyContributed);
emit __CoveragePreSaleSTO('./contracts/modules/STO/PreSaleSTO.sol',94);
        emit __StatementCoveragePreSaleSTO('./contracts/modules/STO/PreSaleSTO.sol',17);
totalTokensSold = totalTokensSold.add(_amount);
emit __CoveragePreSaleSTO('./contracts/modules/STO/PreSaleSTO.sol',95);
        emit __StatementCoveragePreSaleSTO('./contracts/modules/STO/PreSaleSTO.sol',18);
emit TokensAllocated(_investor, _amount);
    }

    /**
     * @notice Function used to allocate tokens to multiple investors
     * @param _investors Array of address of the investors
     * @param _amounts Array of no. of tokens to be transferred to the investors
     * @param _etherContributed Array of amount of ETH contributed by each investor
     * @param _polyContributed Array of amount of POLY contributed by each investor
     */
    function allocateTokensMulti(
        address[] _investors,
        uint256[] _amounts,
        uint256[] _etherContributed,
        uint256[] _polyContributed
    )
        public
        withPerm(PRE_SALE_ADMIN)
    {emit __FunctionCoveragePreSaleSTO('./contracts/modules/STO/PreSaleSTO.sol',8);

emit __CoveragePreSaleSTO('./contracts/modules/STO/PreSaleSTO.sol',114);
        emit __AssertPreCoveragePreSaleSTO('./contracts/modules/STO/PreSaleSTO.sol',5);
emit __StatementCoveragePreSaleSTO('./contracts/modules/STO/PreSaleSTO.sol',19);
require(_investors.length == _amounts.length, "Mis-match in length of the arrays");emit __AssertPostCoveragePreSaleSTO('./contracts/modules/STO/PreSaleSTO.sol',5);

emit __CoveragePreSaleSTO('./contracts/modules/STO/PreSaleSTO.sol',115);
        emit __AssertPreCoveragePreSaleSTO('./contracts/modules/STO/PreSaleSTO.sol',6);
emit __StatementCoveragePreSaleSTO('./contracts/modules/STO/PreSaleSTO.sol',20);
require(_etherContributed.length == _polyContributed.length, "Mis-match in length of the arrays");emit __AssertPostCoveragePreSaleSTO('./contracts/modules/STO/PreSaleSTO.sol',6);

emit __CoveragePreSaleSTO('./contracts/modules/STO/PreSaleSTO.sol',116);
        emit __AssertPreCoveragePreSaleSTO('./contracts/modules/STO/PreSaleSTO.sol',7);
emit __StatementCoveragePreSaleSTO('./contracts/modules/STO/PreSaleSTO.sol',21);
require(_etherContributed.length == _investors.length, "Mis-match in length of the arrays");emit __AssertPostCoveragePreSaleSTO('./contracts/modules/STO/PreSaleSTO.sol',7);

emit __CoveragePreSaleSTO('./contracts/modules/STO/PreSaleSTO.sol',117);
        emit __StatementCoveragePreSaleSTO('./contracts/modules/STO/PreSaleSTO.sol',22);
for (uint256 i = 0; i < _investors.length; i++) {
emit __CoveragePreSaleSTO('./contracts/modules/STO/PreSaleSTO.sol',118);
            emit __StatementCoveragePreSaleSTO('./contracts/modules/STO/PreSaleSTO.sol',23);
allocateTokens(_investors[i], _amounts[i], _etherContributed[i], _polyContributed[i]);
        }
    }
}
