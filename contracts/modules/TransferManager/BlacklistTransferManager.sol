pragma solidity ^0.4.24;

import "./ITransferManager.sol";
import "openzeppelin-solidity/contracts/math/SafeMath.sol";

/**
 * @title Transfer Manager module to automate blacklist and restrict transfers
 */
contract BlacklistTransferManager is ITransferManager {event __CoverageBlacklistTransferManager(string fileName, uint256 lineNumber);
event __FunctionCoverageBlacklistTransferManager(string fileName, uint256 fnId);
event __StatementCoverageBlacklistTransferManager(string fileName, uint256 statementId);
event __BranchCoverageBlacklistTransferManager(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageBlacklistTransferManager(string fileName, uint256 branchId);
event __AssertPostCoverageBlacklistTransferManager(string fileName, uint256 branchId);

    using SafeMath for uint256;

    bytes32 public constant ADMIN = "ADMIN";
    
    struct BlacklistsDetails {
        uint256 startTime;
        uint256 endTime;
        uint256 repeatPeriodTime;
    }

    //hold the different blacklist details corresponds to its name
    mapping(bytes32 => BlacklistsDetails) public blacklists;

    //hold the different name of blacklist corresponds to a investor
    mapping(address => bytes32[]) investorToBlacklist;

    //get list of the addresses for a particular blacklist
    mapping(bytes32 => address[]) blacklistToInvestor;

    //mapping use to store the indexes for different blacklist types for a investor
    mapping(address => mapping(bytes32 => uint256)) investorToIndex;

    //mapping use to store the indexes for different investor for a blacklist type
    mapping(bytes32 => mapping(address => uint256)) blacklistToIndex;

    bytes32[] allBlacklists;
   
    // Emit when new blacklist type is added
    event AddBlacklistType(
        uint256 _startTime, 
        uint256 _endTime, 
        bytes32 _blacklistName, 
        uint256 _repeatPeriodTime
    );
    
    // Emit when there is a change in the blacklist type
    event ModifyBlacklistType(
        uint256 _startTime,
        uint256 _endTime, 
        bytes32 _blacklistName, 
        uint256 _repeatPeriodTime
    );
    
    // Emit when the added blacklist type is deleted
    event DeleteBlacklistType(
        bytes32 _blacklistName
    );

    // Emit when new investor is added to the blacklist type
    event AddInvestorToBlacklist(
        address indexed _investor, 
        bytes32 _blacklistName
    );
    
    // Emit when investor is deleted from the blacklist type
    event DeleteInvestorFromBlacklist(
        address indexed _investor,
        bytes32 _blacklistName
    );

   
    /**
     * @notice Constructor
     * @param _securityToken Address of the security token
     * @param _polyAddress Address of the polytoken
     */
    constructor (address _securityToken, address _polyAddress)
    public
    Module(_securityToken, _polyAddress)
    {emit __FunctionCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',1);

    }

    /**
    * @notice This function returns the signature of configure function
    */
    function getInitFunction() public  returns (bytes4) {emit __FunctionCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',2);

emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',86);
        emit __StatementCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',1);
return bytes4(0);
    }


    /** 
    * @notice Used to verify the transfer transaction
    * @param _from Address of the sender
    * @dev Restrict the blacklist address to transfer tokens 
    * if the current time is between the timeframe define for the 
    * blacklist type associated with the _from address
    */
    function verifyTransfer(address _from, address /* _to */, uint256 /* _amount */, bytes /* _data */, bool /* _isTransfer */) public returns(Result) {emit __FunctionCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',3);

emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',98);
        emit __StatementCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',2);
if (!paused) {emit __BranchCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',1,0);
emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',99);
            emit __StatementCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',3);
if (investorToBlacklist[_from].length != 0) {emit __BranchCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',2,0);
emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',100);
                emit __StatementCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',4);
for (uint256 i = 0; i < investorToBlacklist[_from].length; i++) {
emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',101);
                    emit __StatementCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',5);
uint256 endTimeTemp = blacklists[investorToBlacklist[_from][i]].endTime;
emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',102);
                    emit __StatementCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',6);
uint256 startTimeTemp = blacklists[investorToBlacklist[_from][i]].startTime;
emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',103);
                    emit __StatementCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',7);
uint256 repeatPeriodTimeTemp = blacklists[investorToBlacklist[_from][i]].repeatPeriodTime * 1 days;
                    /*solium-disable-next-line security/no-block-members*/
emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',105);
                    emit __StatementCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',8);
if (now > startTimeTemp) {emit __BranchCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',3,0);
                    // Find the repeating parameter that will be used to calculate the new startTime and endTime
                    // based on the new current time value   
                    /*solium-disable-next-line security/no-block-members*/
emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',109);
                        emit __StatementCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',9);
uint256 repeater = (now.sub(startTimeTemp)).div(repeatPeriodTimeTemp); 
                        /*solium-disable-next-line security/no-block-members*/
emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',111);
                        emit __StatementCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',10);
if (startTimeTemp.add(repeatPeriodTimeTemp.mul(repeater)) <= now && endTimeTemp.add(repeatPeriodTimeTemp.mul(repeater)) >= now) {emit __BranchCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',4,0);
emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',112);
                            emit __StatementCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',11);
return Result.INVALID;
                        }else { emit __BranchCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',4,1);}
    
                    }else { emit __BranchCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',3,1);}
   
                }    
            }else { emit __BranchCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',2,1);}
     
        }else { emit __BranchCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',1,1);}

emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',118);
        emit __StatementCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',12);
return Result.NA;
    }

    /**
    * @notice Used to add the blacklist type
    * @param _startTime Start date of the blacklist type
    * @param _endTime End date of the blacklist type
    * @param _blacklistName Name of the blacklist type
    * @param _repeatPeriodTime Repeat period of the blacklist type
    */
    function addBlacklistType(uint256 _startTime, uint256 _endTime, bytes32 _blacklistName, uint256 _repeatPeriodTime) public withPerm(ADMIN) {emit __FunctionCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',4);

emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',129);
        emit __StatementCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',13);
_addBlacklistType(_startTime, _endTime, _blacklistName, _repeatPeriodTime);
    }
    
    /**
    * @notice Used to add the multiple blacklist type
    * @param _startTimes Start date of the blacklist type
    * @param _endTimes End date of the blacklist type
    * @param _blacklistNames Name of the blacklist type
    * @param _repeatPeriodTimes Repeat period of the blacklist type
    */
    function addBlacklistTypeMulti(uint256[] _startTimes, uint256[] _endTimes, bytes32[] _blacklistNames, uint256[] _repeatPeriodTimes) external withPerm(ADMIN) {emit __FunctionCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',5);

emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',140);
        emit __AssertPreCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',5);
emit __StatementCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',14);
require (_startTimes.length == _endTimes.length && _endTimes.length == _blacklistNames.length && _blacklistNames.length == _repeatPeriodTimes.length, "Input array's length mismatch");emit __AssertPostCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',5);
 
emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',141);
        emit __StatementCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',15);
for (uint256 i = 0; i < _startTimes.length; i++){
emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',142);
            emit __StatementCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',16);
_addBlacklistType(_startTimes[i], _endTimes[i], _blacklistNames[i], _repeatPeriodTimes[i]);
        }
    }

    /**
     * @notice Internal function 
     */
    function _validParams(uint256 _startTime, uint256 _endTime, bytes32 _blacklistName, uint256 _repeatPeriodTime) internal  {emit __FunctionCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',6);

emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',150);
        emit __AssertPreCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',6);
emit __StatementCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',17);
require(_blacklistName != bytes32(0), "Invalid blacklist name");emit __AssertPostCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',6);
 
emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',151);
        emit __AssertPreCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',7);
emit __StatementCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',18);
require(_startTime >= now && _startTime < _endTime, "Invalid start or end date");emit __AssertPostCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',7);

emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',152);
        emit __AssertPreCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',8);
emit __StatementCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',19);
require(_repeatPeriodTime.mul(1 days) >= _endTime.sub(_startTime) || _repeatPeriodTime == 0);emit __AssertPostCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',8);

    }

    /**
    * @notice Used to modify the details of a given blacklist type
    * @param _startTime Start date of the blacklist type
    * @param _endTime End date of the blacklist type
    * @param _blacklistName Name of the blacklist type
    * @param _repeatPeriodTime Repeat period of the blacklist type
    */
    function modifyBlacklistType(uint256 _startTime, uint256 _endTime, bytes32 _blacklistName, uint256 _repeatPeriodTime) public withPerm(ADMIN) {emit __FunctionCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',7);

emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',163);
        emit __AssertPreCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',9);
emit __StatementCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',20);
require(blacklists[_blacklistName].endTime != 0, "Blacklist type doesn't exist");emit __AssertPostCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',9);
 
emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',164);
        emit __StatementCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',21);
_validParams(_startTime, _endTime, _blacklistName, _repeatPeriodTime);
emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',165);
        emit __StatementCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',22);
blacklists[_blacklistName] = BlacklistsDetails(_startTime, _endTime, _repeatPeriodTime);
emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',166);
        emit __StatementCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',23);
emit ModifyBlacklistType(_startTime, _endTime, _blacklistName, _repeatPeriodTime);
    }

    /**
    * @notice Used to modify the details of a given multpile blacklist types
    * @param _startTimes Start date of the blacklist type
    * @param _endTimes End date of the blacklist type
    * @param _blacklistNames Name of the blacklist type
    * @param _repeatPeriodTimes Repeat period of the blacklist type
    */
    function modifyBlacklistTypeMulti(uint256[] _startTimes, uint256[] _endTimes, bytes32[] _blacklistNames, uint256[] _repeatPeriodTimes) external withPerm(ADMIN) {emit __FunctionCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',8);

emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',177);
        emit __AssertPreCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',10);
emit __StatementCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',24);
require (_startTimes.length == _endTimes.length && _endTimes.length == _blacklistNames.length && _blacklistNames.length == _repeatPeriodTimes.length, "Input array's length mismatch");emit __AssertPostCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',10);
 
emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',178);
        emit __StatementCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',25);
for (uint256 i = 0; i < _startTimes.length; i++){
emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',179);
            emit __StatementCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',26);
modifyBlacklistType(_startTimes[i], _endTimes[i], _blacklistNames[i], _repeatPeriodTimes[i]);
        }
    }

    /**
    * @notice Used to delete the blacklist type
    * @param _blacklistName Name of the blacklist type
    */
    function deleteBlacklistType(bytes32 _blacklistName) public withPerm(ADMIN) {emit __FunctionCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',9);

emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',188);
        emit __AssertPreCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',11);
emit __StatementCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',27);
require(blacklists[_blacklistName].endTime != 0, "Blacklist type doesn’t exist");emit __AssertPostCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',11);

emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',189);
        emit __AssertPreCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',12);
emit __StatementCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',28);
require(blacklistToInvestor[_blacklistName].length == 0, "Investors are associated with the blacklist");emit __AssertPostCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',12);

        // delete blacklist type 
emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',191);
        delete(blacklists[_blacklistName]);
emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',192);
        emit __StatementCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',29);
uint256 i = 0;
emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',193);
        emit __StatementCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',30);
for (i = 0; i < allBlacklists.length; i++) {
emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',194);
            emit __StatementCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',31);
if (allBlacklists[i] == _blacklistName) {emit __BranchCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',13,0);
emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',195);
                break;
            }else { emit __BranchCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',13,1);}

        }
emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',198);
        emit __StatementCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',32);
if (i != allBlacklists.length -1) {emit __BranchCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',14,0);
emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',199);
            emit __StatementCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',33);
allBlacklists[i] = allBlacklists[allBlacklists.length -1];
        }else { emit __BranchCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',14,1);}

emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',201);
        allBlacklists.length--;
emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',202);
        emit __StatementCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',34);
emit DeleteBlacklistType(_blacklistName);
    }

    /**
    * @notice Used to delete the multiple blacklist type
    * @param _blacklistNames Name of the blacklist type
    */
    function deleteBlacklistTypeMulti(bytes32[] _blacklistNames) external withPerm(ADMIN) {emit __FunctionCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',10);

emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',210);
        emit __StatementCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',35);
for(uint256 i = 0; i < _blacklistNames.length; i++){
emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',211);
            emit __StatementCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',36);
deleteBlacklistType(_blacklistNames[i]);
        }
    }

    /**
    * @notice Used to assign the blacklist type to the investor
    * @param _investor Address of the investor
    * @param _blacklistName Name of the blacklist
    */
    function addInvestorToBlacklist(address _investor, bytes32 _blacklistName) public withPerm(ADMIN) {emit __FunctionCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',11);

emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',221);
        emit __AssertPreCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',15);
emit __StatementCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',37);
require(blacklists[_blacklistName].endTime != 0, "Blacklist type doesn't exist");emit __AssertPostCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',15);

emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',222);
        emit __AssertPreCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',16);
emit __StatementCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',38);
require(_investor != address(0), "Invalid investor address");emit __AssertPostCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',16);

emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',223);
        emit __StatementCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',39);
uint256 index = investorToIndex[_investor][_blacklistName];
emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',224);
        emit __StatementCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',40);
if (index < investorToBlacklist[_investor].length)
            {emit __AssertPreCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',18);
emit __StatementCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',41);
emit __BranchCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',17,0);emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',225);
require(investorToBlacklist[_investor][index] != _blacklistName, "Blacklist already added to investor");emit __AssertPostCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',18);
}else { emit __BranchCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',17,1);}

emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',226);
        emit __StatementCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',42);
uint256 investorIndex = investorToBlacklist[_investor].length;
        // Add blacklist index to the investor 
emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',228);
        emit __StatementCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',43);
investorToIndex[_investor][_blacklistName] = investorIndex;
emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',229);
        emit __StatementCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',44);
uint256 blacklistIndex = blacklistToInvestor[_blacklistName].length;
        // Add investor index to the blacklist
emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',231);
        emit __StatementCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',45);
blacklistToIndex[_blacklistName][_investor] = blacklistIndex;
emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',232);
        investorToBlacklist[_investor].push(_blacklistName);
emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',233);
        blacklistToInvestor[_blacklistName].push(_investor);
emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',234);
        emit __StatementCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',46);
emit AddInvestorToBlacklist(_investor, _blacklistName);
    }

    /**
    * @notice Used to assign the blacklist type to the multiple investor
    * @param _investors Address of the investor
    * @param _blacklistName Name of the blacklist
    */
    function addInvestorToBlacklistMulti(address[] _investors, bytes32 _blacklistName) external withPerm(ADMIN){emit __FunctionCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',12);

emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',243);
        emit __StatementCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',47);
for(uint256 i = 0; i < _investors.length; i++){
emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',244);
            emit __StatementCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',48);
addInvestorToBlacklist(_investors[i], _blacklistName);
        }
    }

    /**
    * @notice Used to assign the multiple blacklist type to the multiple investor
    * @param _investors Address of the investor
    * @param _blacklistNames Name of the blacklist
    */
    function addMultiInvestorToBlacklistMulti(address[] _investors, bytes32[] _blacklistNames) external withPerm(ADMIN){emit __FunctionCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',13);

emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',254);
        emit __AssertPreCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',19);
emit __StatementCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',49);
require (_investors.length == _blacklistNames.length, "Input array's length mismatch");emit __AssertPostCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',19);
 
emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',255);
        emit __StatementCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',50);
for(uint256 i = 0; i < _investors.length; i++){
emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',256);
            emit __StatementCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',51);
addInvestorToBlacklist(_investors[i], _blacklistNames[i]);
        }
    }

    /**
    * @notice Used to assign the new blacklist type to the investor
    * @param _startTime Start date of the blacklist type
    * @param _endTime End date of the blacklist type
    * @param _blacklistName Name of the blacklist type
    * @param _repeatPeriodTime Repeat period of the blacklist type
    * @param _investor Address of the investor
    */
    function addInvestorToNewBlacklist(uint256 _startTime, uint256 _endTime, bytes32 _blacklistName, uint256 _repeatPeriodTime, address _investor) external withPerm(ADMIN){emit __FunctionCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',14);

emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',269);
        emit __StatementCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',52);
_addBlacklistType(_startTime, _endTime, _blacklistName, _repeatPeriodTime);
emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',270);
        emit __StatementCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',53);
addInvestorToBlacklist(_investor, _blacklistName);
    }

    /**
    * @notice Used to delete the investor from all the associated blacklist types
    * @param _investor Address of the investor
    */
    function deleteInvestorFromAllBlacklist(address _investor) public withPerm(ADMIN) {emit __FunctionCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',15);

emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',278);
        emit __AssertPreCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',20);
emit __StatementCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',54);
require(_investor != address(0), "Invalid investor address");emit __AssertPostCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',20);

emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',279);
        emit __AssertPreCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',21);
emit __StatementCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',55);
require(investorToBlacklist[_investor].length != 0, "Investor is not associated to any blacklist type");emit __AssertPostCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',21);

emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',280);
        emit __StatementCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',56);
uint256 index = investorToBlacklist[_investor].length - 1;
emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',281);
        emit __StatementCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',57);
for (uint256 i = index; i >= 0 && i <= index; i--){
emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',282);
            emit __StatementCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',58);
deleteInvestorFromBlacklist(_investor, investorToBlacklist[_investor][i]);
        }
    }

     /**
    * @notice Used to delete the multiple investor from all the associated blacklist types
    * @param _investor Address of the investor
    */
    function deleteInvestorFromAllBlacklistMulti(address[] _investor) external withPerm(ADMIN) {emit __FunctionCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',16);

emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',291);
        emit __StatementCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',59);
for(uint256 i = 0; i < _investor.length; i++){
emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',292);
            emit __StatementCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',60);
deleteInvestorFromAllBlacklist(_investor[i]);
        }
    }

    /**
    * @notice Used to delete the investor from the blacklist
    * @param _investor Address of the investor
    * @param _blacklistName Name of the blacklist
    */
    function deleteInvestorFromBlacklist(address _investor, bytes32 _blacklistName) public withPerm(ADMIN) {emit __FunctionCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',17);

emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',302);
        emit __AssertPreCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',22);
emit __StatementCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',61);
require(_investor != address(0), "Invalid investor address");emit __AssertPostCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',22);

emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',303);
        emit __AssertPreCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',23);
emit __StatementCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',62);
require(_blacklistName != bytes32(0),"Invalid blacklist name");emit __AssertPostCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',23);

emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',304);
        emit __AssertPreCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',24);
emit __StatementCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',63);
require(investorToBlacklist[_investor][investorToIndex[_investor][_blacklistName]] == _blacklistName, "Investor not associated to the blacklist");emit __AssertPostCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',24);

        // delete the investor from the blacklist type
emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',306);
        emit __StatementCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',64);
uint256 _blacklistIndex = blacklistToIndex[_blacklistName][_investor];
emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',307);
        emit __StatementCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',65);
uint256 _len = blacklistToInvestor[_blacklistName].length;
emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',308);
        emit __StatementCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',66);
if ( _blacklistIndex < _len -1) {emit __BranchCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',25,0);
emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',309);
            emit __StatementCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',67);
blacklistToInvestor[_blacklistName][_blacklistIndex] = blacklistToInvestor[_blacklistName][_len - 1];
emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',310);
            emit __StatementCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',68);
blacklistToIndex[_blacklistName][blacklistToInvestor[_blacklistName][_blacklistIndex]] = _blacklistIndex;
        }else { emit __BranchCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',25,1);}

emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',312);
        blacklistToInvestor[_blacklistName].length--;
        // delete the investor index from the blacklist
emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',314);
        delete(blacklistToIndex[_blacklistName][_investor]);
        // delete the blacklist from the investor
emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',316);
        emit __StatementCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',69);
uint256 _investorIndex = investorToIndex[_investor][_blacklistName];
emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',317);
        emit __StatementCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',70);
_len = investorToBlacklist[_investor].length;
emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',318);
        emit __StatementCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',71);
if ( _investorIndex < _len -1) {emit __BranchCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',26,0);
emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',319);
            emit __StatementCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',72);
investorToBlacklist[_investor][_investorIndex] = investorToBlacklist[_investor][_len - 1];
emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',320);
            emit __StatementCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',73);
investorToIndex[_investor][investorToBlacklist[_investor][_investorIndex]] = _investorIndex;
        }else { emit __BranchCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',26,1);}

emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',322);
        investorToBlacklist[_investor].length--;
        // delete the blacklist index from the invetsor
emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',324);
        delete(investorToIndex[_investor][_blacklistName]);
emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',325);
        emit __StatementCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',74);
emit DeleteInvestorFromBlacklist(_investor, _blacklistName);
    }

     /**
    * @notice Used to delete the multiple investor from the blacklist
    * @param _investors address of the investor
    * @param _blacklistNames name of the blacklist
    */
    function deleteMultiInvestorsFromBlacklistMulti(address[] _investors, bytes32[] _blacklistNames) external withPerm(ADMIN) {emit __FunctionCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',18);

emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',334);
        emit __AssertPreCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',27);
emit __StatementCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',75);
require (_investors.length == _blacklistNames.length, "Input array's length mismatch");emit __AssertPostCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',27);
 
emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',335);
        emit __StatementCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',76);
for(uint256 i = 0; i < _investors.length; i++){
emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',336);
            emit __StatementCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',77);
deleteInvestorFromBlacklist(_investors[i], _blacklistNames[i]);
        }
    }

    function _addBlacklistType(uint256 _startTime, uint256 _endTime, bytes32 _blacklistName, uint256 _repeatPeriodTime) internal {emit __FunctionCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',19);

emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',341);
        emit __AssertPreCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',28);
emit __StatementCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',78);
require(blacklists[_blacklistName].endTime == 0, "Blacklist type already exist");emit __AssertPostCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',28);
 
emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',342);
        emit __StatementCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',79);
_validParams(_startTime, _endTime, _blacklistName, _repeatPeriodTime);
emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',343);
        emit __StatementCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',80);
blacklists[_blacklistName] = BlacklistsDetails(_startTime, _endTime, _repeatPeriodTime);
emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',344);
        allBlacklists.push(_blacklistName);
emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',345);
        emit __StatementCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',81);
emit AddBlacklistType(_startTime, _endTime, _blacklistName, _repeatPeriodTime);
    }
    
    /**
    * @notice get the list of the investors of a blacklist type
    * @param _blacklistName Name of the blacklist type
    * @return address List of investors associated with the blacklist
    */
    function getListOfAddresses(bytes32 _blacklistName) external  returns(address[]) {emit __FunctionCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',20);

emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',354);
        emit __AssertPreCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',29);
emit __StatementCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',82);
require(blacklists[_blacklistName].endTime != 0, "Blacklist type doesn't exist");emit __AssertPostCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',29);

emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',355);
        emit __StatementCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',83);
return blacklistToInvestor[_blacklistName];
    }

    /**
    * @notice get the list of the investors of a blacklist type
    * @param _user Address of the user
    * @return bytes32 List of blacklist names associated with the given address
    */
    function getBlacklistNamesToUser(address _user) external  returns(bytes32[]) {emit __FunctionCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',21);

emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',364);
        emit __StatementCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',84);
return investorToBlacklist[_user];
    }

    /**
     * @notice get the list of blacklist names
     * @return bytes32 Array of blacklist names
     */
    function getAllBlacklists() external  returns(bytes32[]) {emit __FunctionCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',22);

emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',372);
        emit __StatementCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',85);
return allBlacklists;
    }

    /**
    * @notice Return the permissions flag that are associated with blacklist transfer manager
    */
    function getPermissions() public  returns(bytes32[]) {emit __FunctionCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',23);

emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',379);
        emit __StatementCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',86);
bytes32[] memory allPermissions = new bytes32[](1);
emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',380);
        emit __StatementCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',87);
allPermissions[0] = ADMIN;
emit __CoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',381);
        emit __StatementCoverageBlacklistTransferManager('./contracts/modules/TransferManager/BlacklistTransferManager.sol',88);
return allPermissions;
    }
}


