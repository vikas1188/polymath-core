pragma solidity ^0.4.24;

import "./DividendCheckpoint.sol";
import "../../interfaces/IOwnable.sol";

/**
 * @title Checkpoint module for issuing ether dividends
 */
contract EtherDividendCheckpoint is DividendCheckpoint {event __CoverageEtherDividendCheckpoint(string fileName, uint256 lineNumber);
event __FunctionCoverageEtherDividendCheckpoint(string fileName, uint256 fnId);
event __StatementCoverageEtherDividendCheckpoint(string fileName, uint256 statementId);
event __BranchCoverageEtherDividendCheckpoint(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageEtherDividendCheckpoint(string fileName, uint256 branchId);
event __AssertPostCoverageEtherDividendCheckpoint(string fileName, uint256 branchId);

    using SafeMath for uint256;

    event EtherDividendDeposited(
        address indexed _depositor,
        uint256 _checkpointId,
        uint256 _created,
        uint256 _maturity,
        uint256 _expiry,
        uint256 _amount,
        uint256 _totalSupply,
        uint256 indexed _dividendIndex,
        bytes32 indexed _name
    );
    event EtherDividendClaimed(address indexed _payee, uint256 indexed _dividendIndex, uint256 _amount, uint256 _withheld);
    event EtherDividendReclaimed(address indexed _claimer, uint256 indexed _dividendIndex, uint256 _claimedAmount);
    event EtherDividendClaimFailed(address indexed _payee, uint256 indexed _dividendIndex, uint256 _amount, uint256 _withheld);
    event EtherDividendWithholdingWithdrawn(address indexed _claimer, uint256 indexed _dividendIndex, uint256 _withheldAmount);

    /**
     * @notice Constructor
     * @param _securityToken Address of the security token
     * @param _polyAddress Address of the polytoken
     */
    constructor (address _securityToken, address _polyAddress) public
    Module(_securityToken, _polyAddress)
    {emit __FunctionCoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',1);

    }

    /**
     * @notice Creates a dividend and checkpoint for the dividend, using global list of excluded addresses
     * @param _maturity Time from which dividend can be paid
     * @param _expiry Time until dividend can no longer be paid, and can be reclaimed by issuer
     * @param _name Name/title for identification
     */
    function createDividend(uint256 _maturity, uint256 _expiry, bytes32 _name) external payable withPerm(MANAGE) {emit __FunctionCoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',2);

emit __CoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',45);
        emit __StatementCoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',1);
createDividendWithExclusions(_maturity, _expiry, excluded, _name);
    }

    /**
     * @notice Creates a dividend with a provided checkpoint, using global list of excluded addresses
     * @param _maturity Time from which dividend can be paid
     * @param _expiry Time until dividend can no longer be paid, and can be reclaimed by issuer
     * @param _checkpointId Id of the checkpoint from which to issue dividend
     * @param _name Name/title for identification
     */
    function createDividendWithCheckpoint(
        uint256 _maturity,
        uint256 _expiry,
        uint256 _checkpointId,
        bytes32 _name
    )
        external
        payable
        withPerm(MANAGE)
    {emit __FunctionCoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',3);

emit __CoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',65);
        emit __StatementCoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',2);
_createDividendWithCheckpointAndExclusions(_maturity, _expiry, _checkpointId, excluded, _name);
    }

    /**
     * @notice Creates a dividend and checkpoint for the dividend, specifying explicit excluded addresses
     * @param _maturity Time from which dividend can be paid
     * @param _expiry Time until dividend can no longer be paid, and can be reclaimed by issuer
     * @param _excluded List of addresses to exclude
     * @param _name Name/title for identification
     */
    function createDividendWithExclusions(
        uint256 _maturity,
        uint256 _expiry,
        address[] _excluded,
        bytes32 _name
    )
        public
        payable
        withPerm(MANAGE)
    {emit __FunctionCoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',4);

emit __CoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',85);
        emit __StatementCoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',3);
uint256 checkpointId = ISecurityToken(securityToken).createCheckpoint();
emit __CoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',86);
        emit __StatementCoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',4);
_createDividendWithCheckpointAndExclusions(_maturity, _expiry, checkpointId, _excluded, _name);
    }

    /**
     * @notice Creates a dividend with a provided checkpoint, specifying explicit excluded addresses
     * @param _maturity Time from which dividend can be paid
     * @param _expiry Time until dividend can no longer be paid, and can be reclaimed by issuer
     * @param _checkpointId Id of the checkpoint from which to issue dividend
     * @param _excluded List of addresses to exclude
     * @param _name Name/title for identification
     */
    function createDividendWithCheckpointAndExclusions(
        uint256 _maturity,
        uint256 _expiry,
        uint256 _checkpointId,
        address[] _excluded,
        bytes32 _name
    )
        public
        payable
        withPerm(MANAGE)
    {emit __FunctionCoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',5);

emit __CoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',108);
        emit __StatementCoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',5);
_createDividendWithCheckpointAndExclusions(_maturity, _expiry, _checkpointId, _excluded, _name);
    }

    /**
     * @notice Creates a dividend with a provided checkpoint, specifying explicit excluded addresses
     * @param _maturity Time from which dividend can be paid
     * @param _expiry Time until dividend can no longer be paid, and can be reclaimed by issuer
     * @param _checkpointId Id of the checkpoint from which to issue dividend
     * @param _excluded List of addresses to exclude
     * @param _name Name/title for identification
     */
    function _createDividendWithCheckpointAndExclusions(
        uint256 _maturity,
        uint256 _expiry,
        uint256 _checkpointId,
        address[] _excluded,
        bytes32 _name
    )
        internal
    {emit __FunctionCoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',6);

emit __CoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',128);
        emit __AssertPreCoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',1);
emit __StatementCoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',6);
require(_excluded.length <= EXCLUDED_ADDRESS_LIMIT, "Too many addresses excluded");emit __AssertPostCoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',1);

emit __CoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',129);
        emit __AssertPreCoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',2);
emit __StatementCoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',7);
require(_expiry > _maturity, "Expiry is before maturity");emit __AssertPostCoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',2);

        /*solium-disable-next-line security/no-block-members*/
emit __CoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',131);
        emit __AssertPreCoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',3);
emit __StatementCoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',8);
require(_expiry > now, "Expiry is in the past");emit __AssertPostCoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',3);

emit __CoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',132);
        emit __AssertPreCoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',4);
emit __StatementCoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',9);
require(msg.value > 0, "No dividend sent");emit __AssertPostCoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',4);

emit __CoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',133);
        emit __AssertPreCoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',5);
emit __StatementCoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',10);
require(_checkpointId <= ISecurityToken(securityToken).currentCheckpointId());emit __AssertPostCoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',5);

emit __CoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',134);
        emit __AssertPreCoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',6);
emit __StatementCoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',11);
require(_name[0] != 0);emit __AssertPostCoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',6);

emit __CoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',135);
        emit __StatementCoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',12);
uint256 dividendIndex = dividends.length;
emit __CoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',136);
        emit __StatementCoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',13);
uint256 currentSupply = ISecurityToken(securityToken).totalSupplyAt(_checkpointId);
emit __CoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',137);
        emit __StatementCoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',14);
uint256 excludedSupply = 0;
emit __CoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',138);
        dividends.push(
          Dividend(
            _checkpointId,
            now, /*solium-disable-line security/no-block-members*/
            _maturity,
            _expiry,
            msg.value,
            0,
            0,
            false,
            0,
            0,
            _name
          )
        );

emit __CoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',154);
        emit __StatementCoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',15);
for (uint256 j = 0; j < _excluded.length; j++) {
emit __CoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',155);
            emit __AssertPreCoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',7);
emit __StatementCoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',16);
require (_excluded[j] != address(0), "Invalid address");emit __AssertPostCoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',7);

emit __CoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',156);
            emit __AssertPreCoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',8);
emit __StatementCoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',17);
require(!dividends[dividendIndex].dividendExcluded[_excluded[j]], "duped exclude address");emit __AssertPostCoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',8);

emit __CoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',157);
            emit __StatementCoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',18);
excludedSupply = excludedSupply.add(ISecurityToken(securityToken).balanceOfAt(_excluded[j], _checkpointId));
emit __CoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',158);
            emit __StatementCoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',19);
dividends[dividendIndex].dividendExcluded[_excluded[j]] = true;
        }
emit __CoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',160);
        emit __StatementCoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',20);
dividends[dividendIndex].totalSupply = currentSupply.sub(excludedSupply);
        /*solium-disable-next-line security/no-block-members*/
emit __CoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',162);
        emit __StatementCoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',21);
emit EtherDividendDeposited(msg.sender, _checkpointId, now, _maturity, _expiry, msg.value, currentSupply, dividendIndex, _name);
    }

    /**
     * @notice Internal function for paying dividends
     * @param _payee address of investor
     * @param _dividend storage with previously issued dividends
     * @param _dividendIndex Dividend to pay
     */
    function _payDividend(address _payee, Dividend storage _dividend, uint256 _dividendIndex) internal {emit __FunctionCoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',7);

emit __CoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',172);
        emit __StatementCoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',22);
(uint256 claim, uint256 withheld) = calculateDividend(_dividendIndex, _payee);
emit __CoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',173);
        emit __StatementCoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',23);
_dividend.claimed[_payee] = true;
emit __CoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',174);
        emit __StatementCoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',24);
uint256 claimAfterWithheld = claim.sub(withheld);
emit __CoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',175);
        emit __StatementCoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',25);
if (claimAfterWithheld > 0) {emit __BranchCoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',9,0);
            /*solium-disable-next-line security/no-send*/
emit __CoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',177);
            emit __StatementCoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',26);
if (_payee.send(claimAfterWithheld)) {emit __BranchCoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',10,0);
emit __CoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',178);
                emit __StatementCoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',27);
_dividend.claimedAmount = _dividend.claimedAmount.add(claim);
emit __CoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',179);
                emit __StatementCoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',28);
if (withheld > 0) {emit __BranchCoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',11,0);
emit __CoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',180);
                    emit __StatementCoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',29);
_dividend.totalWithheld = _dividend.totalWithheld.add(withheld);
emit __CoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',181);
                    emit __StatementCoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',30);
_dividend.withheld[_payee] = withheld;
                }else { emit __BranchCoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',11,1);}

emit __CoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',183);
                emit __StatementCoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',31);
emit EtherDividendClaimed(_payee, _dividendIndex, claim, withheld);
            } else {emit __BranchCoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',10,1);
emit __CoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',185);
                emit __StatementCoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',32);
_dividend.claimed[_payee] = false;
emit __CoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',186);
                emit __StatementCoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',33);
emit EtherDividendClaimFailed(_payee, _dividendIndex, claim, withheld);
            }
        }else { emit __BranchCoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',9,1);}

    }

    /**
     * @notice Issuer can reclaim remaining unclaimed dividend amounts, for expired dividends
     * @param _dividendIndex Dividend to reclaim
     */
    function reclaimDividend(uint256 _dividendIndex) external withPerm(MANAGE) {emit __FunctionCoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',8);

emit __CoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',196);
        emit __AssertPreCoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',12);
emit __StatementCoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',34);
require(_dividendIndex < dividends.length, "Incorrect dividend index");emit __AssertPostCoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',12);

        /*solium-disable-next-line security/no-block-members*/
emit __CoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',198);
        emit __AssertPreCoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',13);
emit __StatementCoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',35);
require(now >= dividends[_dividendIndex].expiry, "Dividend expiry is in the future");emit __AssertPostCoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',13);

emit __CoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',199);
        emit __AssertPreCoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',14);
emit __StatementCoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',36);
require(!dividends[_dividendIndex].reclaimed, "Dividend is already claimed");emit __AssertPostCoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',14);

emit __CoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',200);
        emit __StatementCoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',37);
Dividend storage dividend = dividends[_dividendIndex];
emit __CoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',201);
        emit __StatementCoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',38);
dividend.reclaimed = true;
emit __CoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',202);
        emit __StatementCoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',39);
uint256 remainingAmount = dividend.amount.sub(dividend.claimedAmount);
emit __CoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',203);
        emit __StatementCoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',40);
address owner = IOwnable(securityToken).owner();
emit __CoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',204);
        owner.transfer(remainingAmount);
emit __CoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',205);
        emit __StatementCoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',41);
emit EtherDividendReclaimed(owner, _dividendIndex, remainingAmount);
    }

    /**
     * @notice Allows issuer to withdraw withheld tax
     * @param _dividendIndex Dividend to withdraw from
     */
    function withdrawWithholding(uint256 _dividendIndex) external withPerm(MANAGE) {emit __FunctionCoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',9);

emit __CoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',213);
        emit __AssertPreCoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',15);
emit __StatementCoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',42);
require(_dividendIndex < dividends.length, "Incorrect dividend index");emit __AssertPostCoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',15);

emit __CoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',214);
        emit __StatementCoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',43);
Dividend storage dividend = dividends[_dividendIndex];
emit __CoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',215);
        emit __StatementCoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',44);
uint256 remainingWithheld = dividend.totalWithheld.sub(dividend.totalWithheldWithdrawn);
emit __CoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',216);
        emit __StatementCoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',45);
dividend.totalWithheldWithdrawn = dividend.totalWithheld;
emit __CoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',217);
        emit __StatementCoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',46);
address owner = IOwnable(securityToken).owner();
emit __CoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',218);
        owner.transfer(remainingWithheld);
emit __CoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',219);
        emit __StatementCoverageEtherDividendCheckpoint('./contracts/modules/Checkpoint/EtherDividendCheckpoint.sol',47);
emit EtherDividendWithholdingWithdrawn(owner, _dividendIndex, remainingWithheld);
    }

}
