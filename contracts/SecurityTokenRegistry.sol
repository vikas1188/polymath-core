pragma solidity ^0.4.24;

import "openzeppelin-solidity/contracts/math/SafeMath.sol";
import "./interfaces/IOwnable.sol";
import "./interfaces/ISTFactory.sol";
import "./interfaces/IERC20.sol";
import "./interfaces/ISecurityTokenRegistry.sol";
import "./storage/EternalStorage.sol";
import "./libraries/Util.sol";
import "./libraries/Encoder.sol";
import "./libraries/VersionUtils.sol";

/**
 * @title Registry contract for issuers to register their tickers and security tokens
 */
contract SecurityTokenRegistry is ISecurityTokenRegistry, EternalStorage {event __CoverageSecurityTokenRegistry(string fileName, uint256 lineNumber);
event __FunctionCoverageSecurityTokenRegistry(string fileName, uint256 fnId);
event __StatementCoverageSecurityTokenRegistry(string fileName, uint256 statementId);
event __BranchCoverageSecurityTokenRegistry(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageSecurityTokenRegistry(string fileName, uint256 branchId);
event __AssertPostCoverageSecurityTokenRegistry(string fileName, uint256 branchId);


    /**
     * @notice state variables

       address public polyToken;
       uint256 public stLaunchFee;
       uint256 public tickerRegFee;
       uint256 public expiryLimit;
       uint256 public latestProtocolVersion;
       bool public paused;
       address public owner;
       address public polymathRegistry;

       address[] public activeUsers;
       mapping(address => bool) public seenUsers;

       mapping(address => bytes32[]) userToTickers;
       mapping(string => address) tickerToSecurityToken;
       mapping(string => uint) tickerIndex;
       mapping(string => TickerDetails) registeredTickers;
       mapping(address => SecurityTokenData) securityTokens;
       mapping(bytes32 => address) protocolVersionST;
       mapping(uint256 => ProtocolVersion) versionData;

       struct ProtocolVersion {
           uint8 major;
           uint8 minor;
           uint8 patch;
       }

       struct TickerDetails {
           address owner;
           uint256 registrationDate;
           uint256 expiryDate;
           string tokenName;
           bool status;
       }

       struct SecurityTokenData {
           string ticker;
           string tokenDetails;
           uint256 deployedAt;
       }

     */

    using SafeMath for uint256;

    bytes32 constant INITIALIZE = 0x9ef7257c3339b099aacf96e55122ee78fb65a36bd2a6c19249882be9c98633bf;
    bytes32 constant POLYTOKEN = 0xacf8fbd51bb4b83ba426cdb12f63be74db97c412515797993d2a385542e311d7;
    bytes32 constant STLAUNCHFEE = 0xd677304bb45536bb7fdfa6b9e47a3c58fe413f9e8f01474b0a4b9c6e0275baf2;
    bytes32 constant TICKERREGFEE = 0x2fcc69711628630fb5a42566c68bd1092bc4aa26826736293969fddcd11cb2d2;
    bytes32 constant EXPIRYLIMIT = 0x604268e9a73dfd777dcecb8a614493dd65c638bad2f5e7d709d378bd2fb0baee;
    bytes32 constant PAUSED = 0xee35723ac350a69d2a92d3703f17439cbaadf2f093a21ba5bf5f1a53eb2a14d9;
    bytes32 constant OWNER = 0x02016836a56b71f0d02689e69e326f4f4c1b9057164ef592671cf0d37c8040c0;
    bytes32 constant POLYMATHREGISTRY = 0x90eeab7c36075577c7cc5ff366e389fefa8a18289b949bab3529ab4471139d4d;

    // Emit when network becomes paused
    event Pause(uint256 _timestammp);
     // Emit when network becomes unpaused
    event Unpause(uint256 _timestamp);
    // Emit when the ticker is removed from the registry
    event TickerRemoved(string _ticker, uint256 _removedAt, address _removedBy);
    // Emit when the token ticker expiry is changed
    event ChangeExpiryLimit(uint256 _oldExpiry, uint256 _newExpiry);
     // Emit when changeSecurityLaunchFee is called
    event ChangeSecurityLaunchFee(uint256 _oldFee, uint256 _newFee);
    // Emit when changeTickerRegistrationFee is called
    event ChangeTickerRegistrationFee(uint256 _oldFee, uint256 _newFee);
    // Emit when ownership gets transferred
    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);
    // Emit when ownership of the ticker gets changed
    event ChangeTickerOwnership(string _ticker, address indexed _oldOwner, address indexed _newOwner);
    // Emit at the time of launching a new security token
    event NewSecurityToken(
        string _ticker,
        string _name,
        address indexed _securityTokenAddress,
        address indexed _owner,
        uint256 _addedAt,
        address _registrant,
        bool _fromAdmin,
        uint256 _registrationFee
    );
    // Emit after ticker registration
    event RegisterTicker(
        address indexed _owner,
        string _ticker,
        string _name,
        uint256 indexed _registrationDate,
        uint256 indexed _expiryDate,
        bool _fromAdmin,
        uint256 _registrationFee
    );

    /////////////////////////////
    // Modifiers
    /////////////////////////////

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {emit __FunctionCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',1);

emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',120);
        emit __AssertPreCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',1);
emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',1);
require(msg.sender == owner(),"sender must be owner");emit __AssertPostCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',1);

emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',121);
        _;
    }

    /**
     * @notice Modifier to make a function callable only when the contract is not paused.
     */
    modifier whenNotPausedOrOwner() {emit __FunctionCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',2);

emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',128);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',2);
if (msg.sender == owner())
            {emit __BranchCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',2,0);emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',129);
_;}
        else {emit __BranchCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',2,1);
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',131);
            emit __AssertPreCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',3);
emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',3);
require(!isPaused(), "Already paused");emit __AssertPostCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',3);

emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',132);
            _;
        }
    }

    /**
     * @notice Modifier to make a function callable only when the contract is not paused and ignore is msg.sender is owner.
     */
    modifier whenNotPaused() {emit __FunctionCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',3);

emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',140);
        emit __AssertPreCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',4);
emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',4);
require(!isPaused(), "Already paused");emit __AssertPostCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',4);

emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',141);
        _;
    }


    /**
     * @notice Modifier to make a function callable only when the contract is paused.
     */
    modifier whenPaused() {emit __FunctionCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',4);

emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',149);
        emit __AssertPreCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',5);
emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',5);
require(isPaused(), "Should not be paused");emit __AssertPostCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',5);

emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',150);
        _;
    }


    /////////////////////////////
    // Initialization
    /////////////////////////////

    /**
     * @notice Initializes instance of STR
     * @param _polymathRegistry is the address of the Polymath Registry
     * @param _STFactory is the address of the Proxy contract for Security Tokens
     * @param _stLaunchFee is the fee in POLY required to launch a token
     * @param _tickerRegFee is the fee in POLY required to register a ticker
     * @param _polyToken is the address of the POLY ERC20 token
     * @param _owner is the owner of the STR
     */
    function initialize(
        address _polymathRegistry,
        address _STFactory,
        uint256 _stLaunchFee,
        uint256 _tickerRegFee,
        address _polyToken,
        address _owner
    )
        external
        payable
    {emit __FunctionCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',5);

emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',178);
        emit __AssertPreCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',6);
emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',6);
require(!getBoolValue(INITIALIZE),"already initialized");emit __AssertPostCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',6);

emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',179);
        emit __AssertPreCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',7);
emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',7);
require(
            _STFactory != address(0) && _polyToken != address(0) && _owner != address(0) && _polymathRegistry != address(0),
            "Invalid address"
        );emit __AssertPostCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',7);

emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',183);
        emit __AssertPreCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',8);
emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',8);
require(_stLaunchFee != 0 && _tickerRegFee != 0, "Fees should not be 0");emit __AssertPostCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',8);

emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',184);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',9);
set(POLYTOKEN, _polyToken);
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',185);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',10);
set(STLAUNCHFEE, _stLaunchFee);
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',186);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',11);
set(TICKERREGFEE, _tickerRegFee);
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',187);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',12);
set(EXPIRYLIMIT, uint256(60 * 1 days));
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',188);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',13);
set(PAUSED, false);
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',189);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',14);
set(OWNER, _owner);
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',190);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',15);
set(POLYMATHREGISTRY, _polymathRegistry);
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',191);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',16);
_setProtocolVersion(_STFactory, uint8(2), uint8(0), uint8(0));
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',192);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',17);
set(INITIALIZE, true);
    }

    /////////////////////////////
    // Token Ticker Management
    /////////////////////////////

    /**
     * @notice Registers the token ticker to the selected owner
     * @notice Once the token ticker is registered to its owner then no other issuer can claim
     * @notice its ownership. If the ticker expires and its issuer hasn't used it, then someone else can take it.
     * @param _owner is address of the owner of the token
     * @param _ticker is unique token ticker
     * @param _tokenName is the name of the token
     */
    function registerTicker(address _owner, string _ticker, string _tokenName) external whenNotPausedOrOwner {emit __FunctionCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',6);

emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',208);
        emit __AssertPreCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',9);
emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',18);
require(_owner != address(0), "Owner should not be 0x");emit __AssertPostCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',9);

emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',209);
        emit __AssertPreCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',10);
emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',19);
require(bytes(_ticker).length > 0 && bytes(_ticker).length <= 10, "Ticker length range (0,10]");emit __AssertPostCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',10);

        // Attempt to charge the reg fee if it is > 0 POLY
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',211);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',20);
uint256 tickerFee = getTickerRegistrationFee();
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',212);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',21);
if (tickerFee > 0)
            {emit __AssertPreCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',12);
emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',22);
emit __BranchCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',11,0);emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',213);
require(IERC20(getAddressValue(POLYTOKEN)).transferFrom(msg.sender, address(this), tickerFee), "Insufficent allowance");emit __AssertPostCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',12);
}else { emit __BranchCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',11,1);}

emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',214);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',23);
string memory ticker = Util.upper(_ticker);
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',215);
        emit __AssertPreCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',13);
emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',24);
require(_tickerAvailable(ticker), "Ticker is reserved");emit __AssertPostCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',13);

        // Check whether ticker was previously registered (and expired)
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',217);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',25);
address previousOwner = _tickerOwner(ticker);
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',218);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',26);
if (previousOwner != address(0)) {emit __BranchCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',14,0);
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',219);
            emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',27);
_deleteTickerOwnership(previousOwner, ticker);
        }else { emit __BranchCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',14,1);}

        /*solium-disable-next-line security/no-block-members*/
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',222);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',28);
_addTicker(_owner, ticker, _tokenName, now, now.add(getExpiryLimit()), false, false, tickerFee);
    }

    /**
     * @notice Internal - Sets the details of the ticker
     */
    function _addTicker(
        address _owner, 
        string _ticker, 
        string _tokenName, 
        uint256 _registrationDate, 
        uint256 _expiryDate, 
        bool _status, 
        bool _fromAdmin, 
        uint256 _fee
        ) internal {emit __FunctionCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',7);

emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',238);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',29);
_setTickerOwnership(_owner, _ticker);
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',239);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',30);
_storeTickerDetails(_ticker, _owner, _registrationDate, _expiryDate, _tokenName, _status);
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',240);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',31);
emit RegisterTicker(_owner, _ticker, _tokenName, _registrationDate, _expiryDate, _fromAdmin, _fee);
    }

    /**
     * @notice Modifies the ticker details. Only Polymath has the ability to do so.
     * @notice Only allowed to modify the tickers which are not yet deployed.
     * @param _owner is the owner of the token
     * @param _ticker is the token ticker
     * @param _tokenName is the name of the token
     * @param _registrationDate is the date at which ticker is registered
     * @param _expiryDate is the expiry date for the ticker
     * @param _status is the token deployment status
     */
    function modifyTicker(
        address _owner,
        string _ticker,
        string _tokenName,
        uint256 _registrationDate,
        uint256 _expiryDate,
        bool _status
        ) external onlyOwner {emit __FunctionCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',8);

emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',261);
        emit __AssertPreCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',15);
emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',32);
require(bytes(_ticker).length > 0 && bytes(_ticker).length <= 10, "Ticker length range (0,10]");emit __AssertPostCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',15);

emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',262);
        emit __AssertPreCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',16);
emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',33);
require(_expiryDate != 0 && _registrationDate != 0, "Dates should not be 0");emit __AssertPostCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',16);

emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',263);
        emit __AssertPreCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',17);
emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',34);
require(_registrationDate <= _expiryDate, "Registration date should < expiry date");emit __AssertPostCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',17);

emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',264);
        emit __AssertPreCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',18);
emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',35);
require(_owner != address(0), "Invalid address");emit __AssertPostCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',18);

emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',265);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',36);
string memory ticker = Util.upper(_ticker);
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',266);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',37);
_modifyTicker(_owner, ticker, _tokenName, _registrationDate, _expiryDate, _status);
    }

    /**
     * @notice Internal -- Modifies the ticker details.
     */
    function _modifyTicker(
        address _owner,
        string _ticker,
        string _tokenName,
        uint256 _registrationDate,
        uint256 _expiryDate,
        bool _status
        ) internal {emit __FunctionCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',9);

emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',280);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',38);
address currentOwner = _tickerOwner(_ticker);
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',281);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',39);
if (currentOwner != address(0)) {emit __BranchCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',19,0);
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',282);
            emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',40);
_deleteTickerOwnership(currentOwner, _ticker);
        }else { emit __BranchCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',19,1);}

emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',284);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',41);
if (_tickerStatus(_ticker) && !_status) {emit __BranchCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',20,0);
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',285);
            emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',42);
set(Encoder.getKey("tickerToSecurityToken", _ticker), address(0));
        }else { emit __BranchCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',20,1);}

        // If status is true, there must be a security token linked to the ticker already
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',288);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',43);
if (_status) {emit __BranchCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',21,0);
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',289);
            emit __AssertPreCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',22);
emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',44);
require(getAddressValue(Encoder.getKey("tickerToSecurityToken", _ticker)) != address(0), "Token not registered");emit __AssertPostCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',22);

        }else { emit __BranchCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',21,1);}

emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',291);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',45);
_addTicker(_owner, _ticker, _tokenName, _registrationDate, _expiryDate, _status, true, uint256(0));
    }

    function _tickerOwner(string _ticker) internal  returns(address) {emit __FunctionCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',10);

emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',295);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',46);
return getAddressValue(Encoder.getKey("registeredTickers_owner", _ticker));
    }

    /**
     * @notice Removes the ticker details, associated ownership & security token mapping
     * @param _ticker is the token ticker
     */
    function removeTicker(string _ticker) external onlyOwner {emit __FunctionCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',11);

emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',303);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',47);
string memory ticker = Util.upper(_ticker);
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',304);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',48);
address owner = _tickerOwner(ticker);
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',305);
        emit __AssertPreCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',23);
emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',49);
require(owner != address(0), "Ticker doesn't exist");emit __AssertPostCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',23);

emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',306);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',50);
_deleteTickerOwnership(owner, ticker);
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',307);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',51);
set(Encoder.getKey("tickerToSecurityToken", ticker), address(0));
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',308);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',52);
_storeTickerDetails(ticker, address(0), 0, 0, "", false);
        /*solium-disable-next-line security/no-block-members*/
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',310);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',53);
emit TickerRemoved(ticker, now, msg.sender);
    }

    /**
     * @notice Internal - Checks if the entered ticker is registered and has not expired
     * @param _ticker is the token ticker
     * @return bool
     */
    function _tickerAvailable(string _ticker) internal  returns(bool) {emit __FunctionCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',12);

emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',319);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',54);
if (_tickerOwner(_ticker) != address(0)) {emit __BranchCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',24,0);
            /*solium-disable-next-line security/no-block-members*/
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',321);
            emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',55);
if ((now > getUintValue(Encoder.getKey("registeredTickers_expiryDate", _ticker))) && !_tickerStatus(_ticker)) {emit __BranchCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',25,0);
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',322);
                emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',56);
return true;
            } else
                {emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',57);
emit __BranchCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',25,1);emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',324);
return false;}
        }else { emit __BranchCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',24,1);}

emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',326);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',58);
return true;
    }

    function _tickerStatus(string _ticker) internal  returns(bool) {emit __FunctionCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',13);

emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',330);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',59);
return getBoolValue(Encoder.getKey("registeredTickers_status", _ticker));
    }

    /**
     * @notice Internal - Sets the ticker owner
     * @param _owner is the address of the owner of the ticker
     * @param _ticker is the ticker symbol
     */
    function _setTickerOwnership(address _owner, string _ticker) internal {emit __FunctionCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',14);

emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',339);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',60);
bytes32 _ownerKey = Encoder.getKey("userToTickers", _owner);
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',340);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',61);
uint256 length = uint256(getArrayBytes32(_ownerKey).length);
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',341);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',62);
pushArray(_ownerKey, Util.stringToBytes32(_ticker));
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',342);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',63);
set(Encoder.getKey("tickerIndex", _ticker), length);
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',343);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',64);
bytes32 seenKey = Encoder.getKey("seenUsers", _owner);
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',344);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',65);
if (!getBoolValue(seenKey)) {emit __BranchCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',26,0);
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',345);
            emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',66);
pushArray(Encoder.getKey("activeUsers"), _owner);
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',346);
            emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',67);
set(seenKey, true);
        }else { emit __BranchCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',26,1);}

    }

    /**
     * @notice Internal - Stores the ticker details
     */
    function _storeTickerDetails(
        string _ticker,
        address _owner,
        uint256 _registrationDate,
        uint256 _expiryDate,
        string _tokenName,
        bool _status
        ) internal {emit __FunctionCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',15);

emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',361);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',68);
bytes32 key = Encoder.getKey("registeredTickers_owner", _ticker);
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',362);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',69);
if (getAddressValue(key) != _owner)
            {emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',70);
emit __BranchCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',27,0);emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',363);
set(key, _owner);}else { emit __BranchCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',27,1);}

emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',364);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',71);
key = Encoder.getKey("registeredTickers_registrationDate", _ticker);
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',365);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',72);
if (getUintValue(key) != _registrationDate)
            {emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',73);
emit __BranchCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',28,0);emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',366);
set(key, _registrationDate);}else { emit __BranchCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',28,1);}

emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',367);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',74);
key = Encoder.getKey("registeredTickers_expiryDate", _ticker);
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',368);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',75);
if (getUintValue(key) != _expiryDate)
            {emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',76);
emit __BranchCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',29,0);emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',369);
set(key, _expiryDate);}else { emit __BranchCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',29,1);}

emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',370);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',77);
key = Encoder.getKey("registeredTickers_tokenName", _ticker);
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',371);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',78);
if (Encoder.getKey(getStringValue(key)) != Encoder.getKey(_tokenName))
            {emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',79);
emit __BranchCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',30,0);emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',372);
set(key, _tokenName);}else { emit __BranchCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',30,1);}

emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',373);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',80);
key = Encoder.getKey("registeredTickers_status", _ticker);
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',374);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',81);
if (getBoolValue(key) != _status)
            {emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',82);
emit __BranchCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',31,0);emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',375);
set(key, _status);}else { emit __BranchCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',31,1);}

    }

    /**
     * @notice Transfers the ownership of the ticker
     * @param _newOwner is the address of the new owner of the ticker
     * @param _ticker is the ticker symbol
     */
    function transferTickerOwnership(address _newOwner, string _ticker) external whenNotPausedOrOwner {emit __FunctionCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',16);

emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',384);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',83);
string memory ticker = Util.upper(_ticker);
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',385);
        emit __AssertPreCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',32);
emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',84);
require(_newOwner != address(0), "Invalid address");emit __AssertPostCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',32);

emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',386);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',85);
bytes32 ownerKey = Encoder.getKey("registeredTickers_owner", ticker);
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',387);
        emit __AssertPreCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',33);
emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',86);
require(getAddressValue(ownerKey) == msg.sender, "Not authorised");emit __AssertPostCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',33);

emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',388);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',87);
if (_tickerStatus(ticker))
            {emit __AssertPreCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',35);
emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',88);
emit __BranchCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',34,0);emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',389);
require(IOwnable(getAddressValue(Encoder.getKey("tickerToSecurityToken", ticker))).owner() == _newOwner, "New owner does not match token owner");emit __AssertPostCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',35);
}else { emit __BranchCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',34,1);}

emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',390);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',89);
_deleteTickerOwnership(msg.sender, ticker);
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',391);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',90);
_setTickerOwnership(_newOwner, ticker);
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',392);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',91);
set(ownerKey, _newOwner);
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',393);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',92);
emit ChangeTickerOwnership(ticker, msg.sender, _newOwner);
    }

    /**
     * @notice Internal - Removes the owner of a ticker
     */
    function _deleteTickerOwnership(address _owner, string _ticker) internal {emit __FunctionCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',17);

emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',400);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',93);
uint256 index = uint256(getUintValue(Encoder.getKey("tickerIndex", _ticker)));
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',401);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',94);
bytes32 ownerKey = Encoder.getKey("userToTickers", _owner);
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',402);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',95);
bytes32[] memory tickers = getArrayBytes32(ownerKey);
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',403);
        emit __AssertPreCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',36);
emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',96);
assert(index < tickers.length);emit __AssertPostCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',36);

emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',404);
        emit __AssertPreCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',37);
emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',97);
assert(_tickerOwner(_ticker) == _owner);emit __AssertPostCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',37);

emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',405);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',98);
deleteArrayBytes32(ownerKey, index);
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',406);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',99);
if (getArrayBytes32(ownerKey).length > index) {emit __BranchCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',38,0);
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',407);
            emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',100);
bytes32 switchedTicker = getArrayBytes32(ownerKey)[index];
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',408);
            emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',101);
set(Encoder.getKey("tickerIndex", Util.bytes32ToString(switchedTicker)), index);
        }else { emit __BranchCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',38,1);}

    }

    /**
     * @notice Changes the expiry time for the token ticker. Only available to Polymath.
     * @param _newExpiry is the new expiry for newly generated tickers
     */
    function changeExpiryLimit(uint256 _newExpiry) external onlyOwner {emit __FunctionCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',18);

emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',417);
        emit __AssertPreCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',39);
emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',102);
require(_newExpiry >= 1 days, "Expiry should >= 1 day");emit __AssertPostCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',39);

emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',418);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',103);
emit ChangeExpiryLimit(getUintValue(EXPIRYLIMIT), _newExpiry);
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',419);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',104);
set(EXPIRYLIMIT, _newExpiry);
    }

    /**
     * @notice Returns the list of tickers owned by the selected address
     * @param _owner is the address which owns the list of tickers
     */
    function getTickersByOwner(address _owner) external  returns(bytes32[]) {emit __FunctionCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',19);

emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',427);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',105);
uint counter = 0;
        // accessing the data structure userTotickers[_owner].length
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',429);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',106);
bytes32[] memory tickers = getArrayBytes32(Encoder.getKey("userToTickers", _owner));
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',430);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',107);
for (uint i = 0; i < tickers.length; i++) {
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',431);
            emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',108);
string memory ticker = Util.bytes32ToString(tickers[i]);
            /*solium-disable-next-line security/no-block-members*/
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',433);
            emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',109);
if (getUintValue(Encoder.getKey("registeredTickers_expiryDate", ticker)) >= now || _tickerStatus(ticker)) {emit __BranchCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',40,0);
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',434);
                counter ++;
            }else { emit __BranchCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',40,1);}

        }
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',437);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',110);
bytes32[] memory tempList = new bytes32[](counter);
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',438);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',111);
counter = 0;
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',439);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',112);
for (i = 0; i < tickers.length; i++) {
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',440);
            emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',113);
ticker = Util.bytes32ToString(tickers[i]);
            /*solium-disable-next-line security/no-block-members*/
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',442);
            emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',114);
if (getUintValue(Encoder.getKey("registeredTickers_expiryDate", ticker)) >= now || _tickerStatus(ticker)) {emit __BranchCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',41,0);
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',443);
                emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',115);
tempList[counter] = tickers[i];
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',444);
                counter ++;
            }else { emit __BranchCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',41,1);}

        }
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',447);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',116);
return tempList;
    }

    /**
     * @notice Returns the list of tokens owned by the selected address
     * @param _owner is the address which owns the list of tickers
     * @dev Intention is that this is called off-chain so block gas limit is not relevant
     */
    function getTokensByOwner(address _owner) external  returns(address[]) {emit __FunctionCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',20);

        // Loop over all active users, then all associated tickers of those users
        // This ensures we find tokens, even if their owner has been modified
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',458);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',117);
address[] memory activeUsers = getArrayAddress(Encoder.getKey("activeUsers"));
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',459);
        bytes32[] memory tickers;
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',460);
        address token;
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',461);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',118);
uint256 count = 0;
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',462);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',119);
uint256 i = 0;
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',463);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',120);
uint256 j = 0;
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',464);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',121);
for (i = 0; i < activeUsers.length; i++) {
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',465);
            emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',122);
tickers = getArrayBytes32(Encoder.getKey("userToTickers", activeUsers[i]));
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',466);
            emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',123);
for (j = 0; j < tickers.length; j++) {
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',467);
                emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',124);
token = getAddressValue(Encoder.getKey("tickerToSecurityToken", Util.bytes32ToString(tickers[j])));
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',468);
                emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',125);
if (token != address(0)) {emit __BranchCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',42,0);
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',469);
                    emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',126);
if (IOwnable(token).owner() == _owner) {emit __BranchCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',43,0);
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',470);
                        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',127);
count = count + 1;
                    }else { emit __BranchCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',43,1);}

                }else { emit __BranchCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',42,1);}

            }
        }
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',475);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',128);
uint256 index = 0;
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',476);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',129);
address[] memory result = new address[](count);
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',477);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',130);
for (i = 0; i < activeUsers.length; i++) {
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',478);
            emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',131);
tickers = getArrayBytes32(Encoder.getKey("userToTickers", activeUsers[i]));
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',479);
            emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',132);
for (j = 0; j < tickers.length; j++) {
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',480);
                emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',133);
token = getAddressValue(Encoder.getKey("tickerToSecurityToken", Util.bytes32ToString(tickers[j])));
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',481);
                emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',134);
if (token != address(0)) {emit __BranchCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',44,0);
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',482);
                    emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',135);
if (IOwnable(token).owner() == _owner) {emit __BranchCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',45,0);
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',483);
                        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',136);
result[index] = token;
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',484);
                        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',137);
index = index + 1;
                    }else { emit __BranchCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',45,1);}

                }else { emit __BranchCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',44,1);}

            }
        }
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',489);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',138);
return result;
    }

    /**
     * @notice Returns the owner and timestamp for a given ticker
     * @param _ticker is the ticker symbol
     * @return address
     * @return uint256
     * @return uint256
     * @return string
     * @return bool
     */
    function getTickerDetails(string _ticker) external  returns (address, uint256, uint256, string, bool) {emit __FunctionCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',21);

emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',502);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',139);
string memory ticker = Util.upper(_ticker);
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',503);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',140);
bool tickerStatus = _tickerStatus(ticker);
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',504);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',141);
uint256 expiryDate = getUintValue(Encoder.getKey("registeredTickers_expiryDate", ticker));
        /*solium-disable-next-line security/no-block-members*/
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',506);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',142);
if ((tickerStatus == true) || (expiryDate > now)) {emit __BranchCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',46,0);
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',507);
            emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',143);
return
            (
                _tickerOwner(ticker),
                getUintValue(Encoder.getKey("registeredTickers_registrationDate", ticker)),
                expiryDate,
                getStringValue(Encoder.getKey("registeredTickers_tokenName", ticker)),
                tickerStatus
            );
        } else
            {emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',144);
emit __BranchCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',46,1);emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',516);
return (address(0), uint256(0), uint256(0), "", false);}
    }

    /////////////////////////////
    // Security Token Management
    /////////////////////////////

    /**
     * @notice Deploys an instance of a new Security Token and records it to the registry
     * @param _name is the name of the token
     * @param _ticker is the ticker symbol of the security token
     * @param _tokenDetails is the off-chain details of the token
     * @param _divisible is whether or not the token is divisible
     */
    function generateSecurityToken(string _name, string _ticker, string _tokenDetails, bool _divisible) external whenNotPausedOrOwner {emit __FunctionCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',22);

emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',531);
        emit __AssertPreCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',47);
emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',145);
require(bytes(_name).length > 0 && bytes(_ticker).length > 0, "Ticker length > 0");emit __AssertPostCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',47);

emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',532);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',146);
string memory ticker = Util.upper(_ticker);
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',533);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',147);
bytes32 statusKey = Encoder.getKey("registeredTickers_status", ticker);
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',534);
        emit __AssertPreCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',48);
emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',148);
require(!getBoolValue(statusKey), "Already deployed");emit __AssertPostCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',48);

emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',535);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',149);
set(statusKey, true);
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',536);
        emit __AssertPreCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',49);
emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',150);
require(_tickerOwner(ticker) == msg.sender, "Not authorised");emit __AssertPostCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',49);

        /*solium-disable-next-line security/no-block-members*/
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',538);
        emit __AssertPreCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',50);
emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',151);
require(getUintValue(Encoder.getKey("registeredTickers_expiryDate", ticker)) >= now, "Ticker gets expired");emit __AssertPostCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',50);


emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',540);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',152);
uint256 launchFee = getSecurityTokenLaunchFee();
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',541);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',153);
if (launchFee > 0)
            {emit __AssertPreCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',52);
emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',154);
emit __BranchCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',51,0);emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',542);
require(IERC20(getAddressValue(POLYTOKEN)).transferFrom(msg.sender, address(this), launchFee), "Insufficient allowance");emit __AssertPostCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',52);
}else { emit __BranchCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',51,1);}


emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',544);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',155);
address newSecurityTokenAddress = ISTFactory(getSTFactoryAddress()).deployToken(
            _name,
            ticker,
            18,
            _tokenDetails,
            msg.sender,
            _divisible,
            getAddressValue(POLYMATHREGISTRY)
        );

        /*solium-disable-next-line security/no-block-members*/
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',555);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',156);
_storeSecurityTokenData(newSecurityTokenAddress, ticker, _tokenDetails, now);
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',556);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',157);
set(Encoder.getKey("tickerToSecurityToken", ticker), newSecurityTokenAddress);
        /*solium-disable-next-line security/no-block-members*/
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',558);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',158);
emit NewSecurityToken(ticker, _name, newSecurityTokenAddress, msg.sender, now, msg.sender, false, launchFee);
    }

    /**
     * @notice Adds a new custom Security Token and saves it to the registry. (Token should follow the ISecurityToken interface)
     * @param _name is the name of the token
     * @param _ticker is the ticker symbol of the security token
     * @param _owner is the owner of the token
     * @param _securityToken is the address of the securityToken
     * @param _tokenDetails is the off-chain details of the token
     * @param _deployedAt is the timestamp at which the security token is deployed
     */
    function modifySecurityToken(
        string _name,
        string _ticker,
        address _owner,
        address _securityToken,
        string _tokenDetails,
        uint256 _deployedAt
    )
        external
        onlyOwner
    {emit __FunctionCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',23);

emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',581);
        emit __AssertPreCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',53);
emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',159);
require(bytes(_name).length > 0 && bytes(_ticker).length > 0, "String length > 0");emit __AssertPostCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',53);

emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',582);
        emit __AssertPreCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',54);
emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',160);
require(bytes(_ticker).length <= 10, "Ticker length range (0,10]");emit __AssertPostCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',54);

emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',583);
        emit __AssertPreCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',55);
emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',161);
require(_deployedAt != 0 && _owner != address(0), "0 value params not allowed");emit __AssertPostCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',55);

emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',584);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',162);
string memory ticker = Util.upper(_ticker);
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',585);
        emit __AssertPreCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',56);
emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',163);
require(_securityToken != address(0), "ST address is 0x");emit __AssertPostCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',56);

emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',586);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',164);
uint256 registrationTime = getUintValue(Encoder.getKey("registeredTickers_registrationDate", ticker));
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',587);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',165);
uint256 expiryTime = getUintValue(Encoder.getKey("registeredTickers_expiryDate", ticker));
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',588);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',166);
if (registrationTime == 0) {emit __BranchCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',57,0);
            /*solium-disable-next-line security/no-block-members*/
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',590);
            emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',167);
registrationTime = now;
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',591);
            emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',168);
expiryTime = registrationTime.add(getExpiryLimit());
        }else { emit __BranchCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',57,1);}

emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',593);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',169);
set(Encoder.getKey("tickerToSecurityToken", ticker), _securityToken);
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',594);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',170);
_modifyTicker(_owner, ticker, _name, registrationTime, expiryTime, true);
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',595);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',171);
_storeSecurityTokenData(_securityToken, ticker, _tokenDetails, _deployedAt);
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',596);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',172);
emit NewSecurityToken(ticker, _name, _securityToken, _owner, _deployedAt, msg.sender, true, getSecurityTokenLaunchFee());
    }

    /**
     * @notice Internal - Stores the security token details
     */
    function _storeSecurityTokenData(address _securityToken, string _ticker, string _tokenDetails, uint256 _deployedAt) internal {emit __FunctionCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',24);

emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',603);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',173);
set(Encoder.getKey("securityTokens_ticker", _securityToken), _ticker);
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',604);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',174);
set(Encoder.getKey("securityTokens_tokenDetails", _securityToken), _tokenDetails);
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',605);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',175);
set(Encoder.getKey("securityTokens_deployedAt", _securityToken), _deployedAt);
    }

    /**
    * @notice Checks that Security Token is registered
    * @param _securityToken is the address of the security token
    * @return bool
    */
    function isSecurityToken(address _securityToken) external  returns (bool) {emit __FunctionCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',25);

emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',614);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',176);
return (keccak256(bytes(getStringValue(Encoder.getKey("securityTokens_ticker", _securityToken)))) != keccak256(""));
    }

    /**
     * @notice Returns the security token address by ticker symbol
     * @param _ticker is the ticker of the security token
     * @return address
     */
    function getSecurityTokenAddress(string _ticker) external  returns (address) {emit __FunctionCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',26);

emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',623);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',177);
string memory ticker = Util.upper(_ticker);
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',624);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',178);
return getAddressValue(Encoder.getKey("tickerToSecurityToken", ticker));
    }

     /**
     * @notice Returns the security token data by address
     * @param _securityToken is the address of the security token.
     * @return string is the ticker of the security Token.
     * @return address is the issuer of the security Token.
     * @return string is the details of the security token.
     * @return uint256 is the timestamp at which security Token was deployed.
     */
    function getSecurityTokenData(address _securityToken) external  returns (string, address, string, uint256) {emit __FunctionCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',27);

emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',636);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',179);
return (
            getStringValue(Encoder.getKey("securityTokens_ticker", _securityToken)),
            IOwnable(_securityToken).owner(),
            getStringValue(Encoder.getKey("securityTokens_tokenDetails", _securityToken)),
            getUintValue(Encoder.getKey("securityTokens_deployedAt", _securityToken))
        );
    }

    /////////////////////////////
    // Ownership, lifecycle & Utility
    /////////////////////////////

    /**
    * @dev Allows the current owner to transfer control of the contract to a newOwner.
    * @param _newOwner The address to transfer ownership to.
    */
    function transferOwnership(address _newOwner) external onlyOwner {emit __FunctionCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',28);

emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',653);
        emit __AssertPreCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',58);
emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',180);
require(_newOwner != address(0), "Invalid address");emit __AssertPostCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',58);

emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',654);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',181);
emit OwnershipTransferred(getAddressValue(OWNER), _newOwner);
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',655);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',182);
set(OWNER, _newOwner);
    }

    /**
    * @notice Called by the owner to pause, triggers stopped state
    */
    function pause() external whenNotPaused onlyOwner {emit __FunctionCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',29);

emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',662);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',183);
set(PAUSED, true);
        /*solium-disable-next-line security/no-block-members*/
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',664);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',184);
emit Pause(now);
    }

    /**
    * @notice Called by the owner to unpause, returns to normal state
    */
    function unpause() external whenPaused onlyOwner {emit __FunctionCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',30);

emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',671);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',185);
set(PAUSED, false);
        /*solium-disable-next-line security/no-block-members*/
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',673);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',186);
emit Unpause(now);
    }

    /**
    * @notice Sets the ticker registration fee in POLY tokens. Only Polymath.
    * @param _tickerRegFee is the registration fee in POLY tokens (base 18 decimals)
    */
    function changeTickerRegistrationFee(uint256 _tickerRegFee) external onlyOwner {emit __FunctionCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',31);

emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',681);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',187);
uint256 fee = getUintValue(TICKERREGFEE);
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',682);
        emit __AssertPreCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',59);
emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',188);
require(fee != _tickerRegFee, "Fee not changed");emit __AssertPostCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',59);

emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',683);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',189);
emit ChangeTickerRegistrationFee(fee, _tickerRegFee);
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',684);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',190);
set(TICKERREGFEE, _tickerRegFee);
    }

   /**
    * @notice Sets the ticker registration fee in POLY tokens. Only Polymath.
    * @param _stLaunchFee is the registration fee in POLY tokens (base 18 decimals)
    */
    function changeSecurityLaunchFee(uint256 _stLaunchFee) external onlyOwner {emit __FunctionCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',32);

emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',692);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',191);
uint256 fee = getUintValue(STLAUNCHFEE);
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',693);
        emit __AssertPreCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',60);
emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',192);
require(fee != _stLaunchFee, "Fee not changed");emit __AssertPostCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',60);

emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',694);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',193);
emit ChangeSecurityLaunchFee(fee, _stLaunchFee);
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',695);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',194);
set(STLAUNCHFEE, _stLaunchFee);
    }

    /**
    * @notice Reclaims all ERC20Basic compatible tokens
    * @param _tokenContract is the address of the token contract
    */
    function reclaimERC20(address _tokenContract) external onlyOwner {emit __FunctionCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',33);

emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',703);
        emit __AssertPreCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',61);
emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',195);
require(_tokenContract != address(0), "Invalid address");emit __AssertPostCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',61);

emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',704);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',196);
IERC20 token = IERC20(_tokenContract);
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',705);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',197);
uint256 balance = token.balanceOf(address(this));
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',706);
        emit __AssertPreCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',62);
emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',198);
require(token.transfer(owner(), balance), "Transfer failed");emit __AssertPostCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',62);

    }

    /**
    * @notice Changes the protocol version and the SecurityToken contract
    * @notice Used only by Polymath to upgrade the SecurityToken contract and add more functionalities to future versions
    * @notice Changing versions does not affect existing tokens.
    * @param _STFactoryAddress is the address of the proxy.
    * @param _major Major version of the proxy.
    * @param _minor Minor version of the proxy.
    * @param _patch Patch version of the proxy
    */
    function setProtocolVersion(address _STFactoryAddress, uint8 _major, uint8 _minor, uint8 _patch) external onlyOwner {emit __FunctionCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',34);

emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',719);
        emit __AssertPreCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',63);
emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',199);
require(_STFactoryAddress != address(0), "0x address is not allowed");emit __AssertPostCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',63);

emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',720);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',200);
_setProtocolVersion(_STFactoryAddress, _major, _minor, _patch);
    }

    /**
    * @notice Internal - Changes the protocol version and the SecurityToken contract
    */
    function _setProtocolVersion(address _STFactoryAddress, uint8 _major, uint8 _minor, uint8 _patch) internal {emit __FunctionCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',35);

emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',727);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',201);
uint8[] memory _version = new uint8[](3);
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',728);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',202);
_version[0] = _major;
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',729);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',203);
_version[1] = _minor;
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',730);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',204);
_version[2] = _patch;
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',731);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',205);
uint24 _packedVersion = VersionUtils.pack(_major, _minor, _patch);
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',732);
        emit __AssertPreCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',64);
emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',206);
require(VersionUtils.isValidVersion(getProtocolVersion(), _version),"In-valid version");emit __AssertPostCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',64);

emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',733);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',207);
set(Encoder.getKey("latestVersion"), uint256(_packedVersion));
emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',734);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',208);
set(Encoder.getKey("protocolVersionST", getUintValue(Encoder.getKey("latestVersion"))), _STFactoryAddress);
    }

    /**
     * @notice Returns the current STFactory Address
     */
    function getSTFactoryAddress() public  returns(address) {emit __FunctionCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',36);

emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',741);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',209);
return getAddressValue(Encoder.getKey("protocolVersionST", getUintValue(Encoder.getKey("latestVersion"))));
    }

    /**
     * @notice Gets Protocol version
     */
    function getProtocolVersion() public  returns(uint8[]) {emit __FunctionCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',37);

emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',748);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',210);
return VersionUtils.unpack(uint24(getUintValue(Encoder.getKey("latestVersion"))));
    }

    /**
     * @notice Changes the PolyToken address. Only Polymath.
     * @param _newAddress is the address of the polytoken.
     */
    function updatePolyTokenAddress(address _newAddress) external onlyOwner {emit __FunctionCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',38);

emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',756);
        emit __AssertPreCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',65);
emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',211);
require(_newAddress != address(0), "Invalid address");emit __AssertPostCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',65);

emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',757);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',212);
set(POLYTOKEN, _newAddress);
    }

    /**
     * @notice Gets the security token launch fee
     * @return Fee amount
     */
    function getSecurityTokenLaunchFee() public  returns(uint256) {emit __FunctionCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',39);

emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',765);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',213);
return getUintValue(STLAUNCHFEE);
    }

    /**
     * @notice Gets the ticker registration fee
     * @return Fee amount
     */
    function getTickerRegistrationFee() public  returns(uint256) {emit __FunctionCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',40);

emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',773);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',214);
return getUintValue(TICKERREGFEE);
    }

    /**
     * @notice Gets the expiry limit
     * @return Expiry limit
     */
    function getExpiryLimit() public  returns(uint256) {emit __FunctionCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',41);

emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',781);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',215);
return getUintValue(EXPIRYLIMIT);
    }

    /**
     * @notice Check whether the registry is paused or not
     * @return bool
     */
    function isPaused() public  returns(bool) {emit __FunctionCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',42);

emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',789);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',216);
return getBoolValue(PAUSED);
    }

    /**
     * @notice Gets the owner of the contract
     * @return address owner
     */
    function owner() public  returns(address) {emit __FunctionCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',43);

emit __CoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',797);
        emit __StatementCoverageSecurityTokenRegistry('./contracts/SecurityTokenRegistry.sol',217);
return getAddressValue(OWNER);
    }

}
