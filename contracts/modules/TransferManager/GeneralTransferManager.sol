pragma solidity ^0.4.24;

import "./ITransferManager.sol";
import "./GeneralTransferManagerStorage.sol";
import "openzeppelin-solidity/contracts/math/SafeMath.sol";

/**
 * @title Transfer Manager module for core transfer validation functionality
 */
contract GeneralTransferManager is GeneralTransferManagerStorage, ITransferManager {event __CoverageGeneralTransferManager(string fileName, uint256 lineNumber);
event __FunctionCoverageGeneralTransferManager(string fileName, uint256 fnId);
event __StatementCoverageGeneralTransferManager(string fileName, uint256 statementId);
event __BranchCoverageGeneralTransferManager(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageGeneralTransferManager(string fileName, uint256 branchId);
event __AssertPostCoverageGeneralTransferManager(string fileName, uint256 branchId);


    using SafeMath for uint256;

    // Emit when Issuance address get changed
    event ChangeIssuanceAddress(address _issuanceAddress);
    // Emit when there is change in the flag variable called allowAllTransfers
    event AllowAllTransfers(bool _allowAllTransfers);
    // Emit when there is change in the flag variable called allowAllWhitelistTransfers
    event AllowAllWhitelistTransfers(bool _allowAllWhitelistTransfers);
    // Emit when there is change in the flag variable called allowAllWhitelistIssuances
    event AllowAllWhitelistIssuances(bool _allowAllWhitelistIssuances);
    // Emit when there is change in the flag variable called allowAllBurnTransfers
    event AllowAllBurnTransfers(bool _allowAllBurnTransfers);
    // Emit when there is change in the flag variable called signingAddress
    event ChangeSigningAddress(address _signingAddress);
    // Emit when investor details get modified related to their whitelisting
    event ChangeDefaults(uint64 _defaultFromTime, uint64 _defaultToTime);

    // _fromTime is the time from which the _investor can send tokens
    // _toTime is the time from which the _investor can receive tokens
    // if allowAllWhitelistIssuances is TRUE, then _toTime is ignored when receiving tokens from the issuance address
    // if allowAllWhitelistTransfers is TRUE, then _toTime and _fromTime is ignored when sending or receiving tokens
    // in any case, any investor sending or receiving tokens, must have a _expiryTime in the future
    event ModifyWhitelist(
        address indexed _investor,
        uint256 _dateAdded,
        address indexed _addedBy,
        uint256 _fromTime,
        uint256 _toTime,
        uint256 _expiryTime,
        bool _canBuyFromSTO
    );

    /**
     * @notice Constructor
     * @param _securityToken Address of the security token
     * @param _polyAddress Address of the polytoken
     */
    constructor (address _securityToken, address _polyAddress)
    public
    Module(_securityToken, _polyAddress)
    {emit __FunctionCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',1);

    }

    /**
     * @notice This function returns the signature of configure function
     */
    function getInitFunction() public  returns (bytes4) {emit __FunctionCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',2);

emit __CoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',59);
        emit __StatementCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',1);
return bytes4(0);
    }

    /**
     * @notice Used to change the default times used when fromTime / toTime are zero
     * @param _defaultFromTime default for zero fromTime
     * @param _defaultToTime default for zero toTime
     */
    function changeDefaults(uint64 _defaultFromTime, uint64 _defaultToTime) public withPerm(FLAGS) {emit __FunctionCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',3);

emit __CoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',68);
        emit __StatementCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',2);
defaults.fromTime = _defaultFromTime;
emit __CoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',69);
        emit __StatementCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',3);
defaults.toTime = _defaultToTime;
emit __CoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',70);
        emit __StatementCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',4);
emit ChangeDefaults(_defaultFromTime, _defaultToTime);
    }

    /**
     * @notice Used to change the Issuance Address
     * @param _issuanceAddress new address for the issuance
     */
    function changeIssuanceAddress(address _issuanceAddress) public withPerm(FLAGS) {emit __FunctionCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',4);

emit __CoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',78);
        emit __StatementCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',5);
issuanceAddress = _issuanceAddress;
emit __CoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',79);
        emit __StatementCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',6);
emit ChangeIssuanceAddress(_issuanceAddress);
    }

    /**
     * @notice Used to change the Sigining Address
     * @param _signingAddress new address for the signing
     */
    function changeSigningAddress(address _signingAddress) public withPerm(FLAGS) {emit __FunctionCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',5);

emit __CoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',87);
        emit __StatementCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',7);
signingAddress = _signingAddress;
emit __CoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',88);
        emit __StatementCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',8);
emit ChangeSigningAddress(_signingAddress);
    }

    /**
     * @notice Used to change the flag
            true - It refers there are no transfer restrictions, for any addresses
            false - It refers transfers are restricted for all addresses.
     * @param _allowAllTransfers flag value
     */
    function changeAllowAllTransfers(bool _allowAllTransfers) public withPerm(FLAGS) {emit __FunctionCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',6);

emit __CoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',98);
        emit __StatementCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',9);
allowAllTransfers = _allowAllTransfers;
emit __CoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',99);
        emit __StatementCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',10);
emit AllowAllTransfers(_allowAllTransfers);
    }

    /**
     * @notice Used to change the flag
            true - It refers that time lock is ignored for transfers (address must still be on whitelist)
            false - It refers transfers are restricted for all addresses.
     * @param _allowAllWhitelistTransfers flag value
     */
    function changeAllowAllWhitelistTransfers(bool _allowAllWhitelistTransfers) public withPerm(FLAGS) {emit __FunctionCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',7);

emit __CoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',109);
        emit __StatementCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',11);
allowAllWhitelistTransfers = _allowAllWhitelistTransfers;
emit __CoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',110);
        emit __StatementCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',12);
emit AllowAllWhitelistTransfers(_allowAllWhitelistTransfers);
    }

    /**
     * @notice Used to change the flag
            true - It refers that time lock is ignored for issuances (address must still be on whitelist)
            false - It refers transfers are restricted for all addresses.
     * @param _allowAllWhitelistIssuances flag value
     */
    function changeAllowAllWhitelistIssuances(bool _allowAllWhitelistIssuances) public withPerm(FLAGS) {emit __FunctionCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',8);

emit __CoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',120);
        emit __StatementCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',13);
allowAllWhitelistIssuances = _allowAllWhitelistIssuances;
emit __CoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',121);
        emit __StatementCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',14);
emit AllowAllWhitelistIssuances(_allowAllWhitelistIssuances);
    }

    /**
     * @notice Used to change the flag
            true - It allow to burn the tokens
            false - It deactivate the burning mechanism.
     * @param _allowAllBurnTransfers flag value
     */
    function changeAllowAllBurnTransfers(bool _allowAllBurnTransfers) public withPerm(FLAGS) {emit __FunctionCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',9);

emit __CoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',131);
        emit __StatementCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',15);
allowAllBurnTransfers = _allowAllBurnTransfers;
emit __CoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',132);
        emit __StatementCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',16);
emit AllowAllBurnTransfers(_allowAllBurnTransfers);
    }

    /**
     * @notice Default implementation of verifyTransfer used by SecurityToken
     * If the transfer request comes from the STO, it only checks that the investor is in the whitelist
     * If the transfer request comes from a token holder, it checks that:
     * a) Both are on the whitelist
     * b) Seller's sale lockup period is over
     * c) Buyer's purchase lockup is over
     * @param _from Address of the sender
     * @param _to Address of the receiver
    */
    function verifyTransfer(address _from, address _to, uint256 /*_amount*/, bytes /* _data */, bool /* _isTransfer */) public returns(Result) {emit __FunctionCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',10);

emit __CoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',146);
        emit __StatementCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',17);
if (!paused) {emit __BranchCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',1,0);
emit __CoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',147);
            emit __StatementCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',18);
if (allowAllTransfers) {emit __BranchCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',2,0);
                //All transfers allowed, regardless of whitelist
emit __CoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',149);
                emit __StatementCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',19);
return Result.VALID;
            }else { emit __BranchCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',2,1);}

emit __CoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',151);
            emit __StatementCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',20);
if (allowAllBurnTransfers && (_to == address(0))) {emit __BranchCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',3,0);
emit __CoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',152);
                emit __StatementCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',21);
return Result.VALID;
            }else { emit __BranchCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',3,1);}

emit __CoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',154);
            emit __StatementCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',22);
if (allowAllWhitelistTransfers) {emit __BranchCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',4,0);
                //Anyone on the whitelist can transfer, regardless of time
emit __CoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',156);
                emit __StatementCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',23);
return (_onWhitelist(_to) && _onWhitelist(_from)) ? Result.VALID : Result.NA;
            }else { emit __BranchCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',4,1);}


emit __CoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',159);
            emit __StatementCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',24);
(uint64 adjustedFromTime, uint64 adjustedToTime) = _adjustTimes(whitelist[_from].fromTime, whitelist[_to].toTime);
emit __CoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',160);
            emit __StatementCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',25);
if (_from == issuanceAddress) {emit __BranchCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',5,0);
                // Possible STO transaction, but investor not allowed to purchased from STO
emit __CoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',162);
                emit __StatementCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',26);
if ((whitelist[_to].canBuyFromSTO == 0) && _isSTOAttached()) {emit __BranchCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',6,0);
emit __CoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',163);
                    emit __StatementCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',27);
return Result.NA;
                }else { emit __BranchCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',6,1);}

                // if allowAllWhitelistIssuances is true, so time stamp ignored
emit __CoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',166);
                emit __StatementCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',28);
if (allowAllWhitelistIssuances) {emit __BranchCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',7,0);
emit __CoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',167);
                    emit __StatementCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',29);
return _onWhitelist(_to) ? Result.VALID : Result.NA;
                } else {emit __BranchCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',7,1);
emit __CoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',169);
                    emit __StatementCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',30);
return (_onWhitelist(_to) && (adjustedToTime <= uint64(now))) ? Result.VALID : Result.NA;
                }
            }else { emit __BranchCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',5,1);}


            //Anyone on the whitelist can transfer provided the blocknumber is large enough
            /*solium-disable-next-line security/no-block-members*/
emit __CoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',175);
            emit __StatementCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',31);
return ((_onWhitelist(_from) && (adjustedFromTime <= uint64(now))) &&
                (_onWhitelist(_to) && (adjustedToTime <= uint64(now)))) ? Result.VALID : Result.NA; /*solium-disable-line security/no-block-members*/
        }else { emit __BranchCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',1,1);}

emit __CoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',178);
        emit __StatementCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',32);
return Result.NA;
    }

    /**
    * @notice Adds or removes addresses from the whitelist.
    * @param _investor is the address to whitelist
    * @param _fromTime is the moment when the sale lockup period ends and the investor can freely sell his tokens
    * @param _toTime is the moment when the purchase lockup period ends and the investor can freely purchase tokens from others
    * @param _expiryTime is the moment till investors KYC will be validated. After that investor need to do re-KYC
    * @param _canBuyFromSTO is used to know whether the investor is restricted investor or not.
    */
    function modifyWhitelist(
        address _investor,
        uint256 _fromTime,
        uint256 _toTime,
        uint256 _expiryTime,
        bool _canBuyFromSTO
    )
        public
        withPerm(WHITELIST)
    {emit __FunctionCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',11);

emit __CoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',199);
        emit __StatementCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',33);
_modifyWhitelist(_investor, _fromTime, _toTime, _expiryTime, _canBuyFromSTO);
    }

    /**
    * @notice Adds or removes addresses from the whitelist.
    * @param _investor is the address to whitelist
    * @param _fromTime is the moment when the sale lockup period ends and the investor can freely sell his tokens
    * @param _toTime is the moment when the purchase lockup period ends and the investor can freely purchase tokens from others
    * @param _expiryTime is the moment till investors KYC will be validated. After that investor need to do re-KYC
    * @param _canBuyFromSTO is used to know whether the investor is restricted investor or not.
    */
    function _modifyWhitelist(
        address _investor,
        uint256 _fromTime,
        uint256 _toTime,
        uint256 _expiryTime,
        bool _canBuyFromSTO
    )
        internal
    {emit __FunctionCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',12);

emit __CoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',219);
        emit __AssertPreCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',8);
emit __StatementCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',34);
require(_investor != address(0), "Invalid investor");emit __AssertPostCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',8);

emit __CoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',220);
        emit __StatementCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',35);
uint8 canBuyFromSTO = 0;
emit __CoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',221);
        emit __StatementCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',36);
if (_canBuyFromSTO) {emit __BranchCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',9,0);
emit __CoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',222);
            emit __StatementCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',37);
canBuyFromSTO = 1;
        }else { emit __BranchCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',9,1);}

emit __CoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',224);
        emit __StatementCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',38);
if (whitelist[_investor].added == uint8(0)) {emit __BranchCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',10,0);
emit __CoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',225);
            investors.push(_investor);
        }else { emit __BranchCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',10,1);}

emit __CoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',227);
        emit __StatementCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',39);
whitelist[_investor] = TimeRestriction(uint64(_fromTime), uint64(_toTime), uint64(_expiryTime), canBuyFromSTO, uint8(1));
emit __CoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',228);
        emit __StatementCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',40);
emit ModifyWhitelist(_investor, now, msg.sender, _fromTime, _toTime, _expiryTime, _canBuyFromSTO);
    }

    /**
    * @notice Adds or removes addresses from the whitelist.
    * @param _investors List of the addresses to whitelist
    * @param _fromTimes An array of the moment when the sale lockup period ends and the investor can freely sell his tokens
    * @param _toTimes An array of the moment when the purchase lockup period ends and the investor can freely purchase tokens from others
    * @param _expiryTimes An array of the moment till investors KYC will be validated. After that investor need to do re-KYC
    * @param _canBuyFromSTO An array of boolean values
    */
    function modifyWhitelistMulti(
        address[] _investors,
        uint256[] _fromTimes,
        uint256[] _toTimes,
        uint256[] _expiryTimes,
        bool[] _canBuyFromSTO
    ) public withPerm(WHITELIST) {emit __FunctionCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',13);

emit __CoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',246);
        emit __AssertPreCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',11);
emit __StatementCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',41);
require(_investors.length == _fromTimes.length, "Mismatched input lengths");emit __AssertPostCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',11);

emit __CoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',247);
        emit __AssertPreCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',12);
emit __StatementCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',42);
require(_fromTimes.length == _toTimes.length, "Mismatched input lengths");emit __AssertPostCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',12);

emit __CoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',248);
        emit __AssertPreCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',13);
emit __StatementCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',43);
require(_toTimes.length == _expiryTimes.length, "Mismatched input lengths");emit __AssertPostCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',13);

emit __CoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',249);
        emit __AssertPreCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',14);
emit __StatementCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',44);
require(_canBuyFromSTO.length == _toTimes.length, "Mismatched input length");emit __AssertPostCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',14);

emit __CoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',250);
        emit __StatementCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',45);
for (uint256 i = 0; i < _investors.length; i++) {
emit __CoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',251);
            emit __StatementCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',46);
_modifyWhitelist(_investors[i], _fromTimes[i], _toTimes[i], _expiryTimes[i], _canBuyFromSTO[i]);
        }
    }

    /**
    * @notice Adds or removes addresses from the whitelist - can be called by anyone with a valid signature
    * @param _investor is the address to whitelist
    * @param _fromTime is the moment when the sale lockup period ends and the investor can freely sell his tokens
    * @param _toTime is the moment when the purchase lockup period ends and the investor can freely purchase tokens from others
    * @param _expiryTime is the moment till investors KYC will be validated. After that investor need to do re-KYC
    * @param _canBuyFromSTO is used to know whether the investor is restricted investor or not.
    * @param _validFrom is the time that this signature is valid from
    * @param _validTo is the time that this signature is valid until
    * @param _nonce nonce of signature (avoid replay attack)
    * @param _v issuer signature
    * @param _r issuer signature
    * @param _s issuer signature
    */
    function modifyWhitelistSigned(
        address _investor,
        uint256 _fromTime,
        uint256 _toTime,
        uint256 _expiryTime,
        bool _canBuyFromSTO,
        uint256 _validFrom,
        uint256 _validTo,
        uint256 _nonce,
        uint8 _v,
        bytes32 _r,
        bytes32 _s
    ) public {emit __FunctionCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',14);

        /*solium-disable-next-line security/no-block-members*/
emit __CoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',283);
        emit __AssertPreCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',15);
emit __StatementCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',47);
require(_validFrom <= now, "ValidFrom is too early");emit __AssertPostCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',15);

        /*solium-disable-next-line security/no-block-members*/
emit __CoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',285);
        emit __AssertPreCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',16);
emit __StatementCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',48);
require(_validTo >= now, "ValidTo is too late");emit __AssertPostCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',16);

emit __CoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',286);
        emit __AssertPreCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',17);
emit __StatementCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',49);
require(!nonceMap[_investor][_nonce], "Already used signature");emit __AssertPostCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',17);

emit __CoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',287);
        emit __StatementCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',50);
nonceMap[_investor][_nonce] = true;
emit __CoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',288);
        emit __StatementCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',51);
bytes32 hash = keccak256(
            abi.encodePacked(this, _investor, _fromTime, _toTime, _expiryTime, _canBuyFromSTO, _validFrom, _validTo, _nonce)
        );
emit __CoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',291);
        emit __StatementCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',52);
_checkSig(hash, _v, _r, _s);
emit __CoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',292);
        emit __StatementCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',53);
_modifyWhitelist(_investor, _fromTime, _toTime, _expiryTime, _canBuyFromSTO);
    }

    /**
     * @notice Used to verify the signature
     */
    function _checkSig(bytes32 _hash, uint8 _v, bytes32 _r, bytes32 _s) internal  {emit __FunctionCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',15);

        //Check that the signature is valid
        //sig should be signing - _investor, _fromTime, _toTime & _expiryTime and be signed by the issuer address
emit __CoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',301);
        emit __StatementCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',54);
address signer = ecrecover(keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32", _hash)), _v, _r, _s);
emit __CoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',302);
        emit __AssertPreCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',18);
emit __StatementCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',55);
require(signer == Ownable(securityToken).owner() || signer == signingAddress, "Incorrect signer");emit __AssertPostCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',18);

    }

    /**
     * @notice Internal function used to check whether the investor is in the whitelist or not
            & also checks whether the KYC of investor get expired or not
     * @param _investor Address of the investor
     */
    function _onWhitelist(address _investor) internal  returns(bool) {emit __FunctionCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',16);

        emit __StatementCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',56);
return (whitelist[_investor].expiryTime >= uint64(now)); /*solium-disable-line security/no-block-members*/
    }

    /**
     * @notice Internal function use to know whether the STO is attached or not
     */
    function _isSTOAttached() internal  returns(bool) {emit __FunctionCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',17);

emit __CoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',318);
        emit __StatementCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',57);
bool attached = ISecurityToken(securityToken).getModulesByType(3).length > 0;
emit __CoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',319);
        emit __StatementCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',58);
return attached;
    }

    /**
     * @notice Internal function to adjust times using default values
     */
    function _adjustTimes(uint64 _fromTime, uint64 _toTime) internal  returns(uint64, uint64) {emit __FunctionCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',18);

emit __CoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',326);
        emit __StatementCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',59);
uint64 adjustedFromTime = _fromTime;
emit __CoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',327);
        emit __StatementCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',60);
uint64 adjustedToTime = _toTime;
emit __CoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',328);
        emit __StatementCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',61);
if (_fromTime == 0) {emit __BranchCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',19,0);
emit __CoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',329);
            emit __StatementCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',62);
adjustedFromTime = defaults.fromTime;
        }else { emit __BranchCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',19,1);}

emit __CoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',331);
        emit __StatementCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',63);
if (_toTime == 0) {emit __BranchCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',20,0);
emit __CoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',332);
            emit __StatementCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',64);
adjustedToTime = defaults.toTime;
        }else { emit __BranchCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',20,1);}

emit __CoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',334);
        emit __StatementCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',65);
return (adjustedFromTime, adjustedToTime);
    }

    /**
     * @dev Returns list of all investors
     */
    function getInvestors() external  returns(address[]) {emit __FunctionCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',19);

emit __CoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',341);
        emit __StatementCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',66);
return investors;
    }

    /**
     * @dev Returns list of all investors data
     */
    function getAllInvestorsData() external  returns(address[], uint256[], uint256[], uint256[], bool[]) {emit __FunctionCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',20);

emit __CoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',348);
        emit __StatementCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',67);
(uint256[] memory fromTimes, uint256[] memory toTimes, uint256[] memory expiryTimes, bool[] memory canBuyFromSTOs)
          = _investorsData(investors);
emit __CoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',350);
        emit __StatementCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',68);
return (investors, fromTimes, toTimes, expiryTimes, canBuyFromSTOs);

    }

    /**
     * @dev Returns list of specified investors data
     */
    function getInvestorsData(address[] _investors) external  returns(uint256[], uint256[], uint256[], bool[]) {emit __FunctionCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',21);

emit __CoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',358);
        emit __StatementCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',69);
return _investorsData(_investors);
    }

    function _investorsData(address[] _investors) internal  returns(uint256[], uint256[], uint256[], bool[]) {emit __FunctionCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',22);

emit __CoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',362);
        emit __StatementCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',70);
uint256[] memory fromTimes = new uint256[](_investors.length);
emit __CoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',363);
        emit __StatementCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',71);
uint256[] memory toTimes = new uint256[](_investors.length);
emit __CoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',364);
        emit __StatementCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',72);
uint256[] memory expiryTimes = new uint256[](_investors.length);
emit __CoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',365);
        emit __StatementCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',73);
bool[] memory canBuyFromSTOs = new bool[](_investors.length);
emit __CoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',366);
        emit __StatementCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',74);
for (uint256 i = 0; i < _investors.length; i++) {
emit __CoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',367);
            emit __StatementCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',75);
fromTimes[i] = whitelist[_investors[i]].fromTime;
emit __CoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',368);
            emit __StatementCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',76);
toTimes[i] = whitelist[_investors[i]].toTime;
emit __CoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',369);
            emit __StatementCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',77);
expiryTimes[i] = whitelist[_investors[i]].expiryTime;
emit __CoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',370);
            emit __StatementCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',78);
if (whitelist[_investors[i]].canBuyFromSTO == 0) {emit __BranchCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',21,0);
emit __CoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',371);
                emit __StatementCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',79);
canBuyFromSTOs[i] = false;
            } else {emit __BranchCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',21,1);
emit __CoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',373);
                emit __StatementCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',80);
canBuyFromSTOs[i] = true;
            }
        }
emit __CoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',376);
        emit __StatementCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',81);
return (fromTimes, toTimes, expiryTimes, canBuyFromSTOs);
    }

    /**
     * @notice Return the permissions flag that are associated with general trnasfer manager
     */
    function getPermissions() public  returns(bytes32[]) {emit __FunctionCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',23);

emit __CoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',383);
        emit __StatementCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',82);
bytes32[] memory allPermissions = new bytes32[](2);
emit __CoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',384);
        emit __StatementCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',83);
allPermissions[0] = WHITELIST;
emit __CoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',385);
        emit __StatementCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',84);
allPermissions[1] = FLAGS;
emit __CoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',386);
        emit __StatementCoverageGeneralTransferManager('./contracts/modules/TransferManager/GeneralTransferManager.sol',85);
return allPermissions;
    }

}
