pragma solidity ^0.4.24;

import "openzeppelin-solidity/contracts/math/SafeMath.sol";
import "./VestingEscrowWalletStorage.sol";
import "./IWallet.sol";

/**
 * @title Wallet for core vesting escrow functionality
 */
contract VestingEscrowWallet is VestingEscrowWalletStorage, IWallet {event __CoverageVestingEscrowWallet(string fileName, uint256 lineNumber);
event __FunctionCoverageVestingEscrowWallet(string fileName, uint256 fnId);
event __StatementCoverageVestingEscrowWallet(string fileName, uint256 statementId);
event __BranchCoverageVestingEscrowWallet(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageVestingEscrowWallet(string fileName, uint256 branchId);
event __AssertPostCoverageVestingEscrowWallet(string fileName, uint256 branchId);

    using SafeMath for uint256;

    bytes32 public constant ADMIN = "ADMIN";

    // States used to represent the status of the schedule
    enum State {CREATED, STARTED, COMPLETED}

    // Emit when new schedule is added
    event AddSchedule(
        address indexed _beneficiary,
        bytes32 _templateName,
        uint256 _startTime
    );
    // Emit when schedule is modified
    event ModifySchedule(
        address indexed _beneficiary,
        bytes32 _templateName,
        uint256 _startTime
    );
    // Emit when all schedules are revoked for user
    event RevokeAllSchedules(address indexed _beneficiary);
    // Emit when schedule is revoked
    event RevokeSchedule(address indexed _beneficiary, bytes32 _templateName);
    // Emit when tokes are deposited to wallet
    event DepositTokens(uint256 _numberOfTokens, address _sender);
    // Emit when all unassigned tokens are sent to treasury
    event SendToTreasury(uint256 _numberOfTokens, address _sender);
    // Emit when is sent tokes to user
    event SendTokens(address indexed _beneficiary, uint256 _numberOfTokens);
    // Emit when template is added
    event AddTemplate(bytes32 _name, uint256 _numberOfTokens, uint256 _duration, uint256 _frequency);
    // Emit when template is removed
    event RemoveTemplate(bytes32 _name);
    // Emit when the treasury wallet gets changed
    event TreasuryWalletChanged(address _newWallet, address _oldWallet);

    /**
     * @notice Constructor
     * @param _securityToken Address of the security token
     * @param _polyAddress Address of the polytoken
     */
    constructor (address _securityToken, address _polyAddress)
    public
    Module(_securityToken, _polyAddress)
    {emit __FunctionCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',1);

    }

    /**
     * @notice This function returns the signature of the configure function
     */
    function getInitFunction() public  returns (bytes4) {emit __FunctionCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',2);

emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',62);
        emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',1);
return bytes4(keccak256("configure(address)"));
    }

    /**
     * @notice Used to initialize the treasury wallet address
     * @param _treasuryWallet Address of the treasury wallet
     */
    function configure(address _treasuryWallet) public onlyFactory {emit __FunctionCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',3);

emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',70);
        emit __AssertPreCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',1);
emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',2);
require(_treasuryWallet != address(0), "Invalid address");emit __AssertPostCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',1);

emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',71);
        emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',3);
treasuryWallet = _treasuryWallet;
    }

    /**
     * @notice Used to change the treasury wallet address
     * @param _newTreasuryWallet Address of the treasury wallet
     */
    function changeTreasuryWallet(address _newTreasuryWallet) public onlyOwner {emit __FunctionCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',4);

emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',79);
        emit __AssertPreCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',2);
emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',4);
require(_newTreasuryWallet != address(0));emit __AssertPostCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',2);

emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',80);
        emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',5);
emit TreasuryWalletChanged(_newTreasuryWallet, treasuryWallet);
emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',81);
        emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',6);
treasuryWallet = _newTreasuryWallet;
    }

    /**
     * @notice Used to deposit tokens from treasury wallet to the vesting escrow wallet
     * @param _numberOfTokens Number of tokens that should be deposited
     */
    function depositTokens(uint256 _numberOfTokens) external withPerm(ADMIN) {emit __FunctionCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',5);

emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',89);
        emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',7);
_depositTokens(_numberOfTokens);
    }

    function _depositTokens(uint256 _numberOfTokens) internal {emit __FunctionCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',6);

emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',93);
        emit __AssertPreCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',3);
emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',8);
require(_numberOfTokens > 0, "Should be > 0");emit __AssertPostCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',3);

emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',94);
        emit __AssertPreCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',4);
emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',9);
require(
            ISecurityToken(securityToken).transferFrom(msg.sender, address(this), _numberOfTokens),
            "Failed transferFrom due to insufficent Allowance provided"
        );emit __AssertPostCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',4);

emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',98);
        emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',10);
unassignedTokens = unassignedTokens.add(_numberOfTokens);
emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',99);
        emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',11);
emit DepositTokens(_numberOfTokens, msg.sender);
    }

    /**
     * @notice Sends unassigned tokens to the treasury wallet
     * @param _amount Amount of tokens that should be send to the treasury wallet
     */
    function sendToTreasury(uint256 _amount) external withPerm(ADMIN) {emit __FunctionCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',7);

emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',107);
        emit __AssertPreCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',5);
emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',12);
require(_amount > 0, "Amount cannot be zero");emit __AssertPostCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',5);

emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',108);
        emit __AssertPreCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',6);
emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',13);
require(_amount <= unassignedTokens, "Amount is greater than unassigned tokens");emit __AssertPostCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',6);

emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',109);
        emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',14);
uint256 amount = unassignedTokens;
emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',110);
        emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',15);
unassignedTokens = 0;
emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',111);
        emit __AssertPreCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',7);
emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',16);
require(ISecurityToken(securityToken).transfer(treasuryWallet, amount), "Transfer failed");emit __AssertPostCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',7);

emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',112);
        emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',17);
emit SendToTreasury(amount, msg.sender);
    }

    /**
     * @notice Pushes available tokens to the beneficiary's address
     * @param _beneficiary Address of the beneficiary who will receive tokens
     */
    function pushAvailableTokens(address _beneficiary) public withPerm(ADMIN) {emit __FunctionCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',8);

emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',120);
        emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',18);
_sendTokens(_beneficiary);
    }

    /**
     * @notice Used to withdraw available tokens by beneficiary
     */
    function pullAvailableTokens() external {emit __FunctionCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',9);

emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',127);
        emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',19);
_sendTokens(msg.sender);
    }

    /**
     * @notice Adds template that can be used for creating schedule
     * @param _name Name of the template will be created
     * @param _numberOfTokens Number of tokens that should be assigned to schedule
     * @param _duration Duration of the vesting schedule
     * @param _frequency Frequency of the vesting schedule
     */
    function addTemplate(bytes32 _name, uint256 _numberOfTokens, uint256 _duration, uint256 _frequency) external withPerm(ADMIN) {emit __FunctionCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',10);

emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',138);
        emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',20);
_addTemplate(_name, _numberOfTokens, _duration, _frequency);
    }

    function _addTemplate(bytes32 _name, uint256 _numberOfTokens, uint256 _duration, uint256 _frequency) internal {emit __FunctionCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',11);

emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',142);
        emit __AssertPreCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',8);
emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',21);
require(_name != bytes32(0), "Invalid name");emit __AssertPostCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',8);

emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',143);
        emit __AssertPreCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',9);
emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',22);
require(!_isTemplateExists(_name), "Already exists");emit __AssertPostCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',9);

emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',144);
        emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',23);
_validateTemplate(_numberOfTokens, _duration, _frequency);
emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',145);
        templateNames.push(_name);
emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',146);
        emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',24);
templates[_name] = Template(_numberOfTokens, _duration, _frequency, templateNames.length - 1);
emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',147);
        emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',25);
emit AddTemplate(_name, _numberOfTokens, _duration, _frequency);
    }

    /**
     * @notice Removes template with a given name
     * @param _name Name of the template that will be removed
     */
    function removeTemplate(bytes32 _name) external withPerm(ADMIN) {emit __FunctionCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',12);

emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',155);
        emit __AssertPreCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',10);
emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',26);
require(_isTemplateExists(_name), "Template not found");emit __AssertPostCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',10);

emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',156);
        emit __AssertPreCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',11);
emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',27);
require(templateToUsers[_name].length == 0, "Template is used");emit __AssertPostCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',11);

emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',157);
        emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',28);
uint256 index = templates[_name].index;
emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',158);
        emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',29);
if (index != templateNames.length - 1) {emit __BranchCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',12,0);
emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',159);
            emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',30);
templateNames[index] = templateNames[templateNames.length - 1];
emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',160);
            emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',31);
templates[templateNames[index]].index = index;
        }else { emit __BranchCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',12,1);}

emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',162);
        templateNames.length--;
        // delete template data
emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',164);
        delete templates[_name];
emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',165);
        emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',32);
emit RemoveTemplate(_name);
    }

    /**
     * @notice Returns count of the templates those can be used for creating schedule
     * @return Count of the templates
     */
    function getTemplateCount() external  returns(uint256) {emit __FunctionCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',13);

emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',173);
        emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',33);
return templateNames.length;
    }

    /**
     * @notice Gets the list of the template names those can be used for creating schedule
     * @return bytes32 Array of all template names were created
     */
    function getAllTemplateNames() external  returns(bytes32[]) {emit __FunctionCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',14);

emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',181);
        emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',34);
return templateNames;
    }

    /**
     * @notice Adds vesting schedules for each of the beneficiary's address
     * @param _beneficiary Address of the beneficiary for whom it is scheduled
     * @param _templateName Name of the template that will be created
     * @param _numberOfTokens Total number of tokens for created schedule
     * @param _duration Duration of the created vesting schedule
     * @param _frequency Frequency of the created vesting schedule
     * @param _startTime Start time of the created vesting schedule
     */
    function addSchedule(
        address _beneficiary,
        bytes32 _templateName,
        uint256 _numberOfTokens,
        uint256 _duration,
        uint256 _frequency,
        uint256 _startTime
    )
        external
        withPerm(ADMIN)
    {emit __FunctionCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',15);

emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',204);
        emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',35);
_addSchedule(_beneficiary, _templateName, _numberOfTokens, _duration, _frequency, _startTime);
    }

    function _addSchedule(
        address _beneficiary,
        bytes32 _templateName,
        uint256 _numberOfTokens,
        uint256 _duration,
        uint256 _frequency,
        uint256 _startTime
    )
        internal
    {emit __FunctionCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',16);

emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',217);
        emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',36);
_addTemplate(_templateName, _numberOfTokens, _duration, _frequency);
emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',218);
        emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',37);
_addScheduleFromTemplate(_beneficiary, _templateName, _startTime);
    }

    /**
     * @notice Adds vesting schedules from template for the beneficiary
     * @param _beneficiary Address of the beneficiary for whom it is scheduled
     * @param _templateName Name of the exists template
     * @param _startTime Start time of the created vesting schedule
     */
    function addScheduleFromTemplate(address _beneficiary, bytes32 _templateName, uint256 _startTime) external withPerm(ADMIN) {emit __FunctionCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',17);

emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',228);
        emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',38);
_addScheduleFromTemplate(_beneficiary, _templateName, _startTime);
    }

    function _addScheduleFromTemplate(address _beneficiary, bytes32 _templateName, uint256 _startTime) internal {emit __FunctionCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',18);

emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',232);
        emit __AssertPreCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',13);
emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',39);
require(_beneficiary != address(0), "Invalid address");emit __AssertPostCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',13);

emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',233);
        emit __AssertPreCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',14);
emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',40);
require(_isTemplateExists(_templateName), "Template not found");emit __AssertPostCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',14);

emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',234);
        emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',41);
uint256 index = userToTemplateIndex[_beneficiary][_templateName];
emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',235);
        emit __AssertPreCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',15);
emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',42);
require(
            schedules[_beneficiary].length == 0 ||
            schedules[_beneficiary][index].templateName != _templateName,
            "Already added"
        );emit __AssertPostCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',15);

emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',240);
        emit __AssertPreCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',16);
emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',43);
require(_startTime >= now, "Date in the past");emit __AssertPostCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',16);

emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',241);
        emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',44);
uint256 numberOfTokens = templates[_templateName].numberOfTokens;
emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',242);
        emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',45);
if (numberOfTokens > unassignedTokens) {emit __BranchCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',17,0);
emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',243);
            emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',46);
_depositTokens(numberOfTokens.sub(unassignedTokens));
        }else { emit __BranchCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',17,1);}

emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',245);
        emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',47);
unassignedTokens = unassignedTokens.sub(numberOfTokens);
emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',246);
        emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',48);
if (!beneficiaryAdded[_beneficiary]) {emit __BranchCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',18,0);
emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',247);
            beneficiaries.push(_beneficiary);
emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',248);
            emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',49);
beneficiaryAdded[_beneficiary] = true;
        }else { emit __BranchCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',18,1);}

emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',250);
        schedules[_beneficiary].push(Schedule(_templateName, 0, _startTime));
emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',251);
        userToTemplates[_beneficiary].push(_templateName);
emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',252);
        emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',50);
userToTemplateIndex[_beneficiary][_templateName] = schedules[_beneficiary].length - 1;
emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',253);
        templateToUsers[_templateName].push(_beneficiary);
emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',254);
        emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',51);
templateToUserIndex[_templateName][_beneficiary] = templateToUsers[_templateName].length - 1;
emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',255);
        emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',52);
emit AddSchedule(_beneficiary, _templateName, _startTime);
    }

    /**
     * @notice Modifies vesting schedules for each of the beneficiary
     * @param _beneficiary Address of the beneficiary for whom it is modified
     * @param _templateName Name of the template was used for schedule creation
     * @param _startTime Start time of the created vesting schedule
     */
    function modifySchedule(address _beneficiary, bytes32 _templateName, uint256 _startTime) public withPerm(ADMIN) {emit __FunctionCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',19);

emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',265);
        emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',53);
_modifySchedule(_beneficiary, _templateName, _startTime);
    }

    function _modifySchedule(address _beneficiary, bytes32 _templateName, uint256 _startTime) internal {emit __FunctionCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',20);

emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',269);
        emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',54);
_checkSchedule(_beneficiary, _templateName);
emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',270);
        emit __AssertPreCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',19);
emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',55);
require(_startTime > now, "Date in the past");emit __AssertPostCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',19);

emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',271);
        emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',56);
uint256 index = userToTemplateIndex[_beneficiary][_templateName];
emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',272);
        emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',57);
Schedule storage schedule = schedules[_beneficiary][index];
        /*solium-disable-next-line security/no-block-members*/
emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',274);
        emit __AssertPreCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',20);
emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',58);
require(now < schedule.startTime, "Schedule started");emit __AssertPostCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',20);

emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',275);
        emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',59);
schedule.startTime = _startTime;
emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',276);
        emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',60);
emit ModifySchedule(_beneficiary, _templateName, _startTime);
    }

    /**
     * @notice Revokes vesting schedule with given template name for given beneficiary
     * @param _beneficiary Address of the beneficiary for whom it is revoked
     * @param _templateName Name of the template was used for schedule creation
     */
    function revokeSchedule(address _beneficiary, bytes32 _templateName) external withPerm(ADMIN) {emit __FunctionCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',21);

emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',285);
        emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',61);
_checkSchedule(_beneficiary, _templateName);
emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',286);
        emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',62);
uint256 index = userToTemplateIndex[_beneficiary][_templateName];
emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',287);
        emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',63);
_sendTokensPerSchedule(_beneficiary, index);
emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',288);
        emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',64);
uint256 releasedTokens = _getReleasedTokens(_beneficiary, index);
emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',289);
        emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',65);
unassignedTokens = unassignedTokens.add(templates[_templateName].numberOfTokens.sub(releasedTokens));
emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',290);
        emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',66);
_deleteUserToTemplates(_beneficiary, _templateName);
emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',291);
        emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',67);
_deleteTemplateToUsers(_beneficiary, _templateName);
emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',292);
        emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',68);
emit RevokeSchedule(_beneficiary, _templateName);
    }

    function _deleteUserToTemplates(address _beneficiary, bytes32 _templateName) internal {emit __FunctionCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',22);

emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',296);
        emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',69);
uint256 index = userToTemplateIndex[_beneficiary][_templateName];
emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',297);
        emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',70);
Schedule[] storage userSchedules = schedules[_beneficiary];
emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',298);
        emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',71);
if (index != userSchedules.length - 1) {emit __BranchCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',21,0);
emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',299);
            emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',72);
userSchedules[index] = userSchedules[userSchedules.length - 1];
emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',300);
            emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',73);
userToTemplates[_beneficiary][index] = userToTemplates[_beneficiary][userToTemplates[_beneficiary].length - 1];
emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',301);
            emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',74);
userToTemplateIndex[_beneficiary][userSchedules[index].templateName] = index;
        }else { emit __BranchCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',21,1);}

emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',303);
        userSchedules.length--;
emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',304);
        userToTemplates[_beneficiary].length--;
emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',305);
        delete userToTemplateIndex[_beneficiary][_templateName];
    }

    function _deleteTemplateToUsers(address _beneficiary, bytes32 _templateName) internal {emit __FunctionCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',23);

emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',309);
        emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',75);
uint256 templateIndex = templateToUserIndex[_templateName][_beneficiary];
emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',310);
        emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',76);
if (templateIndex != templateToUsers[_templateName].length - 1) {emit __BranchCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',22,0);
emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',311);
            emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',77);
templateToUsers[_templateName][templateIndex] = templateToUsers[_templateName][templateToUsers[_templateName].length - 1];
emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',312);
            emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',78);
templateToUserIndex[_templateName][templateToUsers[_templateName][templateIndex]] = templateIndex;
        }else { emit __BranchCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',22,1);}

emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',314);
        templateToUsers[_templateName].length--;
emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',315);
        delete templateToUserIndex[_templateName][_beneficiary];
    }

    /**
     * @notice Revokes all vesting schedules for given beneficiary's address
     * @param _beneficiary Address of the beneficiary for whom all schedules will be revoked
     */
    function revokeAllSchedules(address _beneficiary) public withPerm(ADMIN) {emit __FunctionCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',24);

emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',323);
        emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',79);
_revokeAllSchedules(_beneficiary);
    }

    function _revokeAllSchedules(address _beneficiary) internal {emit __FunctionCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',25);

emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',327);
        emit __AssertPreCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',23);
emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',80);
require(_beneficiary != address(0), "Invalid address");emit __AssertPostCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',23);

emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',328);
        emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',81);
_sendTokens(_beneficiary);
emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',329);
        emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',82);
Schedule[] storage userSchedules = schedules[_beneficiary];
emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',330);
        emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',83);
for (uint256 i = 0; i < userSchedules.length; i++) {
emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',331);
            emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',84);
uint256 releasedTokens = _getReleasedTokens(_beneficiary, i);
emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',332);
            emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',85);
Template memory template = templates[userSchedules[i].templateName];
emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',333);
            emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',86);
unassignedTokens = unassignedTokens.add(template.numberOfTokens.sub(releasedTokens));
emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',334);
            delete userToTemplateIndex[_beneficiary][userSchedules[i].templateName];
emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',335);
            emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',87);
_deleteTemplateToUsers(_beneficiary, userSchedules[i].templateName);
        }
emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',337);
        delete schedules[_beneficiary];
emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',338);
        delete userToTemplates[_beneficiary];
emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',339);
        emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',88);
emit RevokeAllSchedules(_beneficiary);
    }

    /**
     * @notice Returns beneficiary's schedule created using template name
     * @param _beneficiary Address of the beneficiary who will receive tokens
     * @param _templateName Name of the template was used for schedule creation
     * @return beneficiary's schedule data (numberOfTokens, duration, frequency, startTime, claimedTokens, State)
     */
    function getSchedule(address _beneficiary, bytes32 _templateName) external  returns(uint256, uint256, uint256, uint256, uint256, State) {emit __FunctionCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',26);

emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',349);
        emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',89);
_checkSchedule(_beneficiary, _templateName);
emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',350);
        emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',90);
uint256 index = userToTemplateIndex[_beneficiary][_templateName];
emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',351);
        emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',91);
Schedule memory schedule = schedules[_beneficiary][index];
emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',352);
        emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',92);
return (
            templates[schedule.templateName].numberOfTokens,
            templates[schedule.templateName].duration,
            templates[schedule.templateName].frequency,
            schedule.startTime,
            schedule.claimedTokens,
            _getScheduleState(_beneficiary, _templateName)
        );
    }

    function _getScheduleState(address _beneficiary, bytes32 _templateName) internal  returns(State) {emit __FunctionCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',27);

emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',363);
        emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',93);
_checkSchedule(_beneficiary, _templateName);
emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',364);
        emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',94);
uint256 index = userToTemplateIndex[_beneficiary][_templateName];
emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',365);
        emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',95);
Schedule memory schedule = schedules[_beneficiary][index];
emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',366);
        emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',96);
if (now < schedule.startTime) {emit __BranchCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',24,0);
emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',367);
            emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',97);
return State.CREATED;
        } else {emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',98);
emit __BranchCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',24,1);if (now > schedule.startTime && now < schedule.startTime.add(templates[_templateName].duration)) {emit __BranchCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',25,0);
emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',369);
            emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',99);
return State.STARTED;
        } else {emit __BranchCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',25,1);
emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',371);
            emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',100);
return State.COMPLETED;
        }}
    }

    /**
     * @notice Returns list of the template names for given beneficiary's address
     * @param _beneficiary Address of the beneficiary
     * @return List of the template names that were used for schedule creation
     */
    function getTemplateNames(address _beneficiary) external  returns(bytes32[]) {emit __FunctionCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',28);

emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',381);
        emit __AssertPreCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',26);
emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',101);
require(_beneficiary != address(0), "Invalid address");emit __AssertPostCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',26);

emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',382);
        emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',102);
return userToTemplates[_beneficiary];
    }

    /**
     * @notice Returns count of the schedules were created for given beneficiary
     * @param _beneficiary Address of the beneficiary
     * @return Count of beneficiary's schedules
     */
    function getScheduleCount(address _beneficiary) external  returns(uint256) {emit __FunctionCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',29);

emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',391);
        emit __AssertPreCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',27);
emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',103);
require(_beneficiary != address(0), "Invalid address");emit __AssertPostCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',27);

emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',392);
        emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',104);
return schedules[_beneficiary].length;
    }

    function _getAvailableTokens(address _beneficiary, uint256 _index) internal  returns(uint256) {emit __FunctionCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',30);

emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',396);
        emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',105);
Schedule memory schedule = schedules[_beneficiary][_index];
emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',397);
        emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',106);
uint256 releasedTokens = _getReleasedTokens(_beneficiary, _index);
emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',398);
        emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',107);
return releasedTokens.sub(schedule.claimedTokens);
    }

    function _getReleasedTokens(address _beneficiary, uint256 _index) internal  returns(uint256) {emit __FunctionCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',31);

emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',402);
        emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',108);
Schedule memory schedule = schedules[_beneficiary][_index];
emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',403);
        emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',109);
Template memory template = templates[schedule.templateName];
        /*solium-disable-next-line security/no-block-members*/
emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',405);
        emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',110);
if (now > schedule.startTime) {emit __BranchCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',28,0);
emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',406);
            emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',111);
uint256 periodCount = template.duration.div(template.frequency);
            /*solium-disable-next-line security/no-block-members*/
emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',408);
            emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',112);
uint256 periodNumber = (now.sub(schedule.startTime)).div(template.frequency);
emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',409);
            emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',113);
if (periodNumber > periodCount) {emit __BranchCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',29,0);
emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',410);
                emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',114);
periodNumber = periodCount;
            }else { emit __BranchCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',29,1);}

emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',412);
            emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',115);
return template.numberOfTokens.mul(periodNumber).div(periodCount);
        } else {emit __BranchCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',28,1);
emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',414);
            emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',116);
return 0;
        }
    }

    /**
     * @notice Used to bulk send available tokens for each of the beneficiaries
     * @param _fromIndex Start index of array of beneficiary's addresses
     * @param _toIndex End index of array of beneficiary's addresses
     */
    function pushAvailableTokensMulti(uint256 _fromIndex, uint256 _toIndex) external withPerm(ADMIN) {emit __FunctionCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',32);

emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',424);
        emit __AssertPreCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',30);
emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',117);
require(_toIndex <= beneficiaries.length - 1, "Array out of bound");emit __AssertPostCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',30);

emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',425);
        emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',118);
for (uint256 i = _fromIndex; i <= _toIndex; i++) {
emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',426);
            emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',119);
if (schedules[beneficiaries[i]].length !=0)
                {emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',120);
emit __BranchCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',31,0);emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',427);
pushAvailableTokens(beneficiaries[i]);}else { emit __BranchCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',31,1);}

        }
    }

    /**
     * @notice Used to bulk add vesting schedules for each of beneficiary
     * @param _beneficiaries Array of the beneficiary's addresses
     * @param _templateNames Array of the template names
     * @param _numberOfTokens Array of number of tokens should be assigned to schedules
     * @param _durations Array of the vesting duration
     * @param _frequencies Array of the vesting frequency
     * @param _startTimes Array of the vesting start time
     */
    function addScheduleMulti(
        address[] _beneficiaries,
        bytes32[] _templateNames,
        uint256[] _numberOfTokens,
        uint256[] _durations,
        uint256[] _frequencies,
        uint256[] _startTimes
    )
        public
        withPerm(ADMIN)
    {emit __FunctionCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',33);

emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',451);
        emit __AssertPreCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',32);
emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',121);
require(
            _beneficiaries.length == _templateNames.length && /*solium-disable-line operator-whitespace*/
            _beneficiaries.length == _numberOfTokens.length && /*solium-disable-line operator-whitespace*/
            _beneficiaries.length == _durations.length && /*solium-disable-line operator-whitespace*/
            _beneficiaries.length == _frequencies.length && /*solium-disable-line operator-whitespace*/
            _beneficiaries.length == _startTimes.length,
            "Arrays sizes mismatch"
        );emit __AssertPostCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',32);

emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',459);
        emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',122);
for (uint256 i = 0; i < _beneficiaries.length; i++) {
emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',460);
            emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',123);
_addSchedule(_beneficiaries[i], _templateNames[i], _numberOfTokens[i], _durations[i], _frequencies[i], _startTimes[i]);
        }
    }

    /**
     * @notice Used to bulk add vesting schedules from template for each of the beneficiary
     * @param _beneficiaries Array of beneficiary's addresses
     * @param _templateNames Array of the template names were used for schedule creation
     * @param _startTimes Array of the vesting start time
     */
    function addScheduleFromTemplateMulti(address[] _beneficiaries, bytes32[] _templateNames, uint256[] _startTimes) external withPerm(ADMIN) {emit __FunctionCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',34);

emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',471);
        emit __AssertPreCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',33);
emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',124);
require(_beneficiaries.length == _templateNames.length && _beneficiaries.length == _startTimes.length, "Arrays sizes mismatch");emit __AssertPostCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',33);

emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',472);
        emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',125);
for (uint256 i = 0; i < _beneficiaries.length; i++) {
emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',473);
            emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',126);
_addScheduleFromTemplate(_beneficiaries[i], _templateNames[i], _startTimes[i]);
        }
    }

    /**
     * @notice Used to bulk revoke vesting schedules for each of the beneficiaries
     * @param _beneficiaries Array of the beneficiary's addresses
     */
    function revokeSchedulesMulti(address[] _beneficiaries) external withPerm(ADMIN) {emit __FunctionCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',35);

emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',482);
        emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',127);
for (uint256 i = 0; i < _beneficiaries.length; i++) {
emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',483);
            emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',128);
_revokeAllSchedules(_beneficiaries[i]);
        }
    }

    /**
     * @notice Used to bulk modify vesting schedules for each of the beneficiaries
     * @param _beneficiaries Array of the beneficiary's addresses
     * @param _templateNames Array of the template names
     * @param _startTimes Array of the vesting start time
     */
    function modifyScheduleMulti(
        address[] _beneficiaries,
        bytes32[] _templateNames,
        uint256[] _startTimes
    )
        public
        withPerm(ADMIN)
    {emit __FunctionCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',36);

emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',501);
        emit __AssertPreCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',34);
emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',129);
require(
            _beneficiaries.length == _templateNames.length && /*solium-disable-line operator-whitespace*/
            _beneficiaries.length == _startTimes.length,
            "Arrays sizes mismatch"
        );emit __AssertPostCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',34);

emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',506);
        emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',130);
for (uint256 i = 0; i < _beneficiaries.length; i++) {
emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',507);
            emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',131);
_modifySchedule(_beneficiaries[i], _templateNames[i], _startTimes[i]);
        }
    }

    function _checkSchedule(address _beneficiary, bytes32 _templateName) internal  {emit __FunctionCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',37);

emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',512);
        emit __AssertPreCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',35);
emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',132);
require(_beneficiary != address(0), "Invalid address");emit __AssertPostCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',35);

emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',513);
        emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',133);
uint256 index = userToTemplateIndex[_beneficiary][_templateName];
emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',514);
        emit __AssertPreCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',36);
emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',134);
require(
            index < schedules[_beneficiary].length &&
            schedules[_beneficiary][index].templateName == _templateName,
            "Schedule not found"
        );emit __AssertPostCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',36);

    }

    function _isTemplateExists(bytes32 _name) internal  returns(bool) {emit __FunctionCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',38);

emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',522);
        emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',135);
return templates[_name].numberOfTokens > 0;
    }

    function _validateTemplate(uint256 _numberOfTokens, uint256 _duration, uint256 _frequency) internal  {emit __FunctionCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',39);

emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',526);
        emit __AssertPreCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',37);
emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',136);
require(_numberOfTokens > 0, "Zero amount");emit __AssertPostCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',37);

emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',527);
        emit __AssertPreCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',38);
emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',137);
require(_duration % _frequency == 0, "Invalid frequency");emit __AssertPostCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',38);

emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',528);
        emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',138);
uint256 periodCount = _duration.div(_frequency);
emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',529);
        emit __AssertPreCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',39);
emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',139);
require(_numberOfTokens % periodCount == 0);emit __AssertPostCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',39);

emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',530);
        emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',140);
uint256 amountPerPeriod = _numberOfTokens.div(periodCount);
emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',531);
        emit __AssertPreCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',40);
emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',141);
require(amountPerPeriod % ISecurityToken(securityToken).granularity() == 0, "Invalid granularity");emit __AssertPostCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',40);

    }

    function _sendTokens(address _beneficiary) internal {emit __FunctionCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',40);

emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',535);
        emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',142);
for (uint256 i = 0; i < schedules[_beneficiary].length; i++) {
emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',536);
            emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',143);
_sendTokensPerSchedule(_beneficiary, i);
        }
    }

    function _sendTokensPerSchedule(address _beneficiary, uint256 _index) internal {emit __FunctionCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',41);

emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',541);
        emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',144);
uint256 amount = _getAvailableTokens(_beneficiary, _index);
emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',542);
        emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',145);
if (amount > 0) {emit __BranchCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',41,0);
emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',543);
            emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',146);
schedules[_beneficiary][_index].claimedTokens = schedules[_beneficiary][_index].claimedTokens.add(amount);
emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',544);
            emit __AssertPreCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',42);
emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',147);
require(ISecurityToken(securityToken).transfer(_beneficiary, amount), "Transfer failed");emit __AssertPostCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',42);

emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',545);
            emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',148);
emit SendTokens(_beneficiary, amount);
        }else { emit __BranchCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',41,1);}

    }

    /**
     * @notice Return the permissions flag that are associated with VestingEscrowWallet
     */
    function getPermissions() public  returns(bytes32[]) {emit __FunctionCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',42);

emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',553);
        emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',149);
bytes32[] memory allPermissions = new bytes32[](1);
emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',554);
        emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',150);
allPermissions[0] = ADMIN;
emit __CoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',555);
        emit __StatementCoverageVestingEscrowWallet('./contracts/modules/Wallet/VestingEscrowWallet.sol',151);
return allPermissions;
    }

}
