pragma solidity ^0.4.24;

import "./ITransferManager.sol";
import "./VolumeRestrictionTMStorage.sol";
import "openzeppelin-solidity/contracts/math/SafeMath.sol";
import "../../libraries/BokkyPooBahsDateTimeLibrary.sol";

contract VolumeRestrictionTM is VolumeRestrictionTMStorage, ITransferManager {event __CoverageVolumeRestrictionTM(string fileName, uint256 lineNumber);
event __FunctionCoverageVolumeRestrictionTM(string fileName, uint256 fnId);
event __StatementCoverageVolumeRestrictionTM(string fileName, uint256 statementId);
event __BranchCoverageVolumeRestrictionTM(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageVolumeRestrictionTM(string fileName, uint256 branchId);
event __AssertPostCoverageVolumeRestrictionTM(string fileName, uint256 branchId);

    
    using SafeMath for uint256;

    // permission definition
    bytes32 public constant ADMIN = "ADMIN";

    // Emit when the token holder is added/removed from the exemption list
    event ChangedExemptWalletList(address indexed _wallet, bool _change);
    // Emit when the new individual restriction is added corresponds to new token holders
    event AddIndividualRestriction(
        address indexed _holder,
        uint256 _allowedTokens,
        uint256 _startTime,
        uint256 _rollingPeriodInDays,
        uint256 _endTime,
        uint256 _typeOfRestriction
    );
    // Emit when the new daily (Individual) restriction is added
    event AddIndividualDailyRestriction(
        address indexed _holder,
        uint256 _allowedTokens,
        uint256 _startTime,
        uint256 _rollingPeriodInDays,
        uint256 _endTime,
        uint256 _typeOfRestriction
    );
    // Emit when the individual restriction is modified for a given address
    event ModifyIndividualRestriction(
        address indexed _holder,
        uint256 _allowedTokens,
        uint256 _startTime,
        uint256 _rollingPeriodInDays,
        uint256 _endTime,
        uint256 _typeOfRestriction
    );
    // Emit when individual daily restriction get modified
    event ModifyIndividualDailyRestriction(
        address indexed _holder,
        uint256 _allowedTokens,
        uint256 _startTime,
        uint256 _rollingPeriodInDays,
        uint256 _endTime,
        uint256 _typeOfRestriction
    );
    // Emit when the new global restriction is added
    event AddDefaultRestriction(
        uint256 _allowedTokens,
        uint256 _startTime,
        uint256 _rollingPeriodInDays,
        uint256 _endTime,
        uint256 _typeOfRestriction
    );
    // Emit when the new daily (Default) restriction is added
    event AddDefaultDailyRestriction(
        uint256 _allowedTokens,
        uint256 _startTime,
        uint256 _rollingPeriodInDays,
        uint256 _endTime,
        uint256 _typeOfRestriction
    );
    // Emit when default restriction get modified
    event ModifyDefaultRestriction(
        uint256 _allowedTokens,
        uint256 _startTime,
        uint256 _rollingPeriodInDays,
        uint256 _endTime,
        uint256 _typeOfRestriction
    );
    // Emit when daily default restriction get modified
    event ModifyDefaultDailyRestriction(
        uint256 _allowedTokens,
        uint256 _startTime,
        uint256 _rollingPeriodInDays,
        uint256 _endTime,
        uint256 _typeOfRestriction
    );
    // Emit when the individual restriction gets removed
    event IndividualRestrictionRemoved(address indexed _holder);
    // Emit when individual daily restriction removed
    event IndividualDailyRestrictionRemoved(address indexed _holder);
    // Emit when the default restriction gets removed
    event DefaultRestrictionRemoved();
    // Emit when the daily default restriction gets removed
    event DefaultDailyRestrictionRemoved();

    /**
     * @notice Constructor
     * @param _securityToken Address of the security token
     * @param _polyAddress Address of the polytoken
     */
    constructor (address _securityToken, address _polyAddress)
    public
    Module(_securityToken, _polyAddress)
    {emit __FunctionCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',1);


    }

    /**
     * @notice Used to verify the transfer/transferFrom transaction and prevent tranaction
     * whose volume of tokens will voilate the maximum volume transfer restriction
     * @param _from Address of the sender
     * @param _amount The amount of tokens to transfer
     * @param _isTransfer Whether or not this is an actual transfer or just a test to see if the tokens would be transferrable
     */
    function verifyTransfer(address _from, address /*_to */, uint256 _amount, bytes /*_data*/, bool _isTransfer) public returns (Result) {emit __FunctionCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',2);

        // If `_from` is present in the exemptionList or it is `0x0` address then it will not follow the vol restriction
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',115);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',1);
if (!paused && _from != address(0) && !exemptList[_from]) {emit __BranchCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',1,0);
            // Function must only be called by the associated security token if _isTransfer == true
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',117);
            emit __AssertPreCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',2);
emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',2);
require(msg.sender == securityToken || !_isTransfer);emit __AssertPostCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',2);

            // Checking the individual restriction if the `_from` comes in the individual category 
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',119);
            emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',3);
if ((individualRestriction[_from].endTime >= now && individualRestriction[_from].startTime <= now) 
                || (individualDailyRestriction[_from].endTime >= now && individualDailyRestriction[_from].startTime <= now)) {emit __BranchCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',3,0);

emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',122);
                emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',4);
return _individualRestrictionCheck(_from, _amount, _isTransfer);
                // If the `_from` doesn't fall under the individual category. It will processed with in the global category automatically
            } else {emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',5);
emit __BranchCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',3,1);if ((defaultRestriction.endTime >= now && defaultRestriction.startTime <= now)
                || (defaultDailyRestriction.endTime >= now && defaultDailyRestriction.startTime <= now)) {emit __BranchCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',4,0);
                
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',127);
                emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',6);
return _defaultRestrictionCheck(_from, _amount, _isTransfer);
            }else { emit __BranchCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',4,1);}
}
        }else { emit __BranchCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',1,1);}
 
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',130);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',7);
return Result.NA;
    }

    /**
     * @notice Add/Remove wallet address from the exempt list
     * @param _wallet Ethereum wallet/contract address that need to be exempted
     * @param _change Boolean value used to add (i.e true) or remove (i.e false) from the list 
     */
    function changeExemptWalletList(address _wallet, bool _change) public withPerm(ADMIN) {emit __FunctionCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',3);

emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',139);
        emit __AssertPreCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',5);
emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',8);
require(_wallet != address(0), "Invalid address");emit __AssertPostCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',5);

emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',140);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',9);
exemptList[_wallet] = _change;
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',141);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',10);
emit ChangedExemptWalletList(_wallet, _change);
    }

    /**
     * @notice Use to add the new individual restriction for a given token holder
     * @param _holder Address of the token holder, whom restriction will be implied
     * @param _allowedTokens Amount of tokens allowed to be trade for a given address.
     * @param _startTime Unix timestamp at which restriction get into effect
     * @param _rollingPeriodInDays Rolling period in days (Minimum value should be 1 day)
     * @param _endTime Unix timestamp at which restriction effects will gets end.
     * @param _restrictionType It will be 0 or 1 (i.e 0 for fixed while 1 for Percentage)
     */
    function addIndividualRestriction(
        address _holder,
        uint256 _allowedTokens,
        uint256 _startTime,
        uint256 _rollingPeriodInDays,
        uint256 _endTime,
        uint256 _restrictionType 
    )
        external
        withPerm(ADMIN)
    {emit __FunctionCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',4);

emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',164);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',11);
_addIndividualRestriction(
            _holder,
            _allowedTokens,
            _startTime,
            _rollingPeriodInDays,
            _endTime,
            _restrictionType
        );
    }

    /// @notice Internal function to facilitate the addition of individual restriction
    function _addIndividualRestriction(
        address _holder,
        uint256 _allowedTokens,
        uint256 _startTime,
        uint256 _rollingPeriodInDays,
        uint256 _endTime,
        uint256 _restrictionType 
    )
        internal
    {emit __FunctionCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',5);
   
        
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',186);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',12);
uint256 startTime = _startTime;
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',187);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',13);
if (_startTime == 0) {emit __BranchCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',6,0);
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',188);
            emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',14);
startTime = now;
        }else { emit __BranchCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',6,1);}

emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',190);
        emit __AssertPreCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',7);
emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',15);
require(
            individualRestriction[_holder].endTime < now,
            "Already present"
        );emit __AssertPostCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',7);

emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',194);
        emit __AssertPreCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',8);
emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',16);
require(_holder != address(0) && !exemptList[_holder], "Invalid address");emit __AssertPostCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',8);

emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',195);
        emit __AssertPreCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',9);
emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',17);
require(startTime >= now, "Invalid startTime");emit __AssertPostCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',9);
  
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',196);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',18);
_checkInputParams(_allowedTokens, startTime, _rollingPeriodInDays, _endTime, _restrictionType);
        
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',198);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',19);
if (individualRestriction[_holder].endTime != 0) {emit __BranchCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',10,0);
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',199);
            emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',20);
_removeIndividualRestriction(_holder);
        }else { emit __BranchCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',10,1);}

emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',201);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',21);
individualRestriction[_holder] = VolumeRestriction(
            _allowedTokens,
            startTime,
            _rollingPeriodInDays,
            _endTime,
            RestrictionType(_restrictionType)
        );
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',208);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',22);
emit AddIndividualRestriction(
            _holder,
            _allowedTokens,
            startTime,
            _rollingPeriodInDays,
            _endTime,
            _restrictionType
        );
    }

    /**
     * @notice Use to add the new individual daily restriction for all token holder
     * @param _holder Address of the token holder, whom restriction will be implied
     * @param _allowedTokens Amount of tokens allowed to be traded for all token holder.
     * @param _startTime Unix timestamp at which restriction get into effect
     * @param _endTime Unix timestamp at which restriction effects will gets end.
     * @param _restrictionType It will be 0 or 1 (i.e 0 for fixed while 1 for Percentage)
     */
    function addIndividualDailyRestriction(
        address _holder,
        uint256 _allowedTokens,
        uint256 _startTime,
        uint256 _endTime,
        uint256 _restrictionType 
    )
        external
        withPerm(ADMIN)
    {emit __FunctionCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',6);
   
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',236);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',23);
_addIndividualDailyRestriction(
            _holder,
            _allowedTokens,
            _startTime,
            _endTime,
            _restrictionType
        );
    }

    /// @notice Internal function to facilitate the addition of individual daily restriction
    function _addIndividualDailyRestriction(
        address _holder,
        uint256 _allowedTokens,
        uint256 _startTime,
        uint256 _endTime,
        uint256 _restrictionType 
    )
        internal
    {emit __FunctionCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',7);
   

emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',256);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',24);
uint256 startTime = _startTime;
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',257);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',25);
if (_startTime == 0) {emit __BranchCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',11,0);
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',258);
            emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',26);
startTime = now;
        }else { emit __BranchCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',11,1);}

emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',260);
        emit __AssertPreCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',12);
emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',27);
require(
            individualDailyRestriction[_holder].endTime < now,
            "Not Allowed"
        );emit __AssertPostCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',12);

emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',264);
        emit __AssertPreCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',13);
emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',28);
require(startTime >= now, "Invalid startTime");emit __AssertPostCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',13);
  
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',265);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',29);
_checkInputParams(_allowedTokens, startTime, 1, _endTime, _restrictionType);
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',266);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',30);
individualDailyRestriction[_holder] = VolumeRestriction(
            _allowedTokens,
            startTime,
            1,
            _endTime,
            RestrictionType(_restrictionType)
        );
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',273);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',31);
emit AddIndividualDailyRestriction(
            _holder,
            _allowedTokens,
            startTime,
            1,
            _endTime,
            _restrictionType
        );
    }

    /**
     * @notice Use to add the new individual daily restriction for multiple token holders
     * @param _holders Array of address of the token holders, whom restriction will be implied
     * @param _allowedTokens Array of amount of tokens allowed to be trade for a given address.
     * @param _startTimes Array of unix timestamps at which restrictions get into effect
     * @param _endTimes Array of unix timestamps at which restriction effects will gets end.
     * @param _restrictionTypes Array of restriction types value will be 0 or 1 (i.e 0 for fixed while 1 for Percentage)
     */
    function addIndividualDailyRestrictionMulti(
        address[] _holders,
        uint256[] _allowedTokens,
        uint256[] _startTimes,
        uint256[] _endTimes,
        uint256[] _restrictionTypes 
    )
        public
        withPerm(ADMIN)
    {emit __FunctionCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',8);

emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',301);
        emit __AssertPreCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',14);
emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',32);
require(
            _allowedTokens.length == _startTimes.length &&
            _startTimes.length == _holders.length &&
            _holders.length == _endTimes.length &&
            _endTimes.length == _restrictionTypes.length,
            "Array length mismatch"
        );emit __AssertPostCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',14);

emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',308);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',33);
for (uint256 i = 0; i < _holders.length; i++) {
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',309);
            emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',34);
_addIndividualDailyRestriction(
                _holders[i],
                _allowedTokens[i],
                _startTimes[i],
                _endTimes[i],
                _restrictionTypes[i] 
            );
        }
    }

    /**
     * @notice Use to add the new individual restriction for multiple token holders
     * @param _holders Array of address of the token holders, whom restriction will be implied
     * @param _allowedTokens Array of amount of tokens allowed to be trade for a given address.
     * @param _startTimes Array of unix timestamps at which restrictions get into effect
     * @param _rollingPeriodInDays Array of rolling period in days (Minimum value should be 1 day)
     * @param _endTimes Array of unix timestamps at which restriction effects will gets end.
     * @param _restrictionTypes Array of restriction types value will be 0 or 1 (i.e 0 for fixed while 1 for Percentage)
     */
    function addIndividualRestrictionMulti(
        address[] _holders,
        uint256[] _allowedTokens,
        uint256[] _startTimes,
        uint256[] _rollingPeriodInDays,
        uint256[] _endTimes,
        uint256[] _restrictionTypes 
    )
        public
        withPerm(ADMIN)
    {emit __FunctionCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',9);

emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',339);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',35);
_checkLengthOfArray(_allowedTokens, _startTimes, _rollingPeriodInDays, _endTimes, _restrictionTypes);
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',340);
        emit __AssertPreCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',15);
emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',36);
require(_holders.length == _allowedTokens.length, "Length mismatch");emit __AssertPostCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',15);

emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',341);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',37);
for (uint256 i = 0; i < _holders.length; i++) {
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',342);
            emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',38);
_addIndividualRestriction(
                _holders[i],
                _allowedTokens[i],
                _startTimes[i],
                _rollingPeriodInDays[i],
                _endTimes[i],
                _restrictionTypes[i] 
            );
        }
    }

    /**
     * @notice Use to add the new default restriction for all token holder
     * @param _allowedTokens Amount of tokens allowed to be traded for all token holder.
     * @param _startTime Unix timestamp at which restriction get into effect
     * @param _rollingPeriodInDays Rolling period in days (Minimum value should be 1 day)
     * @param _endTime Unix timestamp at which restriction effects will gets end.
     * @param _restrictionType It will be 0 or 1 (i.e 0 for fixed while 1 for Percentage)
     */
    function addDefaultRestriction(
        uint256 _allowedTokens,
        uint256 _startTime,
        uint256 _rollingPeriodInDays,
        uint256 _endTime,
        uint256 _restrictionType 
    )
        external
        withPerm(ADMIN)
    {emit __FunctionCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',10);
   
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',371);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',39);
uint256 startTime = _startTime;
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',372);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',40);
if (_startTime == 0) {emit __BranchCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',16,0);
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',373);
            emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',41);
startTime = now;
        }else { emit __BranchCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',16,1);}

emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',375);
        emit __AssertPreCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',17);
emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',42);
require(
            defaultRestriction.endTime < now,
            "Not allowed"
        );emit __AssertPostCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',17);

emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',379);
        emit __AssertPreCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',18);
emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',43);
require(startTime >= now, "Invalid startTime");emit __AssertPostCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',18);
  
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',380);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',44);
_checkInputParams(_allowedTokens, startTime, _rollingPeriodInDays, _endTime, _restrictionType);
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',381);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',45);
defaultRestriction = VolumeRestriction(
            _allowedTokens,
            startTime,
            _rollingPeriodInDays,
            _endTime,
            RestrictionType(_restrictionType)
        );
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',388);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',46);
emit AddDefaultRestriction(
            _allowedTokens,
            startTime,
            _rollingPeriodInDays,
            _endTime,
            _restrictionType
        );
    }

    /**
     * @notice Use to add the new default daily restriction for all token holder
     * @param _allowedTokens Amount of tokens allowed to be traded for all token holder.
     * @param _startTime Unix timestamp at which restriction get into effect
     * @param _endTime Unix timestamp at which restriction effects will gets end.
     * @param _restrictionType It will be 0 or 1 (i.e 0 for fixed while 1 for Percentage)
     */
    function addDefaultDailyRestriction(
        uint256 _allowedTokens,
        uint256 _startTime,
        uint256 _endTime,
        uint256 _restrictionType 
    )
        external
        withPerm(ADMIN)
    {emit __FunctionCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',11);
   
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',413);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',47);
uint256 startTime = _startTime;
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',414);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',48);
if (_startTime == 0) {emit __BranchCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',19,0);
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',415);
            emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',49);
startTime = now;
        }else { emit __BranchCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',19,1);}

emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',417);
        emit __AssertPreCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',20);
emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',50);
require(
            defaultDailyRestriction.endTime < now,
            "Not Allowed"
        );emit __AssertPostCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',20);

emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',421);
        emit __AssertPreCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',21);
emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',51);
require(startTime >= now, "Invalid startTime");emit __AssertPostCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',21);
  
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',422);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',52);
_checkInputParams(_allowedTokens, startTime, 1, _endTime, _restrictionType);
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',423);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',53);
defaultDailyRestriction = VolumeRestriction(
            _allowedTokens,
            startTime,
            1,
            _endTime,
            RestrictionType(_restrictionType)
        );
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',430);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',54);
emit AddDefaultDailyRestriction(
            _allowedTokens,
            startTime,
            1,
            _endTime,
            _restrictionType
        );
    }

    /**
     * @notice use to remove the individual restriction for a given address
     * @param _holder Address of the user 
     */
    function removeIndividualRestriction(address _holder) external withPerm(ADMIN) {emit __FunctionCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',12);

emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',444);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',55);
_removeIndividualRestriction(_holder);
    }

    /// @notice Internal function to facilitate the removal of individual restriction
    function _removeIndividualRestriction(address _holder) internal {emit __FunctionCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',13);

emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',449);
        emit __AssertPreCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',22);
emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',56);
require(_holder != address(0), "Invalid address");emit __AssertPostCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',22);

emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',450);
        emit __AssertPreCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',23);
emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',57);
require(individualRestriction[_holder].endTime != 0, "Not present");emit __AssertPostCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',23);

emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',451);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',58);
individualRestriction[_holder] = VolumeRestriction(0, 0, 0, 0, RestrictionType(0));
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',452);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',59);
userToBucket[_holder].lastTradedDayTime = 0;
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',453);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',60);
userToBucket[_holder].sumOfLastPeriod = 0;
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',454);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',61);
userToBucket[_holder].daysCovered = 0;
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',455);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',62);
emit IndividualRestrictionRemoved(_holder);
    }

    /**
     * @notice use to remove the individual restriction for a given address
     * @param _holders Array of address of the user 
     */
    function removeIndividualRestrictionMulti(address[] _holders) external withPerm(ADMIN) {emit __FunctionCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',14);

emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',463);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',63);
for (uint256 i = 0; i < _holders.length; i++) {
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',464);
            emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',64);
_removeIndividualRestriction(_holders[i]);
        }
    }

    /**
     * @notice use to remove the individual daily restriction for a given address
     * @param _holder Address of the user 
     */
    function removeIndividualDailyRestriction(address _holder) external withPerm(ADMIN) {emit __FunctionCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',15);

emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',473);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',65);
_removeIndividualDailyRestriction(_holder);
    }

    /// @notice Internal function to facilitate the removal of individual daily restriction
    function _removeIndividualDailyRestriction(address _holder) internal {emit __FunctionCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',16);

emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',478);
        emit __AssertPreCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',24);
emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',66);
require(_holder != address(0), "Invalid address");emit __AssertPostCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',24);

emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',479);
        emit __AssertPreCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',25);
emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',67);
require(individualDailyRestriction[_holder].endTime != 0, "Not present");emit __AssertPostCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',25);

emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',480);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',68);
individualDailyRestriction[_holder] = VolumeRestriction(0, 0, 0, 0, RestrictionType(0));
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',481);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',69);
userToBucket[_holder].dailyLastTradedDayTime = 0;
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',482);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',70);
emit IndividualDailyRestrictionRemoved(_holder);
    }

    /**
     * @notice use to remove the individual daily restriction for a given address
     * @param _holders Array of address of the user 
     */
    function removeIndividualDailyRestrictionMulti(address[] _holders) external withPerm(ADMIN) {emit __FunctionCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',17);

emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',490);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',71);
for (uint256 i = 0; i < _holders.length; i++) {
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',491);
            emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',72);
_removeIndividualDailyRestriction(_holders[i]);
        }
    }

    /**
     * @notice Use to remove the default restriction
     */
    function removeDefaultRestriction() public withPerm(ADMIN) {emit __FunctionCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',18);

emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',499);
        emit __AssertPreCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',26);
emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',73);
require(defaultRestriction.endTime != 0);emit __AssertPostCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',26);

emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',500);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',74);
defaultRestriction = VolumeRestriction(0, 0, 0, 0, RestrictionType(0));
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',501);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',75);
emit DefaultRestrictionRemoved();
    }

    /**
     * @notice Use to remove the daily default restriction
     */
    function removeDefaultDailyRestriction() external withPerm(ADMIN) {emit __FunctionCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',19);

emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',508);
        emit __AssertPreCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',27);
emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',76);
require(defaultDailyRestriction.endTime != 0);emit __AssertPostCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',27);

emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',509);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',77);
defaultDailyRestriction = VolumeRestriction(0, 0, 0, 0, RestrictionType(0));
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',510);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',78);
emit DefaultDailyRestrictionRemoved();
    } 

    /**
     * @notice Use to modify the existing individual restriction for a given token holder
     * @param _holder Address of the token holder, whom restriction will be implied
     * @param _allowedTokens Amount of tokens allowed to be trade for a given address.
     * @param _startTime Unix timestamp at which restriction get into effect
     * @param _rollingPeriodInDays Rolling period in days (Minimum value should be 1 day)
     * @param _endTime Unix timestamp at which restriction effects will gets end.
     * @param _restrictionType It will be 0 or 1 (i.e 0 for fixed while 1 for Percentage)
     */
    function modifyIndividualRestriction(
        address _holder,
        uint256 _allowedTokens,
        uint256 _startTime,
        uint256 _rollingPeriodInDays,
        uint256 _endTime,
        uint256 _restrictionType 
    )
        external
        withPerm(ADMIN)
    {emit __FunctionCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',20);

emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',533);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',79);
_modifyIndividualRestriction(
            _holder,
            _allowedTokens,
            _startTime,
            _rollingPeriodInDays,
            _endTime,
            _restrictionType
        );
    }

    /// @notice Internal function to facilitate the modification of individual restriction
    function _modifyIndividualRestriction(
        address _holder,
        uint256 _allowedTokens,
        uint256 _startTime,
        uint256 _rollingPeriodInDays,
        uint256 _endTime,
        uint256 _restrictionType 
    )
        internal
    {emit __FunctionCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',21);
   
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',554);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',80);
uint256 startTime = _startTime;
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',555);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',81);
if (_startTime == 0) {emit __BranchCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',28,0);
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',556);
            emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',82);
startTime = now;
        }else { emit __BranchCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',28,1);}

emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',558);
        emit __AssertPreCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',29);
emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',83);
require(individualRestriction[_holder].startTime > now, "Not allowed");emit __AssertPostCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',29);

emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',559);
        emit __AssertPreCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',30);
emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',84);
require(startTime >= now, "Invalid startTime");emit __AssertPostCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',30);
  
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',560);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',85);
_checkInputParams(_allowedTokens, startTime, _rollingPeriodInDays, _endTime, _restrictionType);
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',561);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',86);
individualRestriction[_holder] = VolumeRestriction(
            _allowedTokens,
            startTime,
            _rollingPeriodInDays,
            _endTime,
            RestrictionType(_restrictionType)
        );
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',568);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',87);
emit ModifyIndividualRestriction(
            _holder,
            _allowedTokens,
            startTime,
            _rollingPeriodInDays,
            _endTime,
            _restrictionType
        );
    }

    /**
     * @notice Use to modify the existing individual daily restriction for a given token holder
     * @dev Changing of startTime will affect the 24 hrs span. i.e if in earlier restriction days start with
     * morning and end on midnight while after the change day may start with afternoon and end with other day afternoon
     * @param _holder Address of the token holder, whom restriction will be implied
     * @param _allowedTokens Amount of tokens allowed to be trade for a given address.
     * @param _startTime Unix timestamp at which restriction get into effect
     * @param _endTime Unix timestamp at which restriction effects will gets end.
     * @param _restrictionType It will be 0 or 1 (i.e 0 for fixed while 1 for Percentage)
     */
    function modifyIndividualDailyRestriction(
        address _holder,
        uint256 _allowedTokens,
        uint256 _startTime,
        uint256 _endTime,
        uint256 _restrictionType 
    )
        external
        withPerm(ADMIN)
    {emit __FunctionCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',22);

emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',598);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',88);
_modifyIndividualDailyRestriction(
            _holder,
            _allowedTokens,
            _startTime,
            _endTime,
            _restrictionType
        );
    }

    /// @notice Internal function to facilitate the modification of individual daily restriction
    function _modifyIndividualDailyRestriction(
        address _holder,
        uint256 _allowedTokens,
        uint256 _startTime,
        uint256 _endTime,
        uint256 _restrictionType 
    )
        internal
    {emit __FunctionCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',23);
   
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',617);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',89);
uint256 startTime = _startTime;
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',618);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',90);
if (_startTime == 0) {emit __BranchCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',31,0);
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',619);
            emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',91);
startTime = now;
        }else { emit __BranchCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',31,1);}

emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',621);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',92);
_checkInputParams(_allowedTokens, startTime, 1, _endTime, _restrictionType);
        // If old startTime is already passed then new startTime should be greater than or equal to the 
        // old startTime otherwise any past startTime can be allowed in compare to earlier startTime.
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',624);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',93);
if (individualDailyRestriction[_holder].startTime <= now) 
            {emit __AssertPreCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',33);
emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',94);
emit __BranchCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',32,0);emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',625);
require(startTime >= individualDailyRestriction[_holder].startTime, "Invalid StartTime");emit __AssertPostCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',33);
}
        else 
            {emit __AssertPreCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',34);
emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',95);
emit __BranchCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',32,1);emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',627);
require(startTime >= now);emit __AssertPostCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',34);
}
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',628);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',96);
individualDailyRestriction[_holder] = VolumeRestriction(
            _allowedTokens,
            startTime,
            1,
            _endTime,
            RestrictionType(_restrictionType)
        );
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',635);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',97);
emit ModifyIndividualDailyRestriction(
            _holder,
            _allowedTokens,
            startTime,
            1,
            _endTime,
            _restrictionType
        );
    }

    /**
     * @notice Use to modify the existing individual daily restriction for multiple token holders
     * @param _holders Array of address of the token holders, whom restriction will be implied
     * @param _allowedTokens Array of amount of tokens allowed to be trade for a given address.
     * @param _startTimes Array of unix timestamps at which restrictions get into effect
     * @param _endTimes Array of unix timestamps at which restriction effects will gets end.
     * @param _restrictionTypes Array of restriction types value will be 0 or 1 (i.e 0 for fixed while 1 for Percentage)
     */
    function modifyIndividualDailyRestrictionMulti(
        address[] _holders,
        uint256[] _allowedTokens,
        uint256[] _startTimes,
        uint256[] _endTimes,
        uint256[] _restrictionTypes  
    )
        public
        withPerm(ADMIN)
    {emit __FunctionCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',24);

emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',663);
       emit __AssertPreCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',35);
emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',98);
require(
            _allowedTokens.length == _startTimes.length &&
            _startTimes.length == _holders.length &&
            _holders.length == _endTimes.length &&
            _endTimes.length == _restrictionTypes.length,
            "Array length mismatch"
        );emit __AssertPostCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',35);

emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',670);
        emit __AssertPreCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',36);
emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',99);
require(_holders.length == _allowedTokens.length, "Length mismatch");emit __AssertPostCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',36);

emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',671);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',100);
for (uint256 i = 0; i < _holders.length; i++) {
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',672);
            emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',101);
_modifyIndividualDailyRestriction(
                _holders[i],
                _allowedTokens[i],
                _startTimes[i],
                _endTimes[i],
                _restrictionTypes[i] 
            );
        }
    } 

    /**
     * @notice Use to modify the existing individual restriction for multiple token holders
     * @param _holders Array of address of the token holders, whom restriction will be implied
     * @param _allowedTokens Array of amount of tokens allowed to be trade for a given address.
     * @param _startTimes Array of unix timestamps at which restrictions get into effect
     * @param _rollingPeriodInDays Array of rolling period in days (Minimum value should be 1 day)
     * @param _endTimes Array of unix timestamps at which restriction effects will gets end.
     * @param _restrictionTypes Array of restriction types value will be 0 or 1 (i.e 0 for fixed while 1 for Percentage)
     */
    function modifyIndividualRestrictionMulti(
        address[] _holders,
        uint256[] _allowedTokens,
        uint256[] _startTimes,
        uint256[] _rollingPeriodInDays,
        uint256[] _endTimes,
        uint256[] _restrictionTypes  
    )
        public
        withPerm(ADMIN)
    {emit __FunctionCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',25);

emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',702);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',102);
_checkLengthOfArray(_allowedTokens, _startTimes, _rollingPeriodInDays, _endTimes, _restrictionTypes);
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',703);
        emit __AssertPreCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',37);
emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',103);
require(_holders.length == _allowedTokens.length, "Length mismatch");emit __AssertPostCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',37);

emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',704);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',104);
for (uint256 i = 0; i < _holders.length; i++) {
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',705);
            emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',105);
_modifyIndividualRestriction(
                _holders[i],
                _allowedTokens[i],
                _startTimes[i],
                _rollingPeriodInDays[i],
                _endTimes[i],
                _restrictionTypes[i] 
            );
        }
    } 

    /**
     * @notice Use to modify the global restriction for all token holder
     * @param _allowedTokens Amount of tokens allowed to be traded for all token holder.
     * @param _startTime Unix timestamp at which restriction get into effect
     * @param _rollingPeriodInDays Rolling period in days (Minimum value should be 1 day)
     * @param _endTime Unix timestamp at which restriction effects will gets end.
     * @param _restrictionType It will be 0 or 1 (i.e 0 for fixed while 1 for Percentage)
     */
    function modifyDefaultRestriction(
        uint256 _allowedTokens,
        uint256 _startTime,
        uint256 _rollingPeriodInDays,
        uint256 _endTime,
        uint256 _restrictionType
    )
        external
        withPerm(ADMIN)
    {emit __FunctionCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',26);
   
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',734);
        emit __AssertPreCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',38);
emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',106);
require(defaultRestriction.startTime > now, "Not allowed");emit __AssertPostCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',38);
 
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',735);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',107);
uint256 startTime = _startTime;
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',736);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',108);
if (_startTime == 0) {emit __BranchCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',39,0);
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',737);
            emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',109);
startTime = now;
        }else { emit __BranchCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',39,1);}

emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',739);
        emit __AssertPreCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',40);
emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',110);
require(startTime >= now, "Invalid startTime");emit __AssertPostCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',40);
      
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',740);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',111);
_checkInputParams(_allowedTokens, startTime, _rollingPeriodInDays, _endTime, _restrictionType);
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',741);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',112);
defaultRestriction = VolumeRestriction(
            _allowedTokens,
            startTime,
            _rollingPeriodInDays,
            _endTime,
            RestrictionType(_restrictionType)
        );
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',748);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',113);
emit ModifyDefaultRestriction(
            _allowedTokens,
            startTime,
            _rollingPeriodInDays,
            _endTime,
            _restrictionType
        );
    }

    /**
     * @notice Use to modify the daily default restriction for all token holder
     * @dev Changing of startTime will affect the 24 hrs span. i.e if in earlier restriction days start with
     * morning and end on midnight while after the change day may start with afternoon and end with other day afternoon.
     * @param _allowedTokens Amount of tokens allowed to be traded for all token holder.
     * @param _startTime Unix timestamp at which restriction get into effect
     * @param _endTime Unix timestamp at which restriction effects will gets end.
     * @param _restrictionType It will be 0 or 1 (i.e 0 for fixed while 1 for Percentage)
     */
    function modifyDefaultDailyRestriction(
        uint256 _allowedTokens,
        uint256 _startTime,
        uint256 _endTime,
        uint256 _restrictionType
    )
        external
        withPerm(ADMIN)
    {emit __FunctionCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',27);
   
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',775);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',114);
uint256 startTime = _startTime;
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',776);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',115);
if (_startTime == 0) {emit __BranchCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',41,0);
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',777);
            emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',116);
startTime = now;
        }else { emit __BranchCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',41,1);}

emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',779);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',117);
_checkInputParams(_allowedTokens, startTime, 1, _endTime, _restrictionType);
        // If old startTime is already passed then new startTime should be greater than or equal to the 
        // old startTime otherwise any past startTime can be allowed in compare to earlier startTime.
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',782);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',118);
if (defaultDailyRestriction.startTime <= now) 
            {emit __AssertPreCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',43);
emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',119);
emit __BranchCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',42,0);emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',783);
require(startTime >= defaultDailyRestriction.startTime, "Invalid StartTime");emit __AssertPostCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',43);
}
        else 
            {emit __AssertPreCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',44);
emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',120);
emit __BranchCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',42,1);emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',785);
require(startTime >= now);emit __AssertPostCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',44);
} 
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',786);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',121);
defaultDailyRestriction = VolumeRestriction(
            _allowedTokens,
            startTime,
            1,
            _endTime,
            RestrictionType(_restrictionType)
        );
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',793);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',122);
emit ModifyDefaultDailyRestriction(
            _allowedTokens,
            startTime,
            1,
            _endTime,
            _restrictionType
        );
    }

    /**
    * @notice Internal function used to validate the transaction for a given address
    * If it validates then it also update the storage corressponds to the default restriction
    */
    function _defaultRestrictionCheck(address _from, uint256 _amount, bool _isTransfer) internal returns (Result) {emit __FunctionCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',28);
   
        // using the variable to avoid stack too deep error
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',808);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',123);
BucketDetails memory bucketDetails = defaultUserToBucket[_from];
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',809);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',124);
uint256 daysCovered = defaultRestriction.rollingPeriodInDays;
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',810);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',125);
uint256 fromTimestamp = 0;
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',811);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',126);
uint256 sumOfLastPeriod = 0;
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',812);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',127);
uint256 dailyTime = 0;
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',813);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',128);
bool allowedDefault = true;
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',814);
        bool allowedDaily;
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',815);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',129);
if (defaultRestriction.endTime >= now && defaultRestriction.startTime <= now) {emit __BranchCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',45,0);
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',816);
            emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',130);
if (bucketDetails.lastTradedDayTime < defaultRestriction.startTime) {emit __BranchCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',46,0);
                // It will execute when the txn is performed first time after the addition of individual restriction
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',818);
                emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',131);
fromTimestamp = defaultRestriction.startTime;
            } else {emit __BranchCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',46,1);
                // Picking up the last timestamp
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',821);
                emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',132);
fromTimestamp = bucketDetails.lastTradedDayTime;
            }
        
            // Check with the bucket and parse all the new timestamps to calculate the sumOfLastPeriod
            // re-using the local variables to avoid the stack too deep error.
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',826);
            emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',133);
(sumOfLastPeriod, fromTimestamp, daysCovered) = _bucketCheck(
                fromTimestamp,
                BokkyPooBahsDateTimeLibrary.diffDays(fromTimestamp, now),
                _from,
                daysCovered,
                bucketDetails
            );
            // validation of the transaction amount
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',834);
            emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',134);
if (!_checkValidAmountToTransact(sumOfLastPeriod, _amount, defaultRestriction)) {emit __BranchCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',47,0);
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',835);
                emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',135);
allowedDefault = false;
            }else { emit __BranchCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',47,1);}

        }else { emit __BranchCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',45,1);}

emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',838);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',136);
(allowedDaily, dailyTime) = _dailyTxCheck(_from, _amount, bucketDetails.dailyLastTradedDayTime, defaultDailyRestriction);
        
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',840);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',137);
if (_isTransfer) {emit __BranchCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',48,0);
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',841);
            emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',138);
_updateStorage(
                _from,
                _amount,
                fromTimestamp,
                sumOfLastPeriod,
                daysCovered,
                dailyTime,
                defaultDailyRestriction.endTime,
                true
            );
        }else { emit __BranchCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',48,1);}

emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',852);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',139);
return ((allowedDaily && allowedDefault) == true ? Result.NA : Result.INVALID);
    }

    /**
     * @notice Internal function used to validate the transaction for a given address
     * If it validates then it also update the storage corressponds to the individual restriction
     */
    function _individualRestrictionCheck(address _from, uint256 _amount, bool _isTransfer) internal returns (Result) {emit __FunctionCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',29);
   
        // using the variable to avoid stack too deep error
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',861);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',140);
BucketDetails memory bucketDetails = userToBucket[_from];
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',862);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',141);
VolumeRestriction memory dailyRestriction = individualDailyRestriction[_from];
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',863);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',142);
VolumeRestriction memory restriction = individualRestriction[_from];
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',864);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',143);
uint256 daysCovered = individualRestriction[_from].rollingPeriodInDays;
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',865);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',144);
uint256 fromTimestamp = 0;
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',866);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',145);
uint256 sumOfLastPeriod = 0;
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',867);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',146);
uint256 dailyTime = 0;
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',868);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',147);
bool allowedIndividual = true;
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',869);
        bool allowedDaily;
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',870);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',148);
if (restriction.endTime >= now && restriction.startTime <= now) {emit __BranchCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',49,0);
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',871);
            emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',149);
if (bucketDetails.lastTradedDayTime < restriction.startTime) {emit __BranchCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',50,0);
                // It will execute when the txn is performed first time after the addition of individual restriction
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',873);
                emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',150);
fromTimestamp = restriction.startTime;
            } else {emit __BranchCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',50,1);
                // Picking up the last timestamp
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',876);
                emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',151);
fromTimestamp = bucketDetails.lastTradedDayTime;
            }
        
            // Check with the bucket and parse all the new timestamps to calculate the sumOfLastPeriod
            // re-using the local variables to avoid the stack too deep error.
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',881);
            emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',152);
(sumOfLastPeriod, fromTimestamp, daysCovered) = _bucketCheck(
                fromTimestamp,
                BokkyPooBahsDateTimeLibrary.diffDays(fromTimestamp, now),
                _from,
                daysCovered,
                bucketDetails
            );
            // validation of the transaction amount
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',889);
            emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',153);
if (!_checkValidAmountToTransact(sumOfLastPeriod, _amount, restriction)) {emit __BranchCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',51,0);
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',890);
                emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',154);
allowedIndividual = false;
            }else { emit __BranchCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',51,1);}

        }else { emit __BranchCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',49,1);}

emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',893);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',155);
(allowedDaily, dailyTime) = _dailyTxCheck(_from, _amount, bucketDetails.dailyLastTradedDayTime, dailyRestriction);
        
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',895);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',156);
if (_isTransfer) {emit __BranchCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',52,0);
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',896);
            emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',157);
_updateStorage(
                _from,
                _amount,
                fromTimestamp,
                sumOfLastPeriod,
                daysCovered,
                dailyTime,
                dailyRestriction.endTime,
                false
            );
        }else { emit __BranchCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',52,1);}


emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',908);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',158);
return ((allowedDaily && allowedIndividual) ? Result.NA : Result.INVALID);
    }

    function _dailyTxCheck(
        address from,
        uint256 amount,
        uint256 dailyLastTradedDayTime,
        VolumeRestriction restriction
    ) 
        internal
        
        returns(bool, uint256)
    {emit __FunctionCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',30);

        // Checking whether the daily restriction is added or not if yes then calculate
        // the total amount get traded on a particular day (~ _fromTime)
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',923);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',159);
if ( now <= restriction.endTime && now >= restriction.startTime) {emit __BranchCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',53,0);   
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',924);
            emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',160);
uint256 txSumOfDay = 0;
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',925);
            emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',161);
if (dailyLastTradedDayTime == 0 || dailyLastTradedDayTime < restriction.startTime)
                // This if condition will be executed when the individual daily restriction executed first time
                {emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',162);
emit __BranchCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',54,0);emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',927);
dailyLastTradedDayTime = restriction.startTime.add(BokkyPooBahsDateTimeLibrary.diffDays(restriction.startTime, now).mul(1 days));}
            else {emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',163);
emit __BranchCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',54,1);if (now.sub(dailyLastTradedDayTime) >= 1 days)
                {emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',164);
emit __BranchCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',55,0);emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',929);
dailyLastTradedDayTime = dailyLastTradedDayTime.add(BokkyPooBahsDateTimeLibrary.diffDays(dailyLastTradedDayTime, now).mul(1 days));}else { emit __BranchCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',55,1);}
}
            // Assgining total sum traded on dailyLastTradedDayTime timestamp
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',931);
            emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',165);
txSumOfDay = bucket[from][dailyLastTradedDayTime];
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',932);
            emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',166);
return (_checkValidAmountToTransact(txSumOfDay, amount, restriction), dailyLastTradedDayTime);
        }else { emit __BranchCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',53,1);}

emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',934);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',167);
return (true, dailyLastTradedDayTime);
    }

    /// Internal function for the bucket check
    function _bucketCheck(
        uint256 _fromTime,
        uint256 _diffDays,
        address _from,
        uint256 _rollingPeriodInDays,
        BucketDetails memory _bucketDetails
    )
        internal
        
        returns (uint256, uint256, uint256)
    {emit __FunctionCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',31);

emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',949);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',168);
uint256 counter = _bucketDetails.daysCovered;
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',950);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',169);
uint256 sumOfLastPeriod = _bucketDetails.sumOfLastPeriod;
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',951);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',170);
uint256 i = 0;
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',952);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',171);
if (_diffDays >= _rollingPeriodInDays) {emit __BranchCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',56,0);
            // If the difference of days is greater than the rollingPeriod then sumOfLastPeriod will always be zero
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',954);
            emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',172);
sumOfLastPeriod = 0;
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',955);
            emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',173);
counter = counter.add(_diffDays);
        } else {emit __BranchCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',56,1);
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',957);
            emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',174);
for (i = 0; i < _diffDays; i++) {
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',958);
            counter++;
            // This condition is to check whether the first rolling period is covered or not
            // if not then it continues and adding 0 value into sumOfLastPeriod without subtracting
            // the earlier value at that index
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',962);
            emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',175);
if (counter >= _rollingPeriodInDays) {emit __BranchCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',57,0);
                // Subtracting the former value(Sum of all the txn amount of that day) from the sumOfLastPeriod
                // The below line subtracts (the traded volume on days no longer covered by rolling period) from sumOfLastPeriod.
                // Every loop execution subtracts one day's trade volume. 
                // Loop starts from the first day covered in sumOfLastPeriod upto the day that is covered by rolling period.
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',967);
                emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',176);
sumOfLastPeriod = 
                    sumOfLastPeriod.sub(
                        bucket[_from][_bucketDetails.lastTradedDayTime.sub(
                            (
                                _bucketDetails.daysCovered.sub(
                                    counter.sub(
                                        _rollingPeriodInDays
                                    )
                                )
                            ).mul(1 days)
                        )]
                    );
            }else { emit __BranchCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',57,1);}

            // Adding the last amount that is transacted on the `_fromTime` not actually doing it but left written to understand
            // the alogrithm
            //_bucketDetails.sumOfLastPeriod = _bucketDetails.sumOfLastPeriod.add(uint256(0));
            }
        }
        // calculating the timestamp that will used as an index of the next bucket
        // i.e buckets period will be look like this T1 to T2-1, T2 to T3-1 .... 
        // where T1,T2,T3 are timestamps having 24 hrs difference
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',988);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',177);
_fromTime = _fromTime.add(_diffDays.mul(1 days));
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',989);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',178);
return (sumOfLastPeriod, _fromTime, counter);
    }

    function _checkValidAmountToTransact(
        uint256 _sumOfLastPeriod,
        uint256 _amountToTransact,
        VolumeRestriction _restriction
    ) 
        internal
        
        returns (bool)
    {emit __FunctionCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',32);
    
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',1001);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',179);
uint256 _allowedAmount = 0;
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',1002);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',180);
if (_restriction.typeOfRestriction == RestrictionType.Percentage) {emit __BranchCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',58,0);
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',1003);
            emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',181);
_allowedAmount = (_restriction.allowedTokens.mul(ISecurityToken(securityToken).totalSupply())) / uint256(10) ** 18;
        } else {emit __BranchCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',58,1);
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',1005);
            emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',182);
_allowedAmount = _restriction.allowedTokens;
        }
        // Validation on the amount to transact
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',1008);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',183);
return (_allowedAmount >= _sumOfLastPeriod.add(_amountToTransact));
    }

    function _updateStorage(
        address _from,
        uint256 _amount,
        uint256 _lastTradedDayTime,
        uint256 _sumOfLastPeriod,
        uint256 _daysCovered, 
        uint256 _dailyLastTradedDayTime,
        uint256 _endTime,
        bool isDefault
    )
        internal 
    {emit __FunctionCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',33);
   
        
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',1024);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',184);
if (isDefault){emit __BranchCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',59,0);
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',1025);
            emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',185);
BucketDetails storage defaultUserToBucketDetails = defaultUserToBucket[_from];
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',1026);
            emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',186);
_updateStorageActual(_from, _amount, _lastTradedDayTime, _sumOfLastPeriod, _daysCovered, _dailyLastTradedDayTime, _endTime, defaultUserToBucketDetails);
        }
        else {emit __BranchCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',59,1);
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',1029);
            emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',187);
BucketDetails storage userToBucketDetails = userToBucket[_from];
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',1030);
            emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',188);
_updateStorageActual(_from, _amount, _lastTradedDayTime, _sumOfLastPeriod, _daysCovered, _dailyLastTradedDayTime, _endTime, userToBucketDetails);
        }
    }

    function _updateStorageActual(
        address _from,
        uint256 _amount,
        uint256 _lastTradedDayTime,
        uint256 _sumOfLastPeriod,
        uint256 _daysCovered, 
        uint256 _dailyLastTradedDayTime,
        uint256 _endTime,
        BucketDetails storage details
    )
        internal 
    {emit __FunctionCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',34);
   
        // Cheap storage technique
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',1047);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',189);
if (details.lastTradedDayTime != _lastTradedDayTime) {emit __BranchCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',60,0);
            // Assigning the latest transaction timestamp of the day
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',1049);
            emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',190);
details.lastTradedDayTime = _lastTradedDayTime;
        }else { emit __BranchCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',60,1);}

emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',1051);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',191);
if (details.dailyLastTradedDayTime != _dailyLastTradedDayTime) {emit __BranchCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',61,0);
            // Assigning the latest transaction timestamp of the day
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',1053);
            emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',192);
details.dailyLastTradedDayTime = _dailyLastTradedDayTime;
        }else { emit __BranchCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',61,1);}

emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',1055);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',193);
if (details.daysCovered != _daysCovered) {emit __BranchCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',62,0);
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',1056);
                emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',194);
details.daysCovered = _daysCovered;
        }else { emit __BranchCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',62,1);}

emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',1058);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',195);
if (_amount != 0) {emit __BranchCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',63,0);
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',1059);
            emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',196);
if (_lastTradedDayTime !=0) {emit __BranchCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',64,0);
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',1060);
                emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',197);
details.sumOfLastPeriod = _sumOfLastPeriod.add(_amount);
                // Increasing the total amount of the day by `_amount`
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',1062);
                emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',198);
bucket[_from][_lastTradedDayTime] = bucket[_from][_lastTradedDayTime].add(_amount);
            }else { emit __BranchCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',64,1);}

emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',1064);
            emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',199);
if ((_dailyLastTradedDayTime != _lastTradedDayTime) && _dailyLastTradedDayTime != 0 && now <= _endTime) {emit __BranchCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',65,0);
                // Increasing the total amount of the day by `_amount`
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',1066);
                emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',200);
bucket[_from][_dailyLastTradedDayTime] = bucket[_from][_dailyLastTradedDayTime].add(_amount);
            }else { emit __BranchCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',65,1);}

        }else { emit __BranchCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',63,1);}
  
    }

    function _checkInputParams(
        uint256 _allowedTokens,
        uint256 _startTime, 
        uint256 _rollingPeriodDays, 
        uint256 _endTime,
        uint256 _restrictionType 
    ) 
        internal
        
    {emit __FunctionCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',35);

emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',1081);
        emit __AssertPreCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',66);
emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',201);
require(_restrictionType == 0 || _restrictionType == 1, "Invalid type");emit __AssertPostCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',66);

emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',1082);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',202);
if (_restrictionType == uint256(RestrictionType.Fixed)) {emit __BranchCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',67,0);
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',1083);
            emit __AssertPreCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',68);
emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',203);
require(_allowedTokens > 0, "Invalid value");emit __AssertPostCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',68);

        } else {emit __BranchCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',67,1);
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',1085);
            emit __AssertPreCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',69);
emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',204);
require(
                _allowedTokens > 0 && _allowedTokens <= 100 * 10 ** 16,
                "Percentage is not within (0,100]"
            );emit __AssertPostCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',69);

        }
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',1090);
        emit __AssertPreCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',70);
emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',205);
require(_endTime > _startTime, "Invalid times");emit __AssertPostCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',70);

        // Maximum limit for the rollingPeriod is 365 days
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',1092);
        emit __AssertPreCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',71);
emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',206);
require(_rollingPeriodDays >= 1 && _rollingPeriodDays <= 365, "Invalid rollingperiod");emit __AssertPostCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',71);

emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',1093);
        emit __AssertPreCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',72);
emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',207);
require(BokkyPooBahsDateTimeLibrary.diffDays(_startTime, _endTime) >= _rollingPeriodDays, "Invalid start & end time");emit __AssertPostCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',72);

    }   

    function _checkLengthOfArray(
        uint256[] _allowedTokens,
        uint256[] _startTimes,
        uint256[] _rollingPeriodInDays,
        uint256[] _endTimes,
        uint256[] _restrictionTypes
    )
        internal
         
    {emit __FunctionCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',36);

emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',1106);
        emit __AssertPreCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',73);
emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',208);
require(
            _allowedTokens.length == _startTimes.length &&
            _startTimes.length == _rollingPeriodInDays.length &&
            _rollingPeriodInDays.length == _endTimes.length &&
            _endTimes.length == _restrictionTypes.length,
            "Array length mismatch"
        );emit __AssertPostCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',73);

    }

    /**
     * @notice Use to get the bucket details for a given address
     * @param _user Address of the token holder for whom the bucket details has queried
     * @return uint256 lastTradedDayTime
     * @return uint256 sumOfLastPeriod
     * @return uint256 days covered
     * @return uint256 24h lastTradedDayTime
     */
    function getIndividualBucketDetailsToUser(address _user) external  returns(uint256, uint256, uint256, uint256) {emit __FunctionCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',37);

emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',1124);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',209);
return(
            userToBucket[_user].lastTradedDayTime,
            userToBucket[_user].sumOfLastPeriod,
            userToBucket[_user].daysCovered,
            userToBucket[_user].dailyLastTradedDayTime
        );
    }

    /**
     * @notice Use to get the bucket details for a given address
     * @param _user Address of the token holder for whom the bucket details has queried
     * @return uint256 lastTradedDayTime
     * @return uint256 sumOfLastPeriod
     * @return uint256 days covered
     * @return uint256 24h lastTradedDayTime
     */
    function getDefaultBucketDetailsToUser(address _user) external  returns(uint256, uint256, uint256, uint256) {emit __FunctionCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',38);

emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',1141);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',210);
return(
            defaultUserToBucket[_user].lastTradedDayTime,
            defaultUserToBucket[_user].sumOfLastPeriod,
            defaultUserToBucket[_user].daysCovered,
            defaultUserToBucket[_user].dailyLastTradedDayTime
        );
    }

    /**
     * @notice Use to get the volume of token that being traded at a particular day (`_at` + 24 hours) for a given user
     * @param _user Address of the token holder
     * @param _at Timestamp 
     */
    function getTotalTradedByUser(address _user, uint256 _at) external  returns(uint256) {emit __FunctionCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',39);

emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',1155);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',211);
return bucket[_user][_at];
    }

    /**
     * @notice This function returns the signature of configure function
     */
    function getInitFunction() public  returns(bytes4) {emit __FunctionCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',40);

emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',1162);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',212);
return bytes4(0);
    }

    /**
     * @notice Returns the permissions flag that are associated with Percentage transfer Manager
     */
    function getPermissions() public  returns(bytes32[]) {emit __FunctionCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',41);

emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',1169);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',213);
bytes32[] memory allPermissions = new bytes32[](1);
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',1170);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',214);
allPermissions[0] = ADMIN;
emit __CoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',1171);
        emit __StatementCoverageVolumeRestrictionTM('./contracts/modules/TransferManager/VolumeRestrictionTM.sol',215);
return allPermissions;
    }

}