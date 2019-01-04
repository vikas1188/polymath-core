pragma solidity ^0.4.24;

import "../interfaces/IERC20.sol";
import "../interfaces/IModuleFactory.sol";
import "openzeppelin-solidity/contracts/ownership/Ownable.sol";
import "../libraries/VersionUtils.sol";

/**
 * @title Interface that any module factory contract should implement
 * @notice Contract is abstract
 */
contract ModuleFactory is IModuleFactory, Ownable {event __CoverageModuleFactory(string fileName, uint256 lineNumber);
event __FunctionCoverageModuleFactory(string fileName, uint256 fnId);
event __StatementCoverageModuleFactory(string fileName, uint256 statementId);
event __BranchCoverageModuleFactory(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageModuleFactory(string fileName, uint256 branchId);
event __AssertPostCoverageModuleFactory(string fileName, uint256 branchId);


    IERC20 public polyToken;
    uint256 public usageCost;
    uint256 public monthlySubscriptionCost;

    uint256 public setupCost;
    string public description;
    string public version;
    bytes32 public name;
    string public title;

    // @notice Allow only two variables to be stored
    // 1. lowerBound 
    // 2. upperBound
    // @dev (0.0.0 will act as the wildcard) 
    // @dev uint24 consists packed value of uint8 _major, uint8 _minor, uint8 _patch
    mapping(string => uint24) compatibleSTVersionRange;

    event ChangeFactorySetupFee(uint256 _oldSetupCost, uint256 _newSetupCost, address _moduleFactory);
    event ChangeFactoryUsageFee(uint256 _oldUsageCost, uint256 _newUsageCost, address _moduleFactory);
    event ChangeFactorySubscriptionFee(uint256 _oldSubscriptionCost, uint256 _newMonthlySubscriptionCost, address _moduleFactory);
    event GenerateModuleFromFactory(
        address _module,
        bytes32 indexed _moduleName,
        address indexed _moduleFactory,
        address _creator,
        uint256 _timestamp
    );
    event ChangeSTVersionBound(string _boundType, uint8 _major, uint8 _minor, uint8 _patch);

    /**
     * @notice Constructor
     * @param _polyAddress Address of the polytoken
     */
    constructor (address _polyAddress, uint256 _setupCost, uint256 _usageCost, uint256 _subscriptionCost) public {emit __FunctionCoverageModuleFactory('./contracts/modules/ModuleFactory.sol',1);

emit __CoverageModuleFactory('./contracts/modules/ModuleFactory.sol',48);
        emit __StatementCoverageModuleFactory('./contracts/modules/ModuleFactory.sol',1);
polyToken = IERC20(_polyAddress);
emit __CoverageModuleFactory('./contracts/modules/ModuleFactory.sol',49);
        emit __StatementCoverageModuleFactory('./contracts/modules/ModuleFactory.sol',2);
setupCost = _setupCost;
emit __CoverageModuleFactory('./contracts/modules/ModuleFactory.sol',50);
        emit __StatementCoverageModuleFactory('./contracts/modules/ModuleFactory.sol',3);
usageCost = _usageCost;
emit __CoverageModuleFactory('./contracts/modules/ModuleFactory.sol',51);
        emit __StatementCoverageModuleFactory('./contracts/modules/ModuleFactory.sol',4);
monthlySubscriptionCost = _subscriptionCost;
    }

    /**
     * @notice Used to change the fee of the setup cost
     * @param _newSetupCost new setup cost
     */
    function changeFactorySetupFee(uint256 _newSetupCost) public onlyOwner {emit __FunctionCoverageModuleFactory('./contracts/modules/ModuleFactory.sol',2);

emit __CoverageModuleFactory('./contracts/modules/ModuleFactory.sol',59);
        emit __StatementCoverageModuleFactory('./contracts/modules/ModuleFactory.sol',5);
emit ChangeFactorySetupFee(setupCost, _newSetupCost, address(this));
emit __CoverageModuleFactory('./contracts/modules/ModuleFactory.sol',60);
        emit __StatementCoverageModuleFactory('./contracts/modules/ModuleFactory.sol',6);
setupCost = _newSetupCost;
    }

    /**
     * @notice Used to change the fee of the usage cost
     * @param _newUsageCost new usage cost
     */
    function changeFactoryUsageFee(uint256 _newUsageCost) public onlyOwner {emit __FunctionCoverageModuleFactory('./contracts/modules/ModuleFactory.sol',3);

emit __CoverageModuleFactory('./contracts/modules/ModuleFactory.sol',68);
        emit __StatementCoverageModuleFactory('./contracts/modules/ModuleFactory.sol',7);
emit ChangeFactoryUsageFee(usageCost, _newUsageCost, address(this));
emit __CoverageModuleFactory('./contracts/modules/ModuleFactory.sol',69);
        emit __StatementCoverageModuleFactory('./contracts/modules/ModuleFactory.sol',8);
usageCost = _newUsageCost;
    }

    /**
     * @notice Used to change the fee of the subscription cost
     * @param _newSubscriptionCost new subscription cost
     */
    function changeFactorySubscriptionFee(uint256 _newSubscriptionCost) public onlyOwner {emit __FunctionCoverageModuleFactory('./contracts/modules/ModuleFactory.sol',4);

emit __CoverageModuleFactory('./contracts/modules/ModuleFactory.sol',77);
        emit __StatementCoverageModuleFactory('./contracts/modules/ModuleFactory.sol',9);
emit ChangeFactorySubscriptionFee(monthlySubscriptionCost, _newSubscriptionCost, address(this));
emit __CoverageModuleFactory('./contracts/modules/ModuleFactory.sol',78);
        emit __StatementCoverageModuleFactory('./contracts/modules/ModuleFactory.sol',10);
monthlySubscriptionCost = _newSubscriptionCost;

    }

    /**
     * @notice Updates the title of the ModuleFactory
     * @param _newTitle New Title that will replace the old one.
     */
    function changeTitle(string _newTitle) public onlyOwner {emit __FunctionCoverageModuleFactory('./contracts/modules/ModuleFactory.sol',5);

emit __CoverageModuleFactory('./contracts/modules/ModuleFactory.sol',87);
        emit __AssertPreCoverageModuleFactory('./contracts/modules/ModuleFactory.sol',1);
emit __StatementCoverageModuleFactory('./contracts/modules/ModuleFactory.sol',11);
require(bytes(_newTitle).length > 0, "Invalid title");emit __AssertPostCoverageModuleFactory('./contracts/modules/ModuleFactory.sol',1);

emit __CoverageModuleFactory('./contracts/modules/ModuleFactory.sol',88);
        emit __StatementCoverageModuleFactory('./contracts/modules/ModuleFactory.sol',12);
title = _newTitle;
    }

    /**
     * @notice Updates the description of the ModuleFactory
     * @param _newDesc New description that will replace the old one.
     */
    function changeDescription(string _newDesc) public onlyOwner {emit __FunctionCoverageModuleFactory('./contracts/modules/ModuleFactory.sol',6);

emit __CoverageModuleFactory('./contracts/modules/ModuleFactory.sol',96);
        emit __AssertPreCoverageModuleFactory('./contracts/modules/ModuleFactory.sol',2);
emit __StatementCoverageModuleFactory('./contracts/modules/ModuleFactory.sol',13);
require(bytes(_newDesc).length > 0, "Invalid description");emit __AssertPostCoverageModuleFactory('./contracts/modules/ModuleFactory.sol',2);

emit __CoverageModuleFactory('./contracts/modules/ModuleFactory.sol',97);
        emit __StatementCoverageModuleFactory('./contracts/modules/ModuleFactory.sol',14);
description = _newDesc;
    }

    /**
     * @notice Updates the name of the ModuleFactory
     * @param _newName New name that will replace the old one.
     */
    function changeName(bytes32 _newName) public onlyOwner {emit __FunctionCoverageModuleFactory('./contracts/modules/ModuleFactory.sol',7);

emit __CoverageModuleFactory('./contracts/modules/ModuleFactory.sol',105);
        emit __AssertPreCoverageModuleFactory('./contracts/modules/ModuleFactory.sol',3);
emit __StatementCoverageModuleFactory('./contracts/modules/ModuleFactory.sol',15);
require(_newName != bytes32(0),"Invalid name");emit __AssertPostCoverageModuleFactory('./contracts/modules/ModuleFactory.sol',3);

emit __CoverageModuleFactory('./contracts/modules/ModuleFactory.sol',106);
        emit __StatementCoverageModuleFactory('./contracts/modules/ModuleFactory.sol',16);
name = _newName;
    }

    /**
     * @notice Updates the version of the ModuleFactory
     * @param _newVersion New name that will replace the old one.
     */
    function changeVersion(string _newVersion) public onlyOwner {emit __FunctionCoverageModuleFactory('./contracts/modules/ModuleFactory.sol',8);

emit __CoverageModuleFactory('./contracts/modules/ModuleFactory.sol',114);
        emit __AssertPreCoverageModuleFactory('./contracts/modules/ModuleFactory.sol',4);
emit __StatementCoverageModuleFactory('./contracts/modules/ModuleFactory.sol',17);
require(bytes(_newVersion).length > 0, "Invalid version");emit __AssertPostCoverageModuleFactory('./contracts/modules/ModuleFactory.sol',4);

emit __CoverageModuleFactory('./contracts/modules/ModuleFactory.sol',115);
        emit __StatementCoverageModuleFactory('./contracts/modules/ModuleFactory.sol',18);
version = _newVersion;
    }

    /**
     * @notice Function use to change the lower and upper bound of the compatible version st
     * @param _boundType Type of bound
     * @param _newVersion new version array
     */
    function changeSTVersionBounds(string _boundType, uint8[] _newVersion) external onlyOwner {emit __FunctionCoverageModuleFactory('./contracts/modules/ModuleFactory.sol',9);

emit __CoverageModuleFactory('./contracts/modules/ModuleFactory.sol',124);
        emit __AssertPreCoverageModuleFactory('./contracts/modules/ModuleFactory.sol',5);
emit __StatementCoverageModuleFactory('./contracts/modules/ModuleFactory.sol',19);
require(
            keccak256(abi.encodePacked(_boundType)) == keccak256(abi.encodePacked("lowerBound")) ||
            keccak256(abi.encodePacked(_boundType)) == keccak256(abi.encodePacked("upperBound")),
            "Must be a valid bound type"
        );emit __AssertPostCoverageModuleFactory('./contracts/modules/ModuleFactory.sol',5);

emit __CoverageModuleFactory('./contracts/modules/ModuleFactory.sol',129);
        emit __AssertPreCoverageModuleFactory('./contracts/modules/ModuleFactory.sol',6);
emit __StatementCoverageModuleFactory('./contracts/modules/ModuleFactory.sol',20);
require(_newVersion.length == 3);emit __AssertPostCoverageModuleFactory('./contracts/modules/ModuleFactory.sol',6);

emit __CoverageModuleFactory('./contracts/modules/ModuleFactory.sol',130);
        emit __StatementCoverageModuleFactory('./contracts/modules/ModuleFactory.sol',21);
if (compatibleSTVersionRange[_boundType] != uint24(0)) {emit __BranchCoverageModuleFactory('./contracts/modules/ModuleFactory.sol',7,0); 
emit __CoverageModuleFactory('./contracts/modules/ModuleFactory.sol',131);
            emit __StatementCoverageModuleFactory('./contracts/modules/ModuleFactory.sol',22);
uint8[] memory _currentVersion = VersionUtils.unpack(compatibleSTVersionRange[_boundType]);
emit __CoverageModuleFactory('./contracts/modules/ModuleFactory.sol',132);
            emit __AssertPreCoverageModuleFactory('./contracts/modules/ModuleFactory.sol',8);
emit __StatementCoverageModuleFactory('./contracts/modules/ModuleFactory.sol',23);
require(VersionUtils.isValidVersion(_currentVersion, _newVersion), "Failed because of in-valid version");emit __AssertPostCoverageModuleFactory('./contracts/modules/ModuleFactory.sol',8);

        }else { emit __BranchCoverageModuleFactory('./contracts/modules/ModuleFactory.sol',7,1);}

emit __CoverageModuleFactory('./contracts/modules/ModuleFactory.sol',134);
        emit __StatementCoverageModuleFactory('./contracts/modules/ModuleFactory.sol',24);
compatibleSTVersionRange[_boundType] = VersionUtils.pack(_newVersion[0], _newVersion[1], _newVersion[2]);
emit __CoverageModuleFactory('./contracts/modules/ModuleFactory.sol',135);
        emit __StatementCoverageModuleFactory('./contracts/modules/ModuleFactory.sol',25);
emit ChangeSTVersionBound(_boundType, _newVersion[0], _newVersion[1], _newVersion[2]);
    }

    /**
     * @notice Used to get the lower bound
     * @return lower bound
     */
    function getLowerSTVersionBounds() external  returns(uint8[]) {emit __FunctionCoverageModuleFactory('./contracts/modules/ModuleFactory.sol',10);

emit __CoverageModuleFactory('./contracts/modules/ModuleFactory.sol',143);
        emit __StatementCoverageModuleFactory('./contracts/modules/ModuleFactory.sol',26);
return VersionUtils.unpack(compatibleSTVersionRange["lowerBound"]);
    }

    /**
     * @notice Used to get the upper bound
     * @return upper bound
     */
    function getUpperSTVersionBounds() external  returns(uint8[]) {emit __FunctionCoverageModuleFactory('./contracts/modules/ModuleFactory.sol',11);

emit __CoverageModuleFactory('./contracts/modules/ModuleFactory.sol',151);
        emit __StatementCoverageModuleFactory('./contracts/modules/ModuleFactory.sol',27);
return VersionUtils.unpack(compatibleSTVersionRange["upperBound"]);
    }

    /**
     * @notice Get the setup cost of the module
     */
    function getSetupCost() external  returns (uint256) {emit __FunctionCoverageModuleFactory('./contracts/modules/ModuleFactory.sol',12);

emit __CoverageModuleFactory('./contracts/modules/ModuleFactory.sol',158);
        emit __StatementCoverageModuleFactory('./contracts/modules/ModuleFactory.sol',28);
return setupCost;
    }

   /**
    * @notice Get the name of the Module
    */
    function getName() public  returns(bytes32) {emit __FunctionCoverageModuleFactory('./contracts/modules/ModuleFactory.sol',13);

emit __CoverageModuleFactory('./contracts/modules/ModuleFactory.sol',165);
        emit __StatementCoverageModuleFactory('./contracts/modules/ModuleFactory.sol',29);
return name;
    }

}
