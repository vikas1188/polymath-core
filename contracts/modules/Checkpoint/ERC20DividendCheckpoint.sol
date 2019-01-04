pragma solidity ^0.4.24;

import "./DividendCheckpoint.sol";
import "./ERC20DividendCheckpointStorage.sol";
import "../../interfaces/IOwnable.sol";
import "../../interfaces/IERC20.sol";

/**
 * @title Checkpoint module for issuing ERC20 dividends
 */
contract ERC20DividendCheckpoint is ERC20DividendCheckpointStorage, DividendCheckpoint {event __CoverageERC20DividendCheckpoint(string fileName, uint256 lineNumber);
event __FunctionCoverageERC20DividendCheckpoint(string fileName, uint256 fnId);
event __StatementCoverageERC20DividendCheckpoint(string fileName, uint256 statementId);
event __BranchCoverageERC20DividendCheckpoint(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageERC20DividendCheckpoint(string fileName, uint256 branchId);
event __AssertPostCoverageERC20DividendCheckpoint(string fileName, uint256 branchId);

    using SafeMath for uint256;

    event ERC20DividendDeposited(
        address indexed _depositor,
        uint256 _checkpointId,
        uint256 _created,
        uint256 _maturity,
        uint256 _expiry,
        address indexed _token,
        uint256 _amount,
        uint256 _totalSupply,
        uint256 _dividendIndex,
        bytes32 indexed _name
    );
    event ERC20DividendClaimed(
        address indexed _payee,
        uint256 indexed _dividendIndex,
        address indexed _token,
        uint256 _amount,
        uint256 _withheld
    );
    event ERC20DividendReclaimed(
        address indexed _claimer,
        uint256 indexed _dividendIndex,
        address indexed _token,
        uint256 _claimedAmount
    );
    event ERC20DividendWithholdingWithdrawn(
        address indexed _claimer,
        uint256 indexed _dividendIndex,
        address indexed _token,
        uint256 _withheldAmount
    );

    /**
     * @notice Constructor
     * @param _securityToken Address of the security token
     * @param _polyAddress Address of the polytoken
     */
    constructor (address _securityToken, address _polyAddress) public
    Module(_securityToken, _polyAddress)
    {emit __FunctionCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',1);

    }

    /**
     * @notice Creates a dividend and checkpoint for the dividend
     * @param _maturity Time from which dividend can be paid
     * @param _expiry Time until dividend can no longer be paid, and can be reclaimed by issuer
     * @param _token Address of ERC20 token in which dividend is to be denominated
     * @param _amount Amount of specified token for dividend
     * @param _name Name/Title for identification
     */
    function createDividend(
        uint256 _maturity,
        uint256 _expiry,
        address _token,
        uint256 _amount,
        bytes32 _name
    )
        external
        withPerm(MANAGE)
    {emit __FunctionCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',2);

emit __CoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',74);
        emit __StatementCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',1);
createDividendWithExclusions(_maturity, _expiry, _token, _amount, excluded, _name);
    }

    /**
     * @notice Creates a dividend with a provided checkpoint
     * @param _maturity Time from which dividend can be paid
     * @param _expiry Time until dividend can no longer be paid, and can be reclaimed by issuer
     * @param _token Address of ERC20 token in which dividend is to be denominated
     * @param _amount Amount of specified token for dividend
     * @param _checkpointId Checkpoint id from which to create dividends
     * @param _name Name/Title for identification
     */
    function createDividendWithCheckpoint(
        uint256 _maturity,
        uint256 _expiry,
        address _token,
        uint256 _amount,
        uint256 _checkpointId,
        bytes32 _name
    )
        external
        withPerm(MANAGE)
    {emit __FunctionCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',3);

emit __CoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',97);
        emit __StatementCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',2);
_createDividendWithCheckpointAndExclusions(_maturity, _expiry, _token, _amount, _checkpointId, excluded, _name);
    }

    /**
     * @notice Creates a dividend and checkpoint for the dividend
     * @param _maturity Time from which dividend can be paid
     * @param _expiry Time until dividend can no longer be paid, and can be reclaimed by issuer
     * @param _token Address of ERC20 token in which dividend is to be denominated
     * @param _amount Amount of specified token for dividend
     * @param _excluded List of addresses to exclude
     * @param _name Name/Title for identification
     */
    function createDividendWithExclusions(
        uint256 _maturity,
        uint256 _expiry,
        address _token,
        uint256 _amount,
        address[] _excluded,
        bytes32 _name
    )
        public
        withPerm(MANAGE)
    {emit __FunctionCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',4);

emit __CoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',120);
        emit __StatementCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',3);
uint256 checkpointId = ISecurityToken(securityToken).createCheckpoint();
emit __CoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',121);
        emit __StatementCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',4);
_createDividendWithCheckpointAndExclusions(_maturity, _expiry, _token, _amount, checkpointId, _excluded, _name);
    }

    /**
     * @notice Creates a dividend with a provided checkpoint
     * @param _maturity Time from which dividend can be paid
     * @param _expiry Time until dividend can no longer be paid, and can be reclaimed by issuer
     * @param _token Address of ERC20 token in which dividend is to be denominated
     * @param _amount Amount of specified token for dividend
     * @param _checkpointId Checkpoint id from which to create dividends
     * @param _excluded List of addresses to exclude
     * @param _name Name/Title for identification
     */
    function createDividendWithCheckpointAndExclusions(
        uint256 _maturity,
        uint256 _expiry,
        address _token,
        uint256 _amount,
        uint256 _checkpointId,
        address[] _excluded,
        bytes32 _name
    )
        public
        withPerm(MANAGE)
    {emit __FunctionCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',5);

emit __CoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',146);
        emit __StatementCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',5);
_createDividendWithCheckpointAndExclusions(_maturity, _expiry, _token, _amount, _checkpointId, _excluded, _name);
    }

    /**
     * @notice Creates a dividend with a provided checkpoint
     * @param _maturity Time from which dividend can be paid
     * @param _expiry Time until dividend can no longer be paid, and can be reclaimed by issuer
     * @param _token Address of ERC20 token in which dividend is to be denominated
     * @param _amount Amount of specified token for dividend
     * @param _checkpointId Checkpoint id from which to create dividends
     * @param _excluded List of addresses to exclude
     * @param _name Name/Title for identification
     */
    function _createDividendWithCheckpointAndExclusions(
        uint256 _maturity,
        uint256 _expiry,
        address _token,
        uint256 _amount,
        uint256 _checkpointId,
        address[] _excluded,
        bytes32 _name
    )
        internal
    {emit __FunctionCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',6);

emit __CoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',170);
        emit __StatementCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',6);
ISecurityToken securityTokenInstance = ISecurityToken(securityToken);
emit __CoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',171);
        emit __AssertPreCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',1);
emit __StatementCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',7);
require(_excluded.length <= EXCLUDED_ADDRESS_LIMIT, "Too many addresses excluded");emit __AssertPostCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',1);

emit __CoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',172);
        emit __AssertPreCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',2);
emit __StatementCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',8);
require(_expiry > _maturity, "Expiry before maturity");emit __AssertPostCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',2);

        /*solium-disable-next-line security/no-block-members*/
emit __CoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',174);
        emit __AssertPreCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',3);
emit __StatementCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',9);
require(_expiry > now, "Expiry in past");emit __AssertPostCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',3);

emit __CoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',175);
        emit __AssertPreCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',4);
emit __StatementCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',10);
require(_amount > 0, "No dividend sent");emit __AssertPostCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',4);

emit __CoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',176);
        emit __AssertPreCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',5);
emit __StatementCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',11);
require(_token != address(0), "Invalid token");emit __AssertPostCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',5);

emit __CoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',177);
        emit __AssertPreCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',6);
emit __StatementCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',12);
require(_checkpointId <= securityTokenInstance.currentCheckpointId(), "Invalid checkpoint");emit __AssertPostCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',6);

emit __CoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',178);
        emit __AssertPreCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',7);
emit __StatementCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',13);
require(IERC20(_token).transferFrom(msg.sender, address(this), _amount), "insufficent allowance");emit __AssertPostCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',7);

emit __CoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',179);
        emit __AssertPreCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',8);
emit __StatementCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',14);
require(_name[0] != 0);emit __AssertPostCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',8);

emit __CoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',180);
        emit __StatementCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',15);
uint256 dividendIndex = dividends.length;
emit __CoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',181);
        emit __StatementCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',16);
uint256 currentSupply = securityTokenInstance.totalSupplyAt(_checkpointId);
emit __CoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',182);
        emit __StatementCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',17);
uint256 excludedSupply = 0;
emit __CoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',183);
        dividends.push(
          Dividend(
            _checkpointId,
            now, /*solium-disable-line security/no-block-members*/
            _maturity,
            _expiry,
            _amount,
            0,
            0,
            false,
            0,
            0,
            _name
          )
        );

emit __CoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',199);
        emit __StatementCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',18);
for (uint256 j = 0; j < _excluded.length; j++) {
emit __CoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',200);
            emit __AssertPreCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',9);
emit __StatementCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',19);
require (_excluded[j] != address(0), "Invalid address");emit __AssertPostCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',9);

emit __CoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',201);
            emit __AssertPreCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',10);
emit __StatementCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',20);
require(!dividends[dividendIndex].dividendExcluded[_excluded[j]], "duped exclude address");emit __AssertPostCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',10);

emit __CoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',202);
            emit __StatementCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',21);
excludedSupply = excludedSupply.add(securityTokenInstance.balanceOfAt(_excluded[j], _checkpointId));
emit __CoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',203);
            emit __StatementCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',22);
dividends[dividendIndex].dividendExcluded[_excluded[j]] = true;
        }

emit __CoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',206);
        emit __StatementCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',23);
dividends[dividendIndex].totalSupply = currentSupply.sub(excludedSupply);
emit __CoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',207);
        emit __StatementCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',24);
dividendTokens[dividendIndex] = _token;
emit __CoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',208);
        emit __StatementCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',25);
_emitERC20DividendDepositedEvent(_checkpointId, _maturity, _expiry, _token, _amount, currentSupply, dividendIndex, _name);
    }

    /**
     * @notice Emits the ERC20DividendDeposited event.
     * Seperated into a different function as a workaround for stack too deep error
     */
    function _emitERC20DividendDepositedEvent(
        uint256 _checkpointId,
        uint256 _maturity,
        uint256 _expiry,
        address _token,
        uint256 _amount,
        uint256 currentSupply,
        uint256 dividendIndex,
        bytes32 _name
    )
        internal
    {emit __FunctionCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',7);

        /*solium-disable-next-line security/no-block-members*/
emit __CoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',228);
        emit __StatementCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',26);
emit ERC20DividendDeposited(msg.sender, _checkpointId, now, _maturity, _expiry, _token, _amount, currentSupply, dividendIndex, _name);
    }

    /**
     * @notice Internal function for paying dividends
     * @param _payee Address of investor
     * @param _dividend Storage with previously issued dividends
     * @param _dividendIndex Dividend to pay
     */
    function _payDividend(address _payee, Dividend storage _dividend, uint256 _dividendIndex) internal {emit __FunctionCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',8);

emit __CoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',238);
        emit __StatementCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',27);
(uint256 claim, uint256 withheld) = calculateDividend(_dividendIndex, _payee);
emit __CoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',239);
        emit __StatementCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',28);
_dividend.claimed[_payee] = true;
emit __CoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',240);
        emit __StatementCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',29);
_dividend.claimedAmount = claim.add(_dividend.claimedAmount);
emit __CoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',241);
        emit __StatementCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',30);
uint256 claimAfterWithheld = claim.sub(withheld);
emit __CoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',242);
        emit __StatementCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',31);
if (claimAfterWithheld > 0) {emit __BranchCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',11,0);
emit __CoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',243);
            emit __AssertPreCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',12);
emit __StatementCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',32);
require(IERC20(dividendTokens[_dividendIndex]).transfer(_payee, claimAfterWithheld), "transfer failed");emit __AssertPostCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',12);

emit __CoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',244);
            emit __StatementCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',33);
if (withheld > 0) {emit __BranchCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',13,0);
emit __CoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',245);
                emit __StatementCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',34);
_dividend.totalWithheld = _dividend.totalWithheld.add(withheld);
emit __CoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',246);
                emit __StatementCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',35);
_dividend.withheld[_payee] = withheld;
            }else { emit __BranchCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',13,1);}

emit __CoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',248);
            emit __StatementCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',36);
emit ERC20DividendClaimed(_payee, _dividendIndex, dividendTokens[_dividendIndex], claim, withheld);
        }else { emit __BranchCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',11,1);}

    }

    /**
     * @notice Issuer can reclaim remaining unclaimed dividend amounts, for expired dividends
     * @param _dividendIndex Dividend to reclaim
     */
    function reclaimDividend(uint256 _dividendIndex) external withPerm(MANAGE) {emit __FunctionCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',9);

emit __CoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',257);
        emit __AssertPreCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',14);
emit __StatementCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',37);
require(_dividendIndex < dividends.length, "Invalid dividend");emit __AssertPostCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',14);

        /*solium-disable-next-line security/no-block-members*/
emit __CoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',259);
        emit __AssertPreCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',15);
emit __StatementCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',38);
require(now >= dividends[_dividendIndex].expiry, "Dividend expiry in future");emit __AssertPostCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',15);

emit __CoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',260);
        emit __AssertPreCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',16);
emit __StatementCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',39);
require(!dividends[_dividendIndex].reclaimed, "already claimed");emit __AssertPostCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',16);

emit __CoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',261);
        emit __StatementCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',40);
dividends[_dividendIndex].reclaimed = true;
emit __CoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',262);
        emit __StatementCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',41);
Dividend storage dividend = dividends[_dividendIndex];
emit __CoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',263);
        emit __StatementCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',42);
uint256 remainingAmount = dividend.amount.sub(dividend.claimedAmount);
emit __CoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',264);
        emit __StatementCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',43);
address owner = IOwnable(securityToken).owner();
emit __CoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',265);
        emit __AssertPreCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',17);
emit __StatementCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',44);
require(IERC20(dividendTokens[_dividendIndex]).transfer(owner, remainingAmount), "transfer failed");emit __AssertPostCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',17);

emit __CoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',266);
        emit __StatementCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',45);
emit ERC20DividendReclaimed(owner, _dividendIndex, dividendTokens[_dividendIndex], remainingAmount);
    }

    /**
     * @notice Allows issuer to withdraw withheld tax
     * @param _dividendIndex Dividend to withdraw from
     */
    function withdrawWithholding(uint256 _dividendIndex) external withPerm(MANAGE) {emit __FunctionCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',10);

emit __CoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',274);
        emit __AssertPreCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',18);
emit __StatementCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',46);
require(_dividendIndex < dividends.length, "Invalid dividend");emit __AssertPostCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',18);

emit __CoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',275);
        emit __StatementCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',47);
Dividend storage dividend = dividends[_dividendIndex];
emit __CoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',276);
        emit __StatementCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',48);
uint256 remainingWithheld = dividend.totalWithheld.sub(dividend.totalWithheldWithdrawn);
emit __CoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',277);
        emit __StatementCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',49);
dividend.totalWithheldWithdrawn = dividend.totalWithheld;
emit __CoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',278);
        emit __StatementCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',50);
address owner = IOwnable(securityToken).owner();
emit __CoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',279);
        emit __AssertPreCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',19);
emit __StatementCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',51);
require(IERC20(dividendTokens[_dividendIndex]).transfer(owner, remainingWithheld), "transfer failed");emit __AssertPostCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',19);

emit __CoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',280);
        emit __StatementCoverageERC20DividendCheckpoint('./contracts/modules/Checkpoint/ERC20DividendCheckpoint.sol',52);
emit ERC20DividendWithholdingWithdrawn(owner, _dividendIndex, dividendTokens[_dividendIndex], remainingWithheld);
    }

}
