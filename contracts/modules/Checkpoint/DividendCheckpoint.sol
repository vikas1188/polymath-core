/**
 * DISCLAIMER: Under certain conditions, the function pushDividendPayment
 * may fail due to block gas limits.
 * If the total number of investors that ever held tokens is greater than ~15,000 then
 * the function may fail. If this happens investors can pull their dividends, or the Issuer
 * can use pushDividendPaymentToAddresses to provide an explict address list in batches
 */
pragma solidity ^0.4.24;

import "./ICheckpoint.sol";
import "./DividendCheckpointStorage.sol";
import "../Module.sol";
import "../../interfaces/ISecurityToken.sol";
import "openzeppelin-solidity/contracts/math/SafeMath.sol";
import "openzeppelin-solidity/contracts/math/Math.sol";

/**
 * @title Checkpoint module for issuing ether dividends
 * @dev abstract contract
 */
contract DividendCheckpoint is DividendCheckpointStorage, ICheckpoint, Module {event __CoverageDividendCheckpoint(string fileName, uint256 lineNumber);
event __FunctionCoverageDividendCheckpoint(string fileName, uint256 fnId);
event __StatementCoverageDividendCheckpoint(string fileName, uint256 statementId);
event __BranchCoverageDividendCheckpoint(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageDividendCheckpoint(string fileName, uint256 branchId);
event __AssertPostCoverageDividendCheckpoint(string fileName, uint256 branchId);

    using SafeMath for uint256;

    event SetDefaultExcludedAddresses(address[] _excluded, uint256 _timestamp);
    event SetWithholding(address[] _investors, uint256[] _withholding, uint256 _timestamp);
    event SetWithholdingFixed(address[] _investors, uint256 _withholding, uint256 _timestamp);

    modifier validDividendIndex(uint256 _dividendIndex) {emit __FunctionCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',1);

emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',29);
        emit __AssertPreCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',1);
emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',1);
require(_dividendIndex < dividends.length, "Invalid dividend");emit __AssertPostCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',1);

emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',30);
        emit __AssertPreCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',2);
emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',2);
require(!dividends[_dividendIndex].reclaimed, "Dividend reclaimed");emit __AssertPostCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',2);

        /*solium-disable-next-line security/no-block-members*/
emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',32);
        emit __AssertPreCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',3);
emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',3);
require(now >= dividends[_dividendIndex].maturity, "Dividend maturity in future");emit __AssertPostCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',3);

        /*solium-disable-next-line security/no-block-members*/
emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',34);
        emit __AssertPreCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',4);
emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',4);
require(now < dividends[_dividendIndex].expiry, "Dividend expiry in past");emit __AssertPostCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',4);

emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',35);
        _;
    }

    /**
    * @notice Init function i.e generalise function to maintain the structure of the module contract
    * @return bytes4
    */
    function getInitFunction() public  returns (bytes4) {emit __FunctionCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',2);

emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',43);
        emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',5);
return bytes4(0);
    }

    /**
     * @notice Return the default excluded addresses
     * @return List of excluded addresses
     */
    function getDefaultExcluded() external  returns (address[]) {emit __FunctionCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',3);

emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',51);
        emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',6);
return excluded;
    }

    /**
     * @notice Creates a checkpoint on the security token
     * @return Checkpoint ID
     */
    function createCheckpoint() public withPerm(CHECKPOINT) returns (uint256) {emit __FunctionCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',4);

emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',59);
        emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',7);
return ISecurityToken(securityToken).createCheckpoint();
    }

    /**
     * @notice Function to clear and set list of excluded addresses used for future dividends
     * @param _excluded Addresses of investors
     */
    function setDefaultExcluded(address[] _excluded) public withPerm(MANAGE) {emit __FunctionCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',5);

emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',67);
        emit __AssertPreCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',5);
emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',8);
require(_excluded.length <= EXCLUDED_ADDRESS_LIMIT, "Too many excluded addresses");emit __AssertPostCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',5);

emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',68);
        emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',9);
for (uint256 j = 0; j < _excluded.length; j++) {
emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',69);
            emit __AssertPreCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',6);
emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',10);
require (_excluded[j] != address(0), "Invalid address");emit __AssertPostCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',6);

emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',70);
            emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',11);
for (uint256 i = j + 1; i < _excluded.length; i++) {
emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',71);
                emit __AssertPreCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',7);
emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',12);
require (_excluded[j] != _excluded[i], "Duplicate exclude address");emit __AssertPostCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',7);

            }
        }
emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',74);
        emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',13);
excluded = _excluded;
        /*solium-disable-next-line security/no-block-members*/
emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',76);
        emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',14);
emit SetDefaultExcludedAddresses(excluded, now);
    }

    /**
     * @notice Function to set withholding tax rates for investors
     * @param _investors Addresses of investors
     * @param _withholding Withholding tax for individual investors (multiplied by 10**16)
     */
    function setWithholding(address[] _investors, uint256[] _withholding) public withPerm(MANAGE) {emit __FunctionCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',6);

emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',85);
        emit __AssertPreCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',8);
emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',15);
require(_investors.length == _withholding.length, "Mismatched input lengths");emit __AssertPostCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',8);

        /*solium-disable-next-line security/no-block-members*/
emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',87);
        emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',16);
emit SetWithholding(_investors, _withholding, now);
emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',88);
        emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',17);
for (uint256 i = 0; i < _investors.length; i++) {
emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',89);
            emit __AssertPreCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',9);
emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',18);
require(_withholding[i] <= 10**18, "Incorrect withholding tax");emit __AssertPostCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',9);

emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',90);
            emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',19);
withholdingTax[_investors[i]] = _withholding[i];
        }
    }

    /**
     * @notice Function to set withholding tax rates for investors
     * @param _investors Addresses of investor
     * @param _withholding Withholding tax for all investors (multiplied by 10**16)
     */
    function setWithholdingFixed(address[] _investors, uint256 _withholding) public withPerm(MANAGE) {emit __FunctionCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',7);

emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',100);
        emit __AssertPreCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',10);
emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',20);
require(_withholding <= 10**18, "Incorrect withholding tax");emit __AssertPostCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',10);

        /*solium-disable-next-line security/no-block-members*/
emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',102);
        emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',21);
emit SetWithholdingFixed(_investors, _withholding, now);
emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',103);
        emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',22);
for (uint256 i = 0; i < _investors.length; i++) {
emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',104);
            emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',23);
withholdingTax[_investors[i]] = _withholding;
        }
    }

    /**
     * @notice Issuer can push dividends to provided addresses
     * @param _dividendIndex Dividend to push
     * @param _payees Addresses to which to push the dividend
     */
    function pushDividendPaymentToAddresses(
        uint256 _dividendIndex,
        address[] _payees
    )
        public
        withPerm(DISTRIBUTE)
        validDividendIndex(_dividendIndex)
    {emit __FunctionCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',8);

emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',121);
        emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',24);
Dividend storage dividend = dividends[_dividendIndex];
emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',122);
        emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',25);
for (uint256 i = 0; i < _payees.length; i++) {
emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',123);
            emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',26);
if ((!dividend.claimed[_payees[i]]) && (!dividend.dividendExcluded[_payees[i]])) {emit __BranchCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',11,0);
emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',124);
                emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',27);
_payDividend(_payees[i], dividend, _dividendIndex);
            }else { emit __BranchCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',11,1);}

        }
    }

    /**
     * @notice Issuer can push dividends using the investor list from the security token
     * @param _dividendIndex Dividend to push
     * @param _start Index in investor list at which to start pushing dividends
     * @param _iterations Number of addresses to push dividends for
     */
    function pushDividendPayment(
        uint256 _dividendIndex,
        uint256 _start,
        uint256 _iterations
    )
        public
        withPerm(DISTRIBUTE)
        validDividendIndex(_dividendIndex)
    {emit __FunctionCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',9);

emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',144);
        emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',28);
Dividend storage dividend = dividends[_dividendIndex];
emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',145);
        emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',29);
uint256 checkpointId = dividend.checkpointId;
emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',146);
        emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',30);
address[] memory investors = ISecurityToken(securityToken).getInvestorsAt(checkpointId);
emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',147);
        emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',31);
uint256 numberInvestors = Math.min256(investors.length, _start.add(_iterations));
emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',148);
        emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',32);
for (uint256 i = _start; i < numberInvestors; i++) {
emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',149);
            emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',33);
address payee = investors[i];
emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',150);
            emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',34);
if ((!dividend.claimed[payee]) && (!dividend.dividendExcluded[payee])) {emit __BranchCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',12,0);
emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',151);
                emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',35);
_payDividend(payee, dividend, _dividendIndex);
            }else { emit __BranchCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',12,1);}

        }
    }

    /**
     * @notice Investors can pull their own dividends
     * @param _dividendIndex Dividend to pull
     */
    function pullDividendPayment(uint256 _dividendIndex) public validDividendIndex(_dividendIndex)
    {emit __FunctionCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',10);

emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',162);
        emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',36);
Dividend storage dividend = dividends[_dividendIndex];
emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',163);
        emit __AssertPreCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',13);
emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',37);
require(!dividend.claimed[msg.sender], "Dividend already claimed");emit __AssertPostCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',13);

emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',164);
        emit __AssertPreCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',14);
emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',38);
require(!dividend.dividendExcluded[msg.sender], "msg.sender excluded from Dividend");emit __AssertPostCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',14);

emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',165);
        emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',39);
_payDividend(msg.sender, dividend, _dividendIndex);
    }

    /**
     * @notice Internal function for paying dividends
     * @param _payee Address of investor
     * @param _dividend Storage with previously issued dividends
     * @param _dividendIndex Dividend to pay
     */
    function _payDividend(address _payee, Dividend storage _dividend, uint256 _dividendIndex) internal;

    /**
     * @notice Issuer can reclaim remaining unclaimed dividend amounts, for expired dividends
     * @param _dividendIndex Dividend to reclaim
     */
    function reclaimDividend(uint256 _dividendIndex) external;

    /**
     * @notice Calculate amount of dividends claimable
     * @param _dividendIndex Dividend to calculate
     * @param _payee Affected investor address
     * @return claim, withheld amounts
     */
    function calculateDividend(uint256 _dividendIndex, address _payee) public  returns(uint256, uint256) {emit __FunctionCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',11);

emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',189);
        emit __AssertPreCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',15);
emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',40);
require(_dividendIndex < dividends.length, "Invalid dividend");emit __AssertPostCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',15);

emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',190);
        emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',41);
Dividend storage dividend = dividends[_dividendIndex];
emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',191);
        emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',42);
if (dividend.claimed[_payee] || dividend.dividendExcluded[_payee]) {emit __BranchCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',16,0);
emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',192);
            emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',43);
return (0, 0);
        }else { emit __BranchCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',16,1);}

emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',194);
        emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',44);
uint256 balance = ISecurityToken(securityToken).balanceOfAt(_payee, dividend.checkpointId);
emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',195);
        emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',45);
uint256 claim = balance.mul(dividend.amount).div(dividend.totalSupply);
emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',196);
        emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',46);
uint256 withheld = claim.mul(withholdingTax[_payee]).div(uint256(10**18));
emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',197);
        emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',47);
return (claim, withheld);
    }

    /**
     * @notice Get the index according to the checkpoint id
     * @param _checkpointId Checkpoint id to query
     * @return uint256[]
     */
    function getDividendIndex(uint256 _checkpointId) public  returns(uint256[]) {emit __FunctionCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',12);

emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',206);
        emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',48);
uint256 counter = 0;
emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',207);
        emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',49);
for(uint256 i = 0; i < dividends.length; i++) {
emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',208);
            emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',50);
if (dividends[i].checkpointId == _checkpointId) {emit __BranchCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',17,0);
emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',209);
                counter++;
            }else { emit __BranchCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',17,1);}

        }

emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',213);
        emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',51);
uint256[] memory index = new uint256[](counter);
emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',214);
        emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',52);
counter = 0;
emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',215);
        emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',53);
for(uint256 j = 0; j < dividends.length; j++) {
emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',216);
            emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',54);
if (dividends[j].checkpointId == _checkpointId) {emit __BranchCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',18,0);
emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',217);
                emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',55);
index[counter] = j;
emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',218);
                counter++;
            }else { emit __BranchCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',18,1);}

        }
emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',221);
        emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',56);
return index;
    }

    /**
     * @notice Allows issuer to withdraw withheld tax
     * @param _dividendIndex Dividend to withdraw from
     */
    function withdrawWithholding(uint256 _dividendIndex) external;

    /**
     * @notice Get static dividend data
     * @return uint256[] timestamp of dividends creation
     * @return uint256[] timestamp of dividends maturity
     * @return uint256[] timestamp of dividends expiry
     * @return uint256[] amount of dividends
     * @return uint256[] claimed amount of dividends
     * @return bytes32[] name of dividends
     */
    function getDividendsData() external  returns (
        uint256[] memory createds,
        uint256[] memory maturitys,
        uint256[] memory expirys,
        uint256[] memory amounts,
        uint256[] memory claimedAmounts,
        bytes32[] memory names)
    {emit __FunctionCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',13);

emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',247);
        emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',57);
createds = new uint256[](dividends.length);
emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',248);
        emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',58);
maturitys = new uint256[](dividends.length);
emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',249);
        emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',59);
expirys = new uint256[](dividends.length);
emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',250);
        emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',60);
amounts = new uint256[](dividends.length);
emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',251);
        emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',61);
claimedAmounts = new uint256[](dividends.length);
emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',252);
        emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',62);
names = new bytes32[](dividends.length);
emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',253);
        emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',63);
for (uint256 i = 0; i < dividends.length; i++) {
emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',254);
            emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',64);
(createds[i], maturitys[i], expirys[i], amounts[i], claimedAmounts[i], names[i]) = getDividendData(i);
        }
    }

    /**
     * @notice Get static dividend data
     * @return uint256 timestamp of dividend creation
     * @return uint256 timestamp of dividend maturity
     * @return uint256 timestamp of dividend expiry
     * @return uint256 amount of dividend
     * @return uint256 claimed amount of dividend
     * @return bytes32 name of dividend
     */
    function getDividendData(uint256 _dividendIndex) public  returns (
        uint256 created,
        uint256 maturity,
        uint256 expiry,
        uint256 amount,
        uint256 claimedAmount,
        bytes32 name)
    {emit __FunctionCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',14);

emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',275);
        emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',65);
created = dividends[_dividendIndex].created;
emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',276);
        emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',66);
maturity = dividends[_dividendIndex].maturity;
emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',277);
        emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',67);
expiry = dividends[_dividendIndex].expiry;
emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',278);
        emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',68);
amount = dividends[_dividendIndex].amount;
emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',279);
        emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',69);
claimedAmount = dividends[_dividendIndex].claimedAmount;
emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',280);
        emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',70);
name = dividends[_dividendIndex].name;
    }

    /**
     * @notice Retrieves list of investors, their claim status and whether they are excluded
     * @param _dividendIndex Dividend to withdraw from
     * @return address[] list of investors
     * @return bool[] whether investor has claimed
     * @return bool[] whether investor is excluded
     * @return uint256[] amount of withheld tax
     * @return uint256[] investor balance
     * @return uint256[] amount to be claimed including withheld tax
     */
    function getDividendProgress(uint256 _dividendIndex) external  returns (
        address[] memory investors,
        bool[] memory resultClaimed,
        bool[] memory resultExcluded,
        uint256[] memory resultWithheld,
        uint256[] memory resultBalance,
        uint256[] memory resultAmount)
    {emit __FunctionCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',15);

emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',301);
        emit __AssertPreCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',19);
emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',71);
require(_dividendIndex < dividends.length, "Invalid dividend");emit __AssertPostCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',19);

        //Get list of Investors
emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',303);
        emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',72);
Dividend storage dividend = dividends[_dividendIndex];
emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',304);
        emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',73);
uint256 checkpointId = dividend.checkpointId;
emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',305);
        emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',74);
investors = ISecurityToken(securityToken).getInvestorsAt(checkpointId);
emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',306);
        emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',75);
resultClaimed = new bool[](investors.length);
emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',307);
        emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',76);
resultExcluded = new bool[](investors.length);
emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',308);
        emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',77);
resultWithheld = new uint256[](investors.length);
emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',309);
        emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',78);
resultBalance = new uint256[](investors.length);
emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',310);
        emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',79);
resultAmount = new uint256[](investors.length);
emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',311);
        emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',80);
for (uint256 i; i < investors.length; i++) {
emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',312);
            emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',81);
resultClaimed[i] = dividend.claimed[investors[i]];
emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',313);
            emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',82);
resultExcluded[i] = dividend.dividendExcluded[investors[i]];
emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',314);
            emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',83);
resultBalance[i] = ISecurityToken(securityToken).balanceOfAt(investors[i], dividend.checkpointId);
emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',315);
            emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',84);
if (!resultExcluded[i]) {emit __BranchCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',20,0);
emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',316);
                emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',85);
resultWithheld[i] = dividend.withheld[investors[i]];
emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',317);
                emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',86);
resultAmount[i] = resultBalance[i].mul(dividend.amount).div(dividend.totalSupply);
            }else { emit __BranchCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',20,1);}

        }
    }

    /**
     * @notice Retrieves list of investors, their balances, and their current withholding tax percentage
     * @param _checkpointId Checkpoint Id to query for
     * @return address[] list of investors
     * @return uint256[] investor balances
     * @return uint256[] investor withheld percentages
     */
    function getCheckpointData(uint256 _checkpointId) external  returns (address[] memory investors, uint256[] memory balances, uint256[] memory withholdings) {emit __FunctionCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',16);

emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',330);
        emit __AssertPreCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',21);
emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',87);
require(_checkpointId <= ISecurityToken(securityToken).currentCheckpointId(), "Invalid checkpoint");emit __AssertPostCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',21);

emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',331);
        emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',88);
investors = ISecurityToken(securityToken).getInvestorsAt(_checkpointId);
emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',332);
        emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',89);
balances = new uint256[](investors.length);
emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',333);
        emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',90);
withholdings = new uint256[](investors.length);
emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',334);
        emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',91);
for (uint256 i; i < investors.length; i++) {
emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',335);
            emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',92);
balances[i] = ISecurityToken(securityToken).balanceOfAt(investors[i], _checkpointId);
emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',336);
            emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',93);
withholdings[i] = withholdingTax[investors[i]];
        }
    }

    /**
     * @notice Checks whether an address is excluded from claiming a dividend
     * @param _dividendIndex Dividend to withdraw from
     * @return bool whether the address is excluded
     */
    function isExcluded(address _investor, uint256 _dividendIndex) external  returns (bool) {emit __FunctionCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',17);

emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',346);
        emit __AssertPreCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',22);
emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',94);
require(_dividendIndex < dividends.length, "Invalid dividend");emit __AssertPostCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',22);

emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',347);
        emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',95);
return dividends[_dividendIndex].dividendExcluded[_investor];
    }

    /**
     * @notice Checks whether an address has claimed a dividend
     * @param _dividendIndex Dividend to withdraw from
     * @return bool whether the address has claimed
     */
    function isClaimed(address _investor, uint256 _dividendIndex) external  returns (bool) {emit __FunctionCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',18);

emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',356);
        emit __AssertPreCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',23);
emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',96);
require(_dividendIndex < dividends.length, "Invalid dividend");emit __AssertPostCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',23);

emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',357);
        emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',97);
return dividends[_dividendIndex].claimed[_investor];
    }

    /**
     * @notice Return the permissions flag that are associated with this module
     * @return bytes32 array
     */
    function getPermissions() public  returns(bytes32[]) {emit __FunctionCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',19);

emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',365);
        emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',98);
bytes32[] memory allPermissions = new bytes32[](2);
emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',366);
        emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',99);
allPermissions[0] = DISTRIBUTE;
emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',367);
        emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',100);
allPermissions[1] = MANAGE;
emit __CoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',368);
        emit __StatementCoverageDividendCheckpoint('./contracts/modules/Checkpoint/DividendCheckpoint.sol',101);
return allPermissions;
    }

}
