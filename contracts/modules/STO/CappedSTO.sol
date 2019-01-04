pragma solidity ^0.4.24;

import "./ISTO.sol";
import "../../interfaces/ISecurityToken.sol";
import "openzeppelin-solidity/contracts/ReentrancyGuard.sol";
import "openzeppelin-solidity/contracts/math/SafeMath.sol";

/**
 * @title STO module for standard capped crowdsale
 */
contract CappedSTO is ISTO, ReentrancyGuard {event __CoverageCappedSTO(string fileName, uint256 lineNumber);
event __FunctionCoverageCappedSTO(string fileName, uint256 fnId);
event __StatementCoverageCappedSTO(string fileName, uint256 statementId);
event __BranchCoverageCappedSTO(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageCappedSTO(string fileName, uint256 branchId);
event __AssertPostCoverageCappedSTO(string fileName, uint256 branchId);

    using SafeMath for uint256;

    // Determine whether users can invest on behalf of a beneficiary
    bool public allowBeneficialInvestments = false;
    // How many token units a buyer gets (multiplied by 10^18) per wei / base unit of POLY
    // If rate is 10^18, buyer will get 1 token unit for every wei / base unit of poly.
    uint256 public rate;
    //How many token base units this STO will be allowed to sell to investors
    // 1 full token = 10^decimals_of_token base units
    uint256 public cap;

    mapping (address => uint256) public investors;

    /**
    * Event for token purchase logging
    * @param purchaser who paid for the tokens
    * @param beneficiary who got the tokens
    * @param value weis paid for purchase
    * @param amount amount of tokens purchased
    */
    event TokenPurchase(address indexed purchaser, address indexed beneficiary, uint256 value, uint256 amount);

    event SetAllowBeneficialInvestments(bool _allowed);

    constructor (address _securityToken, address _polyAddress) public
    Module(_securityToken, _polyAddress)
    {emit __FunctionCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',1);

    }

    //////////////////////////////////
    /**
    * @notice fallback function ***DO NOT OVERRIDE***
    */
    function () external payable {emit __FunctionCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',2);

emit __CoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',46);
        emit __StatementCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',1);
buyTokens(msg.sender);
    }

    /**
     * @notice Function used to intialize the contract variables
     * @param _startTime Unix timestamp at which offering get started
     * @param _endTime Unix timestamp at which offering get ended
     * @param _cap Maximum No. of token base units for sale
     * @param _rate Token units a buyer gets multiplied by 10^18 per wei / base unit of POLY 
     * @param _fundRaiseTypes Type of currency used to collect the funds
     * @param _fundsReceiver Ethereum account address to hold the funds
     */
    function configure(
        uint256 _startTime,
        uint256 _endTime,
        uint256 _cap,
        uint256 _rate,
        FundRaiseType[] _fundRaiseTypes,
        address _fundsReceiver
    )
    public
    onlyFactory
    {emit __FunctionCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',3);

emit __CoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',69);
        emit __AssertPreCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',1);
emit __StatementCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',2);
require(endTime == 0, "Already configured");emit __AssertPostCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',1);

emit __CoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',70);
        emit __AssertPreCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',2);
emit __StatementCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',3);
require(_rate > 0, "Rate of token should be greater than 0");emit __AssertPostCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',2);

emit __CoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',71);
        emit __AssertPreCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',3);
emit __StatementCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',4);
require(_fundsReceiver != address(0), "Zero address is not permitted");emit __AssertPostCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',3);

        /*solium-disable-next-line security/no-block-members*/
emit __CoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',73);
        emit __AssertPreCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',4);
emit __StatementCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',5);
require(_startTime >= now && _endTime > _startTime, "Date parameters are not valid");emit __AssertPostCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',4);

emit __CoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',74);
        emit __AssertPreCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',5);
emit __StatementCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',6);
require(_cap > 0, "Cap should be greater than 0");emit __AssertPostCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',5);

emit __CoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',75);
        emit __AssertPreCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',6);
emit __StatementCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',7);
require(_fundRaiseTypes.length == 1, "It only selects single fund raise type");emit __AssertPostCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',6);

emit __CoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',76);
        emit __StatementCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',8);
startTime = _startTime;
emit __CoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',77);
        emit __StatementCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',9);
endTime = _endTime;
emit __CoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',78);
        emit __StatementCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',10);
cap = _cap;
emit __CoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',79);
        emit __StatementCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',11);
rate = _rate;
emit __CoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',80);
        emit __StatementCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',12);
wallet = _fundsReceiver;
emit __CoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',81);
        emit __StatementCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',13);
_setFundRaiseType(_fundRaiseTypes);
    }

    /**
     * @notice This function returns the signature of configure function
     */
    function getInitFunction() public  returns (bytes4) {emit __FunctionCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',4);

emit __CoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',88);
        emit __StatementCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',14);
return bytes4(keccak256("configure(uint256,uint256,uint256,uint256,uint8[],address)"));
    }

    /**
     * @notice Function to set allowBeneficialInvestments (allow beneficiary to be different to funder)
     * @param _allowBeneficialInvestments Boolean to allow or disallow beneficial investments
     */
    function changeAllowBeneficialInvestments(bool _allowBeneficialInvestments) public onlyOwner {emit __FunctionCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',5);

emit __CoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',96);
        emit __AssertPreCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',7);
emit __StatementCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',15);
require(_allowBeneficialInvestments != allowBeneficialInvestments, "Does not change value");emit __AssertPostCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',7);

emit __CoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',97);
        emit __StatementCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',16);
allowBeneficialInvestments = _allowBeneficialInvestments;
emit __CoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',98);
        emit __StatementCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',17);
emit SetAllowBeneficialInvestments(allowBeneficialInvestments);
    }

    /**
      * @notice Low level token purchase ***DO NOT OVERRIDE***
      * @param _beneficiary Address performing the token purchase
      */
    function buyTokens(address _beneficiary) public payable nonReentrant {emit __FunctionCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',6);

emit __CoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',106);
        emit __StatementCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',18);
if (!allowBeneficialInvestments) {emit __BranchCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',8,0);
emit __CoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',107);
            emit __AssertPreCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',9);
emit __StatementCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',19);
require(_beneficiary == msg.sender, "Beneficiary address does not match msg.sender");emit __AssertPostCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',9);

        }else { emit __BranchCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',8,1);}


emit __CoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',110);
        emit __AssertPreCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',10);
emit __StatementCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',20);
require(!paused, "Should not be paused");emit __AssertPostCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',10);

emit __CoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',111);
        emit __AssertPreCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',11);
emit __StatementCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',21);
require(fundRaiseTypes[uint8(FundRaiseType.ETH)], "Mode of investment is not ETH");emit __AssertPostCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',11);


emit __CoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',113);
        emit __StatementCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',22);
uint256 weiAmount = msg.value;
emit __CoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',114);
        emit __StatementCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',23);
uint256 refund = _processTx(_beneficiary, weiAmount);
emit __CoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',115);
        emit __StatementCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',24);
weiAmount = weiAmount.sub(refund);

emit __CoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',117);
        emit __StatementCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',25);
_forwardFunds(refund);
emit __CoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',118);
        emit __StatementCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',26);
_postValidatePurchase(_beneficiary, weiAmount);
    }

    /**
      * @notice low level token purchase
      * @param _investedPOLY Amount of POLY invested
      */
    function buyTokensWithPoly(uint256 _investedPOLY) public nonReentrant{emit __FunctionCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',7);

emit __CoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',126);
        emit __AssertPreCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',12);
emit __StatementCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',27);
require(!paused, "Should not be paused");emit __AssertPostCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',12);

emit __CoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',127);
        emit __AssertPreCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',13);
emit __StatementCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',28);
require(fundRaiseTypes[uint8(FundRaiseType.POLY)], "Mode of investment is not POLY");emit __AssertPostCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',13);

emit __CoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',128);
        emit __StatementCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',29);
uint256 refund = _processTx(msg.sender, _investedPOLY);
emit __CoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',129);
        emit __StatementCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',30);
_forwardPoly(msg.sender, wallet, _investedPOLY.sub(refund));
emit __CoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',130);
        emit __StatementCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',31);
_postValidatePurchase(msg.sender, _investedPOLY.sub(refund));
    }

    /**
    * @notice Checks whether the cap has been reached.
    * @return bool Whether the cap was reached
    */
    function capReached() public  returns (bool) {emit __FunctionCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',8);

emit __CoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',138);
        emit __StatementCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',32);
return totalTokensSold >= cap;
    }

    /**
     * @notice Return the total no. of tokens sold
     */
    function getTokensSold() public  returns (uint256) {emit __FunctionCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',9);

emit __CoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',145);
        emit __StatementCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',33);
return totalTokensSold;
    }

    /**
     * @notice Return the permissions flag that are associated with STO
     */
    function getPermissions() public  returns(bytes32[]) {emit __FunctionCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',10);

emit __CoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',152);
        emit __StatementCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',34);
bytes32[] memory allPermissions = new bytes32[](0);
emit __CoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',153);
        emit __StatementCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',35);
return allPermissions;
    }

    /**
     * @notice Return the STO details
     * @return Unixtimestamp at which offering gets start.
     * @return Unixtimestamp at which offering ends.
     * @return Number of token base units this STO will be allowed to sell to investors.
     * @return Token units a buyer gets(multiplied by 10^18) per wei / base unit of POLY
     * @return Amount of funds raised
     * @return Number of individual investors this STO have.
     * @return Amount of tokens get sold. 
     * @return Boolean value to justify whether the fund raise type is POLY or not, i.e true for POLY.
     */
    function getSTODetails() public  returns(uint256, uint256, uint256, uint256, uint256, uint256, uint256, bool) {emit __FunctionCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',11);

emit __CoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',168);
        emit __StatementCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',36);
return (
            startTime,
            endTime,
            cap,
            rate,
            (fundRaiseTypes[uint8(FundRaiseType.POLY)]) ? fundsRaised[uint8(FundRaiseType.POLY)]: fundsRaised[uint8(FundRaiseType.ETH)],
            investorCount,
            totalTokensSold,
            (fundRaiseTypes[uint8(FundRaiseType.POLY)])
        );
    }

    // -----------------------------------------
    // Internal interface (extensible)
    // -----------------------------------------
    /**
      * Processing the purchase as well as verify the required validations
      * @param _beneficiary Address performing the token purchase
      * @param _investedAmount Value in wei involved in the purchase
    */
    function _processTx(address _beneficiary, uint256 _investedAmount) internal returns(uint256 refund) {emit __FunctionCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',12);


emit __CoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',190);
        emit __StatementCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',37);
_preValidatePurchase(_beneficiary, _investedAmount);
        // calculate token amount to be created
emit __CoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',192);
        uint256 tokens;
emit __CoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',193);
        emit __StatementCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',38);
(tokens, refund) = _getTokenAmount(_investedAmount);
emit __CoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',194);
        emit __StatementCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',39);
_investedAmount = _investedAmount.sub(refund);

        // update state
emit __CoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',197);
        emit __StatementCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',40);
if (fundRaiseTypes[uint8(FundRaiseType.POLY)]) {emit __BranchCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',14,0);
emit __CoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',198);
            emit __StatementCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',41);
fundsRaised[uint8(FundRaiseType.POLY)] = fundsRaised[uint8(FundRaiseType.POLY)].add(_investedAmount);
        } else {emit __BranchCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',14,1);
emit __CoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',200);
            emit __StatementCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',42);
fundsRaised[uint8(FundRaiseType.ETH)] = fundsRaised[uint8(FundRaiseType.ETH)].add(_investedAmount);
        }
emit __CoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',202);
        emit __StatementCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',43);
totalTokensSold = totalTokensSold.add(tokens);

emit __CoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',204);
        emit __StatementCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',44);
_processPurchase(_beneficiary, tokens);
emit __CoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',205);
        emit __StatementCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',45);
emit TokenPurchase(msg.sender, _beneficiary, _investedAmount, tokens);

emit __CoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',207);
        emit __StatementCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',46);
_updatePurchasingState(_beneficiary, _investedAmount);
    }

    /**
    * @notice Validation of an incoming purchase.
      Use require statements to revert state when conditions are not met. Use super to concatenate validations.
    * @param _beneficiary Address performing the token purchase
    * @param _investedAmount Value in wei involved in the purchase
    */
    function _preValidatePurchase(address _beneficiary, uint256 _investedAmount) internal  {emit __FunctionCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',13);

emit __CoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',217);
        emit __AssertPreCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',15);
emit __StatementCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',47);
require(_beneficiary != address(0), "Beneficiary address should not be 0x");emit __AssertPostCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',15);

emit __CoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',218);
        emit __AssertPreCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',16);
emit __StatementCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',48);
require(_investedAmount != 0, "Amount invested should not be equal to 0");emit __AssertPostCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',16);

emit __CoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',219);
        uint256 tokens;
emit __CoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',220);
        emit __StatementCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',49);
(tokens, ) = _getTokenAmount(_investedAmount);
emit __CoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',221);
        emit __AssertPreCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',17);
emit __StatementCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',50);
require(totalTokensSold.add(tokens) <= cap, "Investment more than cap is not allowed");emit __AssertPostCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',17);

        /*solium-disable-next-line security/no-block-members*/
emit __CoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',223);
        emit __AssertPreCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',18);
emit __StatementCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',51);
require(now >= startTime && now <= endTime, "Offering is closed/Not yet started");emit __AssertPostCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',18);

    }

    /**
    * @notice Validation of an executed purchase.
      Observe state and use revert statements to undo rollback when valid conditions are not met.
    */
    function _postValidatePurchase(address /*_beneficiary*/, uint256 /*_investedAmount*/) internal  {emit __FunctionCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',14);

      // optional override
    }

    /**
    * @notice Source of tokens.
      Override this method to modify the way in which the crowdsale ultimately gets and sends its tokens.
    * @param _beneficiary Address performing the token purchase
    * @param _tokenAmount Number of tokens to be emitted
    */
    function _deliverTokens(address _beneficiary, uint256 _tokenAmount) internal {emit __FunctionCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',15);

emit __CoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',241);
        emit __AssertPreCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',19);
emit __StatementCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',52);
require(ISecurityToken(securityToken).mint(_beneficiary, _tokenAmount), "Error in minting the tokens");emit __AssertPostCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',19);

    }

    /**
    * @notice Executed when a purchase has been validated and is ready to be executed. Not necessarily emits/sends tokens.
    * @param _beneficiary Address receiving the tokens
    * @param _tokenAmount Number of tokens to be purchased
    */
    function _processPurchase(address _beneficiary, uint256 _tokenAmount) internal {emit __FunctionCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',16);

emit __CoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',250);
        emit __StatementCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',53);
if (investors[_beneficiary] == 0) {emit __BranchCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',20,0);
emit __CoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',251);
            emit __StatementCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',54);
investorCount = investorCount + 1;
        }else { emit __BranchCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',20,1);}

emit __CoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',253);
        emit __StatementCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',55);
investors[_beneficiary] = investors[_beneficiary].add(_tokenAmount);

emit __CoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',255);
        emit __StatementCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',56);
_deliverTokens(_beneficiary, _tokenAmount);
    }

    /**
    * @notice Overrides for extensions that require an internal state to check for validity
      (current user contributions, etc.)
    */
    function _updatePurchasingState(address /*_beneficiary*/, uint256 /*_investedAmount*/) internal  {emit __FunctionCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',17);

      // optional override
    }

    /**
    * @notice Overrides to extend the way in which ether is converted to tokens.
    * @param _investedAmount Value in wei to be converted into tokens
    * @return Number of tokens that can be purchased with the specified _investedAmount
    * @return Remaining amount that should be refunded to the investor
    */
    function _getTokenAmount(uint256 _investedAmount) internal  returns (uint256 _tokens, uint256 _refund) {emit __FunctionCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',18);

emit __CoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',273);
        emit __StatementCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',57);
_tokens = _investedAmount.mul(rate);
emit __CoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',274);
        emit __StatementCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',58);
_tokens = _tokens.div(uint256(10) ** 18);
emit __CoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',275);
        emit __StatementCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',59);
uint256 granularity = ISecurityToken(securityToken).granularity();
emit __CoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',276);
        emit __StatementCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',60);
_tokens = _tokens.div(granularity);
emit __CoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',277);
        emit __StatementCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',61);
_tokens = _tokens.mul(granularity);
emit __CoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',278);
        emit __StatementCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',62);
_refund = _investedAmount.sub((_tokens.mul(uint256(10) ** 18)).div(rate));
    }

    /**
    * @notice Determines how ETH is stored/forwarded on purchases.
    */
    function _forwardFunds(uint256 _refund) internal {emit __FunctionCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',19);

emit __CoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',285);
        wallet.transfer(msg.value.sub(_refund));
emit __CoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',286);
        msg.sender.transfer(_refund);
    }

    /**
     * @notice Internal function used to forward the POLY raised to beneficiary address
     * @param _beneficiary Address of the funds reciever
     * @param _to Address who wants to ST-20 tokens
     * @param _fundsAmount Amount invested by _to
     */
    function _forwardPoly(address _beneficiary, address _to, uint256 _fundsAmount) internal {emit __FunctionCoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',20);

emit __CoverageCappedSTO('./contracts/modules/STO/CappedSTO.sol',296);
        polyToken.transferFrom(_beneficiary, _to, _fundsAmount);
    }

}
