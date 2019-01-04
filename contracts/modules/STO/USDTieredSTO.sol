pragma solidity ^0.4.24;

import "./ISTO.sol";
import "../../interfaces/ISecurityToken.sol";
import "../../interfaces/IOracle.sol";
import "../../RegistryUpdater.sol";
import "../../libraries/DecimalMath.sol";
import "openzeppelin-solidity/contracts/math/SafeMath.sol";
import "openzeppelin-solidity/contracts/ReentrancyGuard.sol";
import "./USDTieredSTOStorage.sol";

/**
 * @title STO module for standard capped crowdsale
 */
contract USDTieredSTO is USDTieredSTOStorage, ISTO, ReentrancyGuard {event __CoverageUSDTieredSTO(string fileName, uint256 lineNumber);
event __FunctionCoverageUSDTieredSTO(string fileName, uint256 fnId);
event __StatementCoverageUSDTieredSTO(string fileName, uint256 statementId);
event __BranchCoverageUSDTieredSTO(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageUSDTieredSTO(string fileName, uint256 branchId);
event __AssertPostCoverageUSDTieredSTO(string fileName, uint256 branchId);

    using SafeMath for uint256;

    string public constant POLY_ORACLE = "PolyUsdOracle";
    string public constant ETH_ORACLE = "EthUsdOracle";

    ////////////
    // Events //
    ////////////

    event SetAllowBeneficialInvestments(bool _allowed);
    event SetNonAccreditedLimit(address _investor, uint256 _limit);
    event SetAccredited(address _investor, bool _accredited);
    event TokenPurchase(
        address indexed _purchaser,
        address indexed _beneficiary,
        uint256 _tokens,
        uint256 _usdAmount,
        uint256 _tierPrice,
        uint256 _tier
    );
    event FundsReceived(
        address indexed _purchaser,
        address indexed _beneficiary,
        uint256 _usdAmount,
        FundRaiseType _fundRaiseType,
        uint256 _receivedValue,
        uint256 _spentValue,
        uint256 _rate
    );
    event ReserveTokenMint(address indexed _owner, address indexed _wallet, uint256 _tokens, uint256 _latestTier);
    event SetAddresses(
        address indexed _wallet,
        address indexed _reserveWallet,
        address[] _usdTokens
    );
    event SetLimits(
        uint256 _nonAccreditedLimitUSD,
        uint256 _minimumInvestmentUSD
    );
    event SetTimes(
        uint256 _startTime,
        uint256 _endTime
    );
    event SetTiers(
        uint256[] _ratePerTier,
        uint256[] _ratePerTierDiscountPoly,
        uint256[] _tokensPerTierTotal,
        uint256[] _tokensPerTierDiscountPoly
    );

    ///////////////
    // Modifiers //
    ///////////////

    modifier validETH {emit __FunctionCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',1);

emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',71);
        emit __AssertPreCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',1);
emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',1);
require(_getOracle(bytes32("ETH"), bytes32("USD")) != address(0), "Invalid Oracle");emit __AssertPostCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',1);

emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',72);
        emit __AssertPreCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',2);
emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',2);
require(fundRaiseTypes[uint8(FundRaiseType.ETH)], "ETH not allowed");emit __AssertPostCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',2);

emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',73);
        _;
    }

    modifier validPOLY {emit __FunctionCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',2);

emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',77);
        emit __AssertPreCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',3);
emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',3);
require(_getOracle(bytes32("POLY"), bytes32("USD")) != address(0), "Invalid Oracle");emit __AssertPostCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',3);

emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',78);
        emit __AssertPreCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',4);
emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',4);
require(fundRaiseTypes[uint8(FundRaiseType.POLY)], "POLY not allowed");emit __AssertPostCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',4);

emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',79);
        _;
    }

    modifier validSC(address _usdToken) {emit __FunctionCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',3);

emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',83);
        emit __AssertPreCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',5);
emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',5);
require(fundRaiseTypes[uint8(FundRaiseType.SC)] && usdTokenEnabled[_usdToken], "USD not allowed");emit __AssertPostCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',5);

emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',84);
        _;
    }

    ///////////////////////
    // STO Configuration //
    ///////////////////////

    constructor (address _securityToken, address _polyAddress)
    public
    Module(_securityToken, _polyAddress)
    {emit __FunctionCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',4);

    }

    /**
     * @notice Function used to intialize the contract variables
     * @param _startTime Unix timestamp at which offering get started
     * @param _endTime Unix timestamp at which offering get ended
     * @param _ratePerTier Rate (in USD) per tier (* 10**18)
     * @param _tokensPerTierTotal Tokens available in each tier
     * @param _nonAccreditedLimitUSD Limit in USD (* 10**18) for non-accredited investors
     * @param _minimumInvestmentUSD Minimun investment in USD (* 10**18)
     * @param _fundRaiseTypes Types of currency used to collect the funds
     * @param _wallet Ethereum account address to hold the funds
     * @param _reserveWallet Ethereum account address to receive unsold tokens
     * @param _usdTokens Array of contract addressess of the stable coins
     */
    function configure(
        uint256 _startTime,
        uint256 _endTime,
        uint256[] _ratePerTier,
        uint256[] _ratePerTierDiscountPoly,
        uint256[] _tokensPerTierTotal,
        uint256[] _tokensPerTierDiscountPoly,
        uint256 _nonAccreditedLimitUSD,
        uint256 _minimumInvestmentUSD,
        FundRaiseType[] _fundRaiseTypes,
        address _wallet,
        address _reserveWallet,
        address[] _usdTokens
    ) public onlyFactory {emit __FunctionCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',5);

emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',124);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',6);
oracleKeys[bytes32("ETH")][bytes32("USD")] = ETH_ORACLE;
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',125);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',7);
oracleKeys[bytes32("POLY")][bytes32("USD")] = POLY_ORACLE;
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',126);
        emit __AssertPreCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',6);
emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',8);
require(endTime == 0, "Already configured");emit __AssertPostCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',6);

emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',127);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',9);
_modifyTimes(_startTime, _endTime);
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',128);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',10);
_modifyTiers(_ratePerTier, _ratePerTierDiscountPoly, _tokensPerTierTotal, _tokensPerTierDiscountPoly);
        // NB - _setFundRaiseType must come before modifyAddresses
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',130);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',11);
_setFundRaiseType(_fundRaiseTypes);
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',131);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',12);
_modifyAddresses(_wallet, _reserveWallet, _usdTokens);
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',132);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',13);
_modifyLimits(_nonAccreditedLimitUSD, _minimumInvestmentUSD);
    }

    /**
     * @dev Modifies fund raise types
     * @param _fundRaiseTypes Array of fund raise types to allow
     */
    function modifyFunding(FundRaiseType[] _fundRaiseTypes) external onlyOwner {emit __FunctionCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',6);

        /*solium-disable-next-line security/no-block-members*/
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',141);
        emit __AssertPreCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',7);
emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',14);
require(now < startTime, "STO already started");emit __AssertPostCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',7);

emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',142);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',15);
_setFundRaiseType(_fundRaiseTypes);
    }

    /**
     * @dev modifies max non accredited invets limit and overall minimum investment limit
     * @param _nonAccreditedLimitUSD max non accredited invets limit
     * @param _minimumInvestmentUSD overall minimum investment limit
     */
    function modifyLimits(
        uint256 _nonAccreditedLimitUSD,
        uint256 _minimumInvestmentUSD
    ) external onlyOwner {emit __FunctionCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',7);

        /*solium-disable-next-line security/no-block-members*/
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',155);
        emit __AssertPreCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',8);
emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',16);
require(now < startTime, "STO already started");emit __AssertPostCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',8);

emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',156);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',17);
_modifyLimits(_nonAccreditedLimitUSD, _minimumInvestmentUSD);
    }

    /**
     * @dev modifiers STO tiers. All tiers must be passed, can not edit specific tiers.
     * @param _ratePerTier Array of rates per tier
     * @param _ratePerTierDiscountPoly Array of discounted poly rates per tier
     * @param _tokensPerTierTotal Array of total tokens per tier
     * @param _tokensPerTierDiscountPoly Array of discounted tokens per tier
     */
    function modifyTiers(
        uint256[] _ratePerTier,
        uint256[] _ratePerTierDiscountPoly,
        uint256[] _tokensPerTierTotal,
        uint256[] _tokensPerTierDiscountPoly
    ) external onlyOwner {emit __FunctionCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',8);

        /*solium-disable-next-line security/no-block-members*/
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',173);
        emit __AssertPreCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',9);
emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',18);
require(now < startTime, "STO already started");emit __AssertPostCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',9);

emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',174);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',19);
_modifyTiers(_ratePerTier, _ratePerTierDiscountPoly, _tokensPerTierTotal, _tokensPerTierDiscountPoly);
    }

    /**
     * @dev Modifies STO start and end times
     * @param _startTime start time of sto
     * @param _endTime end time of sto
     */
    function modifyTimes(
        uint256 _startTime,
        uint256 _endTime
    ) external onlyOwner {emit __FunctionCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',9);

        /*solium-disable-next-line security/no-block-members*/
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',187);
        emit __AssertPreCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',10);
emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',20);
require(now < startTime, "STO already started");emit __AssertPostCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',10);

emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',188);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',21);
_modifyTimes(_startTime, _endTime);
    }

    /**
     * @dev Modifies addresses used as wallet, reserve wallet and usd token
     * @param _wallet Address of wallet where funds are sent
     * @param _reserveWallet Address of wallet where unsold tokens are sent
     * @param _usdTokens Address of usd tokens
     */
    function modifyAddresses(
        address _wallet,
        address _reserveWallet,
        address[] _usdTokens
    ) external onlyOwner {emit __FunctionCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',10);

        /*solium-disable-next-line security/no-block-members*/
        // require(now < startTime, "STO already started");
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',204);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',22);
_modifyAddresses(_wallet, _reserveWallet, _usdTokens);
    }

    function _modifyLimits(
        uint256 _nonAccreditedLimitUSD,
        uint256 _minimumInvestmentUSD
    ) internal {emit __FunctionCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',11);

emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',211);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',23);
minimumInvestmentUSD = _minimumInvestmentUSD;
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',212);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',24);
nonAccreditedLimitUSD = _nonAccreditedLimitUSD;
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',213);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',25);
emit SetLimits(minimumInvestmentUSD, nonAccreditedLimitUSD);
    }

    function _modifyTiers(
        uint256[] _ratePerTier,
        uint256[] _ratePerTierDiscountPoly,
        uint256[] _tokensPerTierTotal,
        uint256[] _tokensPerTierDiscountPoly
    ) internal {emit __FunctionCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',12);

emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',222);
        emit __AssertPreCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',11);
emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',26);
require(_tokensPerTierTotal.length > 0, "No tiers provided");emit __AssertPostCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',11);

emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',223);
        emit __AssertPreCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',12);
emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',27);
require(_ratePerTier.length == _tokensPerTierTotal.length &&
            _ratePerTierDiscountPoly.length == _tokensPerTierTotal.length &&
            _tokensPerTierDiscountPoly.length == _tokensPerTierTotal.length,
            "Tier data length mismatch"
        );emit __AssertPostCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',12);

emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',228);
        delete tiers;
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',229);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',28);
for (uint256 i = 0; i < _ratePerTier.length; i++) {
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',230);
            emit __AssertPreCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',13);
emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',29);
require(_ratePerTier[i] > 0, "Invalid rate");emit __AssertPostCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',13);

emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',231);
            emit __AssertPreCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',14);
emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',30);
require(_tokensPerTierTotal[i] > 0, "Invalid token amount");emit __AssertPostCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',14);

emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',232);
            emit __AssertPreCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',15);
emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',31);
require(_tokensPerTierDiscountPoly[i] <= _tokensPerTierTotal[i], "Too many discounted tokens");emit __AssertPostCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',15);

emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',233);
            emit __AssertPreCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',16);
emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',32);
require(_ratePerTierDiscountPoly[i] <= _ratePerTier[i], "Invalid discount");emit __AssertPostCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',16);

emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',234);
            tiers.push(Tier(_ratePerTier[i], _ratePerTierDiscountPoly[i], _tokensPerTierTotal[i], _tokensPerTierDiscountPoly[i], 0, 0));
        }
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',236);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',33);
emit SetTiers(_ratePerTier, _ratePerTierDiscountPoly, _tokensPerTierTotal, _tokensPerTierDiscountPoly);
    }

    function _modifyTimes(
        uint256 _startTime,
        uint256 _endTime
    ) internal {emit __FunctionCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',13);

        /*solium-disable-next-line security/no-block-members*/
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',244);
        emit __AssertPreCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',17);
emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',34);
require((_endTime > _startTime) && (_startTime > now), "Invalid times");emit __AssertPostCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',17);

emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',245);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',35);
startTime = _startTime;
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',246);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',36);
endTime = _endTime;
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',247);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',37);
emit SetTimes(_startTime, _endTime);
    }

    function _modifyAddresses(
        address _wallet,
        address _reserveWallet,
        address[] _usdTokens
    ) internal {emit __FunctionCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',14);

emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',255);
        emit __AssertPreCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',18);
emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',38);
require(_wallet != address(0) && _reserveWallet != address(0), "Invalid wallet");emit __AssertPostCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',18);

emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',256);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',39);
wallet = _wallet;
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',257);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',40);
reserveWallet = _reserveWallet;
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',258);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',41);
_modifyUSDTokens(_usdTokens);
    }

    function _modifyUSDTokens(address[] _usdTokens) internal {emit __FunctionCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',15);

emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',262);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',42);
for(uint256 i = 0; i < usdTokens.length; i++) {
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',263);
            emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',43);
usdTokenEnabled[usdTokens[i]] = false;
        }
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',265);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',44);
usdTokens = _usdTokens;
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',266);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',45);
for(i = 0; i < _usdTokens.length; i++) {
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',267);
            emit __AssertPreCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',19);
emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',46);
require(_usdTokens[i] != address(0), "Invalid USD token");emit __AssertPostCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',19);

emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',268);
            emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',47);
usdTokenEnabled[_usdTokens[i]] = true;
        }
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',270);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',48);
emit SetAddresses(wallet, reserveWallet, _usdTokens);
    }

    ////////////////////
    // STO Management //
    ////////////////////

    /**
     * @notice Finalizes the STO and mint remaining tokens to reserve address
     * @notice Reserve address must be whitelisted to successfully finalize
     */
    function finalize() public onlyOwner {emit __FunctionCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',16);

emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',282);
        emit __AssertPreCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',20);
emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',49);
require(!isFinalized, "STO is already finalized");emit __AssertPostCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',20);

emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',283);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',50);
isFinalized = true;
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',284);
        uint256 tempReturned;
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',285);
        uint256 tempSold;
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',286);
        uint256 remainingTokens;
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',287);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',51);
for (uint256 i = 0; i < tiers.length; i++) {
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',288);
            emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',52);
remainingTokens = tiers[i].tokenTotal.sub(tiers[i].mintedTotal);
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',289);
            emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',53);
tempReturned = tempReturned.add(remainingTokens);
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',290);
            emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',54);
tempSold = tempSold.add(tiers[i].mintedTotal);
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',291);
            emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',55);
if (remainingTokens > 0) {emit __BranchCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',21,0);
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',292);
                emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',56);
tiers[i].mintedTotal = tiers[i].tokenTotal;
            }else { emit __BranchCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',21,1);}

        }
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',295);
        emit __AssertPreCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',22);
emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',57);
require(ISecurityToken(securityToken).mint(reserveWallet, tempReturned), "Error in minting");emit __AssertPostCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',22);

emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',296);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',58);
emit ReserveTokenMint(msg.sender, reserveWallet, tempReturned, currentTier);
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',297);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',59);
finalAmountReturned = tempReturned;
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',298);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',60);
totalTokensSold = tempSold;
    }

    /**
     * @notice Modifies the list of accredited addresses
     * @param _investors Array of investor addresses to modify
     * @param _accredited Array of bools specifying accreditation status
     */
    function changeAccredited(address[] _investors, bool[] _accredited) public onlyOwner {emit __FunctionCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',17);

emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',307);
        emit __AssertPreCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',23);
emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',61);
require(_investors.length == _accredited.length, "Array length mismatch");emit __AssertPostCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',23);

emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',308);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',62);
for (uint256 i = 0; i < _investors.length; i++) {
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',309);
            emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',63);
accredited[_investors[i]] = _accredited[i];
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',310);
            emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',64);
emit SetAccredited(_investors[i], _accredited[i]);
        }
    }

    /**
     * @notice Modifies the list of overrides for non-accredited limits in USD
     * @param _investors Array of investor addresses to modify
     * @param _nonAccreditedLimit Array of uints specifying non-accredited limits
     */
    function changeNonAccreditedLimit(address[] _investors, uint256[] _nonAccreditedLimit) public onlyOwner {emit __FunctionCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',18);

        //nonAccreditedLimitUSDOverride
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',321);
        emit __AssertPreCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',24);
emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',65);
require(_investors.length == _nonAccreditedLimit.length, "Array length mismatch");emit __AssertPostCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',24);

emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',322);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',66);
for (uint256 i = 0; i < _investors.length; i++) {
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',323);
            emit __AssertPreCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',25);
emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',67);
require(_nonAccreditedLimit[i] > 0, "Limit = 0");emit __AssertPostCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',25);

emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',324);
            emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',68);
nonAccreditedLimitUSDOverride[_investors[i]] = _nonAccreditedLimit[i];
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',325);
            emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',69);
emit SetNonAccreditedLimit(_investors[i], _nonAccreditedLimit[i]);
        }
    }

    /**
     * @notice Function to set allowBeneficialInvestments (allow beneficiary to be different to funder)
     * @param _allowBeneficialInvestments Boolean to allow or disallow beneficial investments
     */
    function changeAllowBeneficialInvestments(bool _allowBeneficialInvestments) public onlyOwner {emit __FunctionCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',19);

emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',334);
        emit __AssertPreCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',26);
emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',70);
require(_allowBeneficialInvestments != allowBeneficialInvestments, "Value unchanged");emit __AssertPostCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',26);

emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',335);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',71);
allowBeneficialInvestments = _allowBeneficialInvestments;
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',336);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',72);
emit SetAllowBeneficialInvestments(allowBeneficialInvestments);
    }

    //////////////////////////
    // Investment Functions //
    //////////////////////////

    /**
    * @notice fallback function - assumes ETH being invested
    */
    function () external payable {emit __FunctionCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',20);

emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',347);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',73);
buyWithETHRateLimited(msg.sender, 0);
    }

    // Buy functions without rate restriction
    function buyWithETH(address _beneficiary) external payable {emit __FunctionCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',21);

emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',352);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',74);
buyWithETHRateLimited(_beneficiary, 0);
    }

    function buyWithPOLY(address _beneficiary, uint256 _investedPOLY) external {emit __FunctionCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',22);

emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',356);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',75);
buyWithPOLYRateLimited(_beneficiary, _investedPOLY, 0);
    }

    function buyWithUSD(address _beneficiary, uint256 _investedSC, IERC20 _usdToken) external {emit __FunctionCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',23);

emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',360);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',76);
buyWithUSDRateLimited(_beneficiary, _investedSC, 0, _usdToken);
    }

    /**
      * @notice Purchase tokens using ETH
      * @param _beneficiary Address where security tokens will be sent
      * @param _minTokens Minumum number of tokens to buy or else revert
      */
    function buyWithETHRateLimited(address _beneficiary, uint256 _minTokens) public payable validETH {emit __FunctionCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',24);

emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',369);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',77);
uint256 rate = getRate(FundRaiseType.ETH);
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',370);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',78);
uint256 initialMinted = getTokensMinted();
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',371);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',79);
(uint256 spentUSD, uint256 spentValue) = _buyTokens(_beneficiary, msg.value, rate, FundRaiseType.ETH);
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',372);
        emit __AssertPreCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',27);
emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',80);
require(getTokensMinted().sub(initialMinted) >= _minTokens, "Insufficient tokens minted");emit __AssertPostCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',27);

        // Modify storage
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',374);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',81);
investorInvested[_beneficiary][uint8(FundRaiseType.ETH)] = investorInvested[_beneficiary][uint8(FundRaiseType.ETH)].add(spentValue);
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',375);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',82);
fundsRaised[uint8(FundRaiseType.ETH)] = fundsRaised[uint8(FundRaiseType.ETH)].add(spentValue);
        // Forward ETH to issuer wallet
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',377);
        wallet.transfer(spentValue);
        // Refund excess ETH to investor wallet
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',379);
        msg.sender.transfer(msg.value.sub(spentValue));
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',380);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',83);
emit FundsReceived(msg.sender, _beneficiary, spentUSD, FundRaiseType.ETH, msg.value, spentValue, rate);
    }

    /**
      * @notice Purchase tokens using POLY
      * @param _beneficiary Address where security tokens will be sent
      * @param _investedPOLY Amount of POLY invested
      * @param _minTokens Minumum number of tokens to buy or else revert
      */
    function buyWithPOLYRateLimited(address _beneficiary, uint256 _investedPOLY, uint256 _minTokens) public validPOLY {emit __FunctionCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',25);

emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',390);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',84);
_buyWithTokens(_beneficiary, _investedPOLY, FundRaiseType.POLY, _minTokens, polyToken);
    }

    /**
      * @notice Purchase tokens using Stable coins
      * @param _beneficiary Address where security tokens will be sent
      * @param _investedSC Amount of Stable coins invested
      * @param _minTokens Minumum number of tokens to buy or else revert
      * @param _usdToken Address of USD stable coin to buy tokens with
      */
    function buyWithUSDRateLimited(address _beneficiary, uint256 _investedSC, uint256 _minTokens, IERC20 _usdToken)
        public validSC(_usdToken)
    {emit __FunctionCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',26);

emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',403);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',85);
_buyWithTokens(_beneficiary, _investedSC, FundRaiseType.SC, _minTokens, _usdToken);
    }

    function _buyWithTokens(address _beneficiary, uint256 _tokenAmount, FundRaiseType _fundRaiseType, uint256 _minTokens, IERC20 _token) internal {emit __FunctionCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',27);

emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',407);
        emit __AssertPreCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',28);
emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',86);
require(_fundRaiseType == FundRaiseType.POLY || _fundRaiseType == FundRaiseType.SC, "Invalid raise type");emit __AssertPostCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',28);

emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',408);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',87);
uint256 initialMinted = getTokensMinted();
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',409);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',88);
uint256 rate = getRate(_fundRaiseType);
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',410);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',89);
(uint256 spentUSD, uint256 spentValue) = _buyTokens(_beneficiary, _tokenAmount, rate, _fundRaiseType);
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',411);
        emit __AssertPreCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',29);
emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',90);
require(getTokensMinted().sub(initialMinted) >= _minTokens, "Insufficient tokens minted");emit __AssertPostCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',29);

        // Modify storage
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',413);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',91);
investorInvested[_beneficiary][uint8(_fundRaiseType)] = investorInvested[_beneficiary][uint8(_fundRaiseType)].add(spentValue);
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',414);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',92);
fundsRaised[uint8(_fundRaiseType)] = fundsRaised[uint8(_fundRaiseType)].add(spentValue);
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',415);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',93);
if(address(_token) != address(polyToken))
            {emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',94);
emit __BranchCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',30,0);emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',416);
stableCoinsRaised[address(_token)] = stableCoinsRaised[address(_token)].add(spentValue);}else { emit __BranchCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',30,1);}

        // Forward coins to issuer wallet
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',418);
        emit __AssertPreCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',31);
emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',95);
require(_token.transferFrom(msg.sender, wallet, spentValue), "Transfer failed");emit __AssertPostCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',31);

emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',419);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',96);
emit FundsReceived(msg.sender, _beneficiary, spentUSD, _fundRaiseType, _tokenAmount, spentValue, rate);
    }

    /**
      * @notice Low level token purchase
      * @param _beneficiary Address where security tokens will be sent
      * @param _investmentValue Amount of POLY, ETH or Stable coins invested
      * @param _fundRaiseType Fund raise type (POLY, ETH, SC)
      */
    function _buyTokens(
        address _beneficiary,
        uint256 _investmentValue,
        uint256 _rate,
        FundRaiseType _fundRaiseType
    )
        internal
        nonReentrant
        whenNotPaused
        returns(uint256 spentUSD, uint256 spentValue)
    {emit __FunctionCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',28);

emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',439);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',97);
if (!allowBeneficialInvestments) {emit __BranchCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',32,0);
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',440);
            emit __AssertPreCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',33);
emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',98);
require(_beneficiary == msg.sender, "Beneficiary != funder");emit __AssertPostCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',33);

        }else { emit __BranchCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',32,1);}


emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',443);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',99);
uint256 originalUSD = DecimalMath.mul(_rate, _investmentValue);
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',444);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',100);
uint256 allowedUSD = _buyTokensChecks(_beneficiary, _investmentValue, originalUSD);

emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',446);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',101);
for (uint256 i = currentTier; i < tiers.length; i++) {
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',447);
            bool gotoNextTier;
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',448);
            uint256 tempSpentUSD;
            // Update current tier if needed
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',450);
            emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',102);
if (currentTier != i)
                {emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',103);
emit __BranchCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',34,0);emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',451);
currentTier = i;}else { emit __BranchCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',34,1);}

            // If there are tokens remaining, process investment
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',453);
            emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',104);
if (tiers[i].mintedTotal < tiers[i].tokenTotal) {emit __BranchCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',35,0);
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',454);
                emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',105);
(tempSpentUSD, gotoNextTier) = _calculateTier(_beneficiary, i, allowedUSD.sub(spentUSD), _fundRaiseType);
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',455);
                emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',106);
spentUSD = spentUSD.add(tempSpentUSD);
                // If all funds have been spent, exit the loop
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',457);
                emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',107);
if (!gotoNextTier)
                    {emit __BranchCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',36,0);emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',458);
break;}else { emit __BranchCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',36,1);}

            }else { emit __BranchCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',35,1);}

        }

        // Modify storage
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',463);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',108);
if (spentUSD > 0) {emit __BranchCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',37,0);
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',464);
            emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',109);
if (investorInvestedUSD[_beneficiary] == 0)
                {emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',110);
emit __BranchCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',38,0);emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',465);
investorCount = investorCount + 1;}else { emit __BranchCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',38,1);}

emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',466);
            emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',111);
investorInvestedUSD[_beneficiary] = investorInvestedUSD[_beneficiary].add(spentUSD);
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',467);
            emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',112);
fundsRaisedUSD = fundsRaisedUSD.add(spentUSD);
        }else { emit __BranchCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',37,1);}


emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',470);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',113);
spentValue = DecimalMath.div(spentUSD, _rate);
    }

    /**
      * @notice Getter function for buyer to calculate how many tokens will they get
      * @param _beneficiary Address where security tokens are to be sent
      * @param _investmentValue Amount of POLY, ETH or Stable coins invested
      * @param _fundRaiseType Fund raise type (POLY, ETH, SC)
      */
    function buyTokensView(
        address _beneficiary,
        uint256 _investmentValue,
        FundRaiseType _fundRaiseType
    )
        public
        
        returns(uint256 spentUSD, uint256 spentValue, uint256 tokensMinted)
    {emit __FunctionCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',29);

emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',488);
        emit __AssertPreCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',39);
emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',114);
require(_fundRaiseType == FundRaiseType.POLY || _fundRaiseType == FundRaiseType.SC || _fundRaiseType == FundRaiseType.ETH, "Invalid raise type");emit __AssertPostCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',39);

emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',489);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',115);
uint256 rate = getRate(_fundRaiseType);
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',490);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',116);
uint256 originalUSD = DecimalMath.mul(rate, _investmentValue);
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',491);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',117);
uint256 allowedUSD = _buyTokensChecks(_beneficiary, _investmentValue, originalUSD);

        // Iterate over each tier and process payment
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',494);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',118);
for (uint256 i = currentTier; i < tiers.length; i++) {
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',495);
            bool gotoNextTier;
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',496);
            uint256 tempSpentUSD;
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',497);
            uint256 tempTokensMinted;
            // If there are tokens remaining, process investment
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',499);
            emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',119);
if (tiers[i].mintedTotal < tiers[i].tokenTotal) {emit __BranchCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',40,0);
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',500);
                emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',120);
(tempSpentUSD, gotoNextTier, tempTokensMinted) = _calculateTierView(i, allowedUSD.sub(spentUSD), _fundRaiseType);
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',501);
                emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',121);
spentUSD = spentUSD.add(tempSpentUSD);
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',502);
                emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',122);
tokensMinted = tokensMinted.add(tempTokensMinted);
                // If all funds have been spent, exit the loop
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',504);
                emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',123);
if (!gotoNextTier)
                    {emit __BranchCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',41,0);emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',505);
break;}else { emit __BranchCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',41,1);}

            }else { emit __BranchCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',40,1);}

        }

emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',509);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',124);
spentValue = DecimalMath.div(spentUSD, rate);
    }

    function _buyTokensChecks(
        address _beneficiary,
        uint256 _investmentValue,
        uint256 investedUSD
    )
        internal
        
        returns(uint256 netInvestedUSD)
    {emit __FunctionCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',30);

emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',521);
        emit __AssertPreCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',42);
emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',125);
require(isOpen(), "STO not open");emit __AssertPostCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',42);

emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',522);
        emit __AssertPreCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',43);
emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',126);
require(_investmentValue > 0, "No funds were sent");emit __AssertPostCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',43);


        // Check for minimum investment
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',525);
        emit __AssertPreCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',44);
emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',127);
require(investedUSD.add(investorInvestedUSD[_beneficiary]) >= minimumInvestmentUSD, "Total investment < minimumInvestmentUSD");emit __AssertPostCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',44);

emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',526);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',128);
netInvestedUSD = investedUSD;
        // Check for non-accredited cap
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',528);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',129);
if (!accredited[_beneficiary]) {emit __BranchCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',45,0);
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',529);
            emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',130);
uint256 investorLimitUSD = (nonAccreditedLimitUSDOverride[_beneficiary] == 0) ? nonAccreditedLimitUSD : nonAccreditedLimitUSDOverride[_beneficiary];
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',530);
            emit __AssertPreCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',46);
emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',131);
require(investorInvestedUSD[_beneficiary] < investorLimitUSD, "Over Non-accredited investor limit");emit __AssertPostCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',46);

emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',531);
            emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',132);
if (investedUSD.add(investorInvestedUSD[_beneficiary]) > investorLimitUSD)
                {emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',133);
emit __BranchCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',47,0);emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',532);
netInvestedUSD = investorLimitUSD.sub(investorInvestedUSD[_beneficiary]);}else { emit __BranchCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',47,1);}

        }else { emit __BranchCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',45,1);}

    }

    function _calculateTier(
        address _beneficiary,
        uint256 _tier,
        uint256 _investedUSD,
        FundRaiseType _fundRaiseType
    )
        internal
        returns(uint256 spentUSD, bool gotoNextTier)
     {emit __FunctionCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',31);

        // First purchase any discounted tokens if POLY investment
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',546);
        uint256 tierSpentUSD;
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',547);
        uint256 tierPurchasedTokens;
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',548);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',134);
uint256 investedUSD = _investedUSD;
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',549);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',135);
Tier storage tierData = tiers[_tier];
        // Check whether there are any remaining discounted tokens
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',551);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',136);
if ((_fundRaiseType == FundRaiseType.POLY) && (tierData.tokensDiscountPoly > tierData.mintedDiscountPoly)) {emit __BranchCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',48,0);
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',552);
            emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',137);
uint256 discountRemaining = tierData.tokensDiscountPoly.sub(tierData.mintedDiscountPoly);
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',553);
            emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',138);
uint256 totalRemaining = tierData.tokenTotal.sub(tierData.mintedTotal);
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',554);
            emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',139);
if (totalRemaining < discountRemaining)
                {emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',140);
emit __BranchCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',49,0);emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',555);
(spentUSD, tierPurchasedTokens, gotoNextTier) = _purchaseTier(_beneficiary, tierData.rateDiscountPoly, totalRemaining, investedUSD, _tier);}
            else
                {emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',141);
emit __BranchCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',49,1);emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',557);
(spentUSD, tierPurchasedTokens, gotoNextTier) = _purchaseTier(_beneficiary, tierData.rateDiscountPoly, discountRemaining, investedUSD, _tier);}
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',558);
            emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',142);
investedUSD = investedUSD.sub(spentUSD);
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',559);
            emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',143);
tierData.mintedDiscountPoly = tierData.mintedDiscountPoly.add(tierPurchasedTokens);
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',560);
            emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',144);
tierData.minted[uint8(_fundRaiseType)] = tierData.minted[uint8(_fundRaiseType)].add(tierPurchasedTokens);
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',561);
            emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',145);
tierData.mintedTotal = tierData.mintedTotal.add(tierPurchasedTokens);
        }else { emit __BranchCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',48,1);}

        // Now, if there is any remaining USD to be invested, purchase at non-discounted rate
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',564);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',146);
if (investedUSD > 0 &&
            tierData.tokenTotal.sub(tierData.mintedTotal) > 0 &&
            (_fundRaiseType != FundRaiseType.POLY || tierData.tokensDiscountPoly <= tierData.mintedDiscountPoly)
        ) {emit __BranchCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',50,0);
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',568);
            emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',147);
(tierSpentUSD, tierPurchasedTokens, gotoNextTier) = _purchaseTier(_beneficiary, tierData.rate, tierData.tokenTotal.sub(tierData.mintedTotal), investedUSD, _tier);
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',569);
            emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',148);
spentUSD = spentUSD.add(tierSpentUSD);
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',570);
            emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',149);
tierData.minted[uint8(_fundRaiseType)] = tierData.minted[uint8(_fundRaiseType)].add(tierPurchasedTokens);
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',571);
            emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',150);
tierData.mintedTotal = tierData.mintedTotal.add(tierPurchasedTokens);
        }else { emit __BranchCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',50,1);}

    }

    function _calculateTierView(
        uint256 _tier,
        uint256 _investedUSD,
        FundRaiseType _fundRaiseType
    )
        internal
        
        returns(uint256 spentUSD, bool gotoNextTier, uint256 tokensMinted)
    {emit __FunctionCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',32);

        // First purchase any discounted tokens if POLY investment
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',585);
        uint256 tierSpentUSD;
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',586);
        uint256 tierPurchasedTokens;
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',587);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',151);
Tier storage tierData = tiers[_tier];
        // Check whether there are any remaining discounted tokens
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',589);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',152);
if ((_fundRaiseType == FundRaiseType.POLY) && (tierData.tokensDiscountPoly > tierData.mintedDiscountPoly)) {emit __BranchCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',51,0);
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',590);
            emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',153);
uint256 discountRemaining = tierData.tokensDiscountPoly.sub(tierData.mintedDiscountPoly);
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',591);
            emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',154);
uint256 totalRemaining = tierData.tokenTotal.sub(tierData.mintedTotal);
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',592);
            emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',155);
if (totalRemaining < discountRemaining)
                {emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',156);
emit __BranchCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',52,0);emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',593);
(spentUSD, tokensMinted, gotoNextTier) = _purchaseTierAmount(tierData.rateDiscountPoly, totalRemaining, _investedUSD);}
            else
                {emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',157);
emit __BranchCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',52,1);emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',595);
(spentUSD, tokensMinted, gotoNextTier) = _purchaseTierAmount(tierData.rateDiscountPoly, discountRemaining, _investedUSD);}
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',596);
            emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',158);
_investedUSD = _investedUSD.sub(spentUSD);
        }else { emit __BranchCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',51,1);}

        // Now, if there is any remaining USD to be invested, purchase at non-discounted rate
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',599);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',159);
if (_investedUSD > 0 &&
            tierData.tokenTotal.sub(tierData.mintedTotal.add(tokensMinted)) > 0 &&
            (_fundRaiseType != FundRaiseType.POLY || tierData.tokensDiscountPoly <= tierData.mintedDiscountPoly)
        ) {emit __BranchCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',53,0);
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',603);
            emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',160);
(tierSpentUSD, tierPurchasedTokens, gotoNextTier) = _purchaseTierAmount(tierData.rate, tierData.tokenTotal.sub(tierData.mintedTotal), _investedUSD);
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',604);
            emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',161);
spentUSD = spentUSD.add(tierSpentUSD);
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',605);
            emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',162);
tokensMinted = tokensMinted.add(tierPurchasedTokens);
        }else { emit __BranchCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',53,1);}

    }

    function _purchaseTier(
        address _beneficiary,
        uint256 _tierPrice,
        uint256 _tierRemaining,
        uint256 _investedUSD,
        uint256 _tier
    )
        internal
        returns(uint256 spentUSD, uint256 purchasedTokens, bool gotoNextTier)
    {emit __FunctionCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',33);

emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',619);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',163);
(spentUSD, purchasedTokens, gotoNextTier) = _purchaseTierAmount(_tierPrice, _tierRemaining, _investedUSD);
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',620);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',164);
if (purchasedTokens > 0) {emit __BranchCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',54,0);
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',621);
            emit __AssertPreCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',55);
emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',165);
require(ISecurityToken(securityToken).mint(_beneficiary, purchasedTokens), "Error in minting");emit __AssertPostCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',55);

emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',622);
            emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',166);
emit TokenPurchase(msg.sender, _beneficiary, purchasedTokens, spentUSD, _tierPrice, _tier);
        }else { emit __BranchCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',54,1);}

    }

    function _purchaseTierAmount(
        uint256 _tierPrice,
        uint256 _tierRemaining,
        uint256 _investedUSD
    )
        internal
        
        returns(uint256 spentUSD, uint256 purchasedTokens, bool gotoNextTier)
    {emit __FunctionCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',34);

emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',635);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',167);
uint256 maximumTokens = DecimalMath.div(_investedUSD, _tierPrice);
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',636);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',168);
uint256 granularity = ISecurityToken(securityToken).granularity();
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',637);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',169);
maximumTokens = maximumTokens.div(granularity);
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',638);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',170);
maximumTokens = maximumTokens.mul(granularity);
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',639);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',171);
if (maximumTokens > _tierRemaining) {emit __BranchCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',56,0);
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',640);
            emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',172);
spentUSD = DecimalMath.mul(_tierRemaining, _tierPrice);
            // In case of rounding issues, ensure that spentUSD is never more than investedUSD
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',642);
            emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',173);
if (spentUSD > _investedUSD) {emit __BranchCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',57,0);
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',643);
                emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',174);
spentUSD = _investedUSD;
            }else { emit __BranchCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',57,1);}

emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',645);
            emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',175);
purchasedTokens = _tierRemaining;
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',646);
            emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',176);
gotoNextTier = true;
        } else {emit __BranchCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',56,1);
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',648);
            emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',177);
spentUSD = DecimalMath.mul(maximumTokens, _tierPrice);
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',649);
            emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',178);
purchasedTokens = maximumTokens;
        }
    }

    /////////////
    // Getters //
    /////////////

    /**
     * @notice This function returns whether or not the STO is in fundraising mode (open)
     * @return bool Whether the STO is accepting investments
     */
    function isOpen() public  returns(bool) {emit __FunctionCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',35);

emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',662);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',179);
if (isFinalized)
            {emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',180);
emit __BranchCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',58,0);emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',663);
return false;}else { emit __BranchCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',58,1);}

        /*solium-disable-next-line security/no-block-members*/
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',665);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',181);
if (now < startTime)
            {emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',182);
emit __BranchCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',59,0);emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',666);
return false;}else { emit __BranchCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',59,1);}

        /*solium-disable-next-line security/no-block-members*/
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',668);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',183);
if (now >= endTime)
            {emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',184);
emit __BranchCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',60,0);emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',669);
return false;}else { emit __BranchCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',60,1);}

emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',670);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',185);
if (capReached())
            {emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',186);
emit __BranchCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',61,0);emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',671);
return false;}else { emit __BranchCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',61,1);}

emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',672);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',187);
return true;
    }

    /**
     * @notice Checks whether the cap has been reached.
     * @return bool Whether the cap was reached
     */
    function capReached() public  returns (bool) {emit __FunctionCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',36);

emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',680);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',188);
if (isFinalized) {emit __BranchCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',62,0);
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',681);
            emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',189);
return (finalAmountReturned == 0);
        }else { emit __BranchCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',62,1);}

emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',683);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',190);
return (tiers[tiers.length - 1].mintedTotal == tiers[tiers.length - 1].tokenTotal);
    }

    /**
     * @dev returns current conversion rate of funds
     * @param _fundRaiseType Fund raise type to get rate of
     */
    function getRate(FundRaiseType _fundRaiseType) public  returns (uint256) {emit __FunctionCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',37);

emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',691);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',191);
if (_fundRaiseType == FundRaiseType.ETH) {emit __BranchCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',63,0);
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',692);
            emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',192);
return IOracle(_getOracle(bytes32("ETH"), bytes32("USD"))).getPrice();
        } else {emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',193);
emit __BranchCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',63,1);if (_fundRaiseType == FundRaiseType.POLY) {emit __BranchCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',64,0);
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',694);
            emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',194);
return IOracle(_getOracle(bytes32("POLY"), bytes32("USD"))).getPrice();
        } else {emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',195);
emit __BranchCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',64,1);if (_fundRaiseType == FundRaiseType.SC) {emit __BranchCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',65,0);
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',696);
            emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',196);
return 1 * 10**18;
        } else {emit __BranchCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',65,1);
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',698);
            emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',197);
revert("Incorrect funding");
        }}}
    }

    /**
     * @notice This function converts from ETH or POLY to USD
     * @param _fundRaiseType Currency key
     * @param _amount Value to convert to USD
     * @return uint256 Value in USD
     */
    function convertToUSD(FundRaiseType _fundRaiseType, uint256 _amount) public  returns(uint256) {emit __FunctionCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',38);

emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',709);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',198);
uint256 rate = getRate(_fundRaiseType);
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',710);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',199);
return DecimalMath.mul(_amount, rate);
    }

    /**
     * @notice This function converts from USD to ETH or POLY
     * @param _fundRaiseType Currency key
     * @param _amount Value to convert from USD
     * @return uint256 Value in ETH or POLY
     */
    function convertFromUSD(FundRaiseType _fundRaiseType, uint256 _amount) public  returns(uint256) {emit __FunctionCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',39);

emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',720);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',200);
uint256 rate = getRate(_fundRaiseType);
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',721);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',201);
return DecimalMath.div(_amount, rate);
    }

    /**
     * @notice Return the total no. of tokens sold
     * @return uint256 Total number of tokens sold
     */
    function getTokensSold() public  returns (uint256) {emit __FunctionCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',40);

emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',729);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',202);
if (isFinalized)
            {emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',203);
emit __BranchCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',66,0);emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',730);
return totalTokensSold;}
        else
            {emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',204);
emit __BranchCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',66,1);emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',732);
return getTokensMinted();}
    }

    /**
     * @notice Return the total no. of tokens minted
     * @return uint256 Total number of tokens minted
     */
    function getTokensMinted() public  returns (uint256) {emit __FunctionCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',41);

emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',740);
        uint256 tokensMinted;
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',741);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',205);
for (uint256 i = 0; i < tiers.length; i++) {
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',742);
            emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',206);
tokensMinted = tokensMinted.add(tiers[i].mintedTotal);
        }
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',744);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',207);
return tokensMinted;
    }

    /**
     * @notice Return the total no. of tokens sold for the given fund raise type
     * param _fundRaiseType The fund raising currency (e.g. ETH, POLY, SC) to calculate sold tokens for
     * @return uint256 Total number of tokens sold for ETH
     */
    function getTokensSoldFor(FundRaiseType _fundRaiseType) public  returns (uint256) {emit __FunctionCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',42);

emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',753);
        uint256 tokensSold;
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',754);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',208);
for (uint256 i = 0; i < tiers.length; i++) {
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',755);
            emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',209);
tokensSold = tokensSold.add(tiers[i].minted[uint8(_fundRaiseType)]);
        }
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',757);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',210);
return tokensSold;
    }

    /**
     * @notice Return array of minted tokens in each fund raise type for given tier
     * param _tier The tier to return minted tokens for
     * @return uint256[] array of minted tokens in each fund raise type
     */
    function getTokensMintedByTier(uint256 _tier) public  returns (uint256[]) {emit __FunctionCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',43);

emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',766);
        emit __AssertPreCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',67);
emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',211);
require(_tier < tiers.length, "Invalid tier");emit __AssertPostCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',67);

emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',767);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',212);
uint256[] memory tokensMinted = new uint256[](3);
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',768);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',213);
tokensMinted[0] = tiers[_tier].minted[uint8(FundRaiseType.ETH)];
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',769);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',214);
tokensMinted[1] = tiers[_tier].minted[uint8(FundRaiseType.POLY)];
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',770);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',215);
tokensMinted[2] = tiers[_tier].minted[uint8(FundRaiseType.SC)];
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',771);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',216);
return tokensMinted;
    }

    /**
     * @notice Return the total no. of tokens sold in a given tier
     * param _tier The tier to calculate sold tokens for
     * @return uint256 Total number of tokens sold in the tier
     */
    function getTokensSoldByTier(uint256 _tier) public  returns (uint256) {emit __FunctionCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',44);

emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',780);
        emit __AssertPreCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',68);
emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',217);
require(_tier < tiers.length, "Incorrect tier");emit __AssertPostCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',68);

emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',781);
        uint256 tokensSold;
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',782);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',218);
tokensSold = tokensSold.add(tiers[_tier].minted[uint8(FundRaiseType.ETH)]);
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',783);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',219);
tokensSold = tokensSold.add(tiers[_tier].minted[uint8(FundRaiseType.POLY)]);
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',784);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',220);
tokensSold = tokensSold.add(tiers[_tier].minted[uint8(FundRaiseType.SC)]);
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',785);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',221);
return tokensSold;
    }

    /**
     * @notice Return the total no. of tiers
     * @return uint256 Total number of tiers
     */
    function getNumberOfTiers() public  returns (uint256) {emit __FunctionCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',45);

emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',793);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',222);
return tiers.length;
    }

    /**
     * @notice Return the usd tokens accepted by the STO
     * @return address[] usd tokens
     */
    function getUsdTokens() public  returns (address[]) {emit __FunctionCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',46);

emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',801);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',223);
return usdTokens;
    }

    /**
     * @notice Return the permissions flag that are associated with STO
     */
    function getPermissions() public  returns(bytes32[]) {emit __FunctionCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',47);

emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',808);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',224);
bytes32[] memory allPermissions = new bytes32[](0);
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',809);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',225);
return allPermissions;
    }

    /**
     * @notice Return the STO details
     * @return Unixtimestamp at which offering gets start.
     * @return Unixtimestamp at which offering ends.
     * @return Currently active tier
     * @return Array of Number of tokens this STO will be allowed to sell at different tiers.
     * @return Array Rate at which tokens are sold at different tiers
     * @return Amount of funds raised
     * @return Number of individual investors this STO have.
     * @return Amount of tokens sold.
     * @return Array of bools to show if funding is allowed in ETH, POLY, SC respectively
     */
    function getSTODetails() public  returns(uint256, uint256, uint256, uint256[], uint256[], uint256, uint256, uint256, bool[]) {emit __FunctionCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',48);

emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',825);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',226);
uint256[] memory cap = new uint256[](tiers.length);
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',826);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',227);
uint256[] memory rate = new uint256[](tiers.length);
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',827);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',228);
for(uint256 i = 0; i < tiers.length; i++) {
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',828);
            emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',229);
cap[i] = tiers[i].tokenTotal;
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',829);
            emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',230);
rate[i] = tiers[i].rate;
        }
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',831);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',231);
bool[] memory _fundRaiseTypes = new bool[](3);
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',832);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',232);
_fundRaiseTypes[0] = fundRaiseTypes[uint8(FundRaiseType.ETH)];
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',833);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',233);
_fundRaiseTypes[1] = fundRaiseTypes[uint8(FundRaiseType.POLY)];
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',834);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',234);
_fundRaiseTypes[2] = fundRaiseTypes[uint8(FundRaiseType.SC)];
emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',835);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',235);
return (
            startTime,
            endTime,
            currentTier,
            cap,
            rate,
            fundsRaisedUSD,
            investorCount,
            getTokensSold(),
            _fundRaiseTypes
        );
    }

    /**
     * @notice This function returns the signature of configure function
     * @return bytes4 Configure function signature
     */
    function getInitFunction() public  returns (bytes4) {emit __FunctionCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',49);

emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',853);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',236);
return 0xeac2f9e4;
    }

    function _getOracle(bytes32 _currency, bytes32 _denominatedCurrency) internal  returns (address) {emit __FunctionCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',50);

emit __CoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',857);
        emit __StatementCoverageUSDTieredSTO('./contracts/modules/STO/USDTieredSTO.sol',237);
return PolymathRegistry(RegistryUpdater(securityToken).polymathRegistry()).getAddress(oracleKeys[_currency][_denominatedCurrency]);
    }

}
