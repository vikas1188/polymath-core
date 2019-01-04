pragma solidity ^0.4.18;

import "./UpgradeabilityProxy.sol";

/**
 * @title OwnedUpgradeabilityProxy
 * @dev This contract combines an upgradeability proxy with basic authorization control functionalities
 */
contract OwnedUpgradeabilityProxy is UpgradeabilityProxy {event __CoverageOwnedUpgradeabilityProxy(string fileName, uint256 lineNumber);
event __FunctionCoverageOwnedUpgradeabilityProxy(string fileName, uint256 fnId);
event __StatementCoverageOwnedUpgradeabilityProxy(string fileName, uint256 statementId);
event __BranchCoverageOwnedUpgradeabilityProxy(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageOwnedUpgradeabilityProxy(string fileName, uint256 branchId);
event __AssertPostCoverageOwnedUpgradeabilityProxy(string fileName, uint256 branchId);


    // Owner of the contract
    address private __upgradeabilityOwner;

    /**
    * @dev Event to show ownership has been transferred
    * @param _previousOwner representing the address of the previous owner
    * @param _newOwner representing the address of the new owner
    */
    event ProxyOwnershipTransferred(address _previousOwner, address _newOwner);

    /**
    * @dev Throws if called by any account other than the owner.
    */
    modifier ifOwner() {emit __FunctionCoverageOwnedUpgradeabilityProxy('./contracts/proxy/OwnedUpgradeabilityProxy.sol',1);

emit __CoverageOwnedUpgradeabilityProxy('./contracts/proxy/OwnedUpgradeabilityProxy.sol',25);
        emit __StatementCoverageOwnedUpgradeabilityProxy('./contracts/proxy/OwnedUpgradeabilityProxy.sol',1);
if (msg.sender == _upgradeabilityOwner()) {emit __BranchCoverageOwnedUpgradeabilityProxy('./contracts/proxy/OwnedUpgradeabilityProxy.sol',1,0);
emit __CoverageOwnedUpgradeabilityProxy('./contracts/proxy/OwnedUpgradeabilityProxy.sol',26);
            _;
        } else {emit __BranchCoverageOwnedUpgradeabilityProxy('./contracts/proxy/OwnedUpgradeabilityProxy.sol',1,1);
emit __CoverageOwnedUpgradeabilityProxy('./contracts/proxy/OwnedUpgradeabilityProxy.sol',28);
            emit __StatementCoverageOwnedUpgradeabilityProxy('./contracts/proxy/OwnedUpgradeabilityProxy.sol',2);
_fallback();
        }
    }

    /**
    * @dev the constructor sets the original owner of the contract to the sender account.
    */
    constructor() public {emit __FunctionCoverageOwnedUpgradeabilityProxy('./contracts/proxy/OwnedUpgradeabilityProxy.sol',2);

emit __CoverageOwnedUpgradeabilityProxy('./contracts/proxy/OwnedUpgradeabilityProxy.sol',36);
        emit __StatementCoverageOwnedUpgradeabilityProxy('./contracts/proxy/OwnedUpgradeabilityProxy.sol',3);
_setUpgradeabilityOwner(msg.sender);
    }

    /**
    * @dev Tells the address of the owner
    * @return the address of the owner
    */
    function _upgradeabilityOwner() internal  returns (address) {emit __FunctionCoverageOwnedUpgradeabilityProxy('./contracts/proxy/OwnedUpgradeabilityProxy.sol',3);

emit __CoverageOwnedUpgradeabilityProxy('./contracts/proxy/OwnedUpgradeabilityProxy.sol',44);
        emit __StatementCoverageOwnedUpgradeabilityProxy('./contracts/proxy/OwnedUpgradeabilityProxy.sol',4);
return __upgradeabilityOwner;
    }

    /**
    * @dev Sets the address of the owner
    */
    function _setUpgradeabilityOwner(address _newUpgradeabilityOwner) internal {emit __FunctionCoverageOwnedUpgradeabilityProxy('./contracts/proxy/OwnedUpgradeabilityProxy.sol',4);

emit __CoverageOwnedUpgradeabilityProxy('./contracts/proxy/OwnedUpgradeabilityProxy.sol',51);
        emit __AssertPreCoverageOwnedUpgradeabilityProxy('./contracts/proxy/OwnedUpgradeabilityProxy.sol',2);
emit __StatementCoverageOwnedUpgradeabilityProxy('./contracts/proxy/OwnedUpgradeabilityProxy.sol',5);
require(_newUpgradeabilityOwner != address(0), "Address should not be 0x");emit __AssertPostCoverageOwnedUpgradeabilityProxy('./contracts/proxy/OwnedUpgradeabilityProxy.sol',2);

emit __CoverageOwnedUpgradeabilityProxy('./contracts/proxy/OwnedUpgradeabilityProxy.sol',52);
        emit __StatementCoverageOwnedUpgradeabilityProxy('./contracts/proxy/OwnedUpgradeabilityProxy.sol',6);
__upgradeabilityOwner = _newUpgradeabilityOwner;
    }

    /**
    * @notice Internal function to provide the address of the implementation contract
    */
    function _implementation() internal  returns (address) {emit __FunctionCoverageOwnedUpgradeabilityProxy('./contracts/proxy/OwnedUpgradeabilityProxy.sol',5);

emit __CoverageOwnedUpgradeabilityProxy('./contracts/proxy/OwnedUpgradeabilityProxy.sol',59);
        emit __StatementCoverageOwnedUpgradeabilityProxy('./contracts/proxy/OwnedUpgradeabilityProxy.sol',7);
return __implementation;
    }

    /**
    * @dev Tells the address of the proxy owner
    * @return the address of the proxy owner
    */
    function proxyOwner() external ifOwner returns (address) {emit __FunctionCoverageOwnedUpgradeabilityProxy('./contracts/proxy/OwnedUpgradeabilityProxy.sol',6);

emit __CoverageOwnedUpgradeabilityProxy('./contracts/proxy/OwnedUpgradeabilityProxy.sol',67);
        emit __StatementCoverageOwnedUpgradeabilityProxy('./contracts/proxy/OwnedUpgradeabilityProxy.sol',8);
return _upgradeabilityOwner();
    }

    /**
    * @dev Tells the version name of the current implementation
    * @return string representing the name of the current version
    */
    function version() external ifOwner returns (string) {emit __FunctionCoverageOwnedUpgradeabilityProxy('./contracts/proxy/OwnedUpgradeabilityProxy.sol',7);

emit __CoverageOwnedUpgradeabilityProxy('./contracts/proxy/OwnedUpgradeabilityProxy.sol',75);
        emit __StatementCoverageOwnedUpgradeabilityProxy('./contracts/proxy/OwnedUpgradeabilityProxy.sol',9);
return __version;
    }

    /**
    * @dev Tells the address of the current implementation
    * @return address of the current implementation
    */
    function implementation() external ifOwner returns (address) {emit __FunctionCoverageOwnedUpgradeabilityProxy('./contracts/proxy/OwnedUpgradeabilityProxy.sol',8);

emit __CoverageOwnedUpgradeabilityProxy('./contracts/proxy/OwnedUpgradeabilityProxy.sol',83);
        emit __StatementCoverageOwnedUpgradeabilityProxy('./contracts/proxy/OwnedUpgradeabilityProxy.sol',10);
return _implementation();
    }

    /**
    * @dev Allows the current owner to transfer control of the contract to a newOwner.
    * @param _newOwner The address to transfer ownership to.
    */
    function transferProxyOwnership(address _newOwner) external ifOwner {emit __FunctionCoverageOwnedUpgradeabilityProxy('./contracts/proxy/OwnedUpgradeabilityProxy.sol',9);

emit __CoverageOwnedUpgradeabilityProxy('./contracts/proxy/OwnedUpgradeabilityProxy.sol',91);
        emit __AssertPreCoverageOwnedUpgradeabilityProxy('./contracts/proxy/OwnedUpgradeabilityProxy.sol',3);
emit __StatementCoverageOwnedUpgradeabilityProxy('./contracts/proxy/OwnedUpgradeabilityProxy.sol',11);
require(_newOwner != address(0), "Address should not be 0x");emit __AssertPostCoverageOwnedUpgradeabilityProxy('./contracts/proxy/OwnedUpgradeabilityProxy.sol',3);

emit __CoverageOwnedUpgradeabilityProxy('./contracts/proxy/OwnedUpgradeabilityProxy.sol',92);
        emit __StatementCoverageOwnedUpgradeabilityProxy('./contracts/proxy/OwnedUpgradeabilityProxy.sol',12);
emit ProxyOwnershipTransferred(_upgradeabilityOwner(), _newOwner);
emit __CoverageOwnedUpgradeabilityProxy('./contracts/proxy/OwnedUpgradeabilityProxy.sol',93);
        emit __StatementCoverageOwnedUpgradeabilityProxy('./contracts/proxy/OwnedUpgradeabilityProxy.sol',13);
_setUpgradeabilityOwner(_newOwner);
    }

    /**
    * @dev Allows the upgradeability owner to upgrade the current version of the proxy.
    * @param _newVersion representing the version name of the new implementation to be set.
    * @param _newImplementation representing the address of the new implementation to be set.
    */
    function upgradeTo(string _newVersion, address _newImplementation) external ifOwner {emit __FunctionCoverageOwnedUpgradeabilityProxy('./contracts/proxy/OwnedUpgradeabilityProxy.sol',10);

emit __CoverageOwnedUpgradeabilityProxy('./contracts/proxy/OwnedUpgradeabilityProxy.sol',102);
        emit __StatementCoverageOwnedUpgradeabilityProxy('./contracts/proxy/OwnedUpgradeabilityProxy.sol',14);
_upgradeTo(_newVersion, _newImplementation);
    }

    /**
    * @dev Allows the upgradeability owner to upgrade the current version of the proxy and call the new implementation
    * to initialize whatever is needed through a low level call.
    * @param _newVersion representing the version name of the new implementation to be set.
    * @param _newImplementation representing the address of the new implementation to be set.
    * @param _data represents the msg.data to bet sent in the low level call. This parameter may include the function
    * signature of the implementation to be called with the needed payload
    */
    function upgradeToAndCall(string _newVersion, address _newImplementation, bytes _data) external payable ifOwner {emit __FunctionCoverageOwnedUpgradeabilityProxy('./contracts/proxy/OwnedUpgradeabilityProxy.sol',11);

emit __CoverageOwnedUpgradeabilityProxy('./contracts/proxy/OwnedUpgradeabilityProxy.sol',114);
        emit __StatementCoverageOwnedUpgradeabilityProxy('./contracts/proxy/OwnedUpgradeabilityProxy.sol',15);
_upgradeTo(_newVersion, _newImplementation);
        /*solium-disable-next-line security/no-call-value*/
emit __CoverageOwnedUpgradeabilityProxy('./contracts/proxy/OwnedUpgradeabilityProxy.sol',116);
        emit __AssertPreCoverageOwnedUpgradeabilityProxy('./contracts/proxy/OwnedUpgradeabilityProxy.sol',4);
emit __StatementCoverageOwnedUpgradeabilityProxy('./contracts/proxy/OwnedUpgradeabilityProxy.sol',16);
require(address(this).call.value(msg.value)(_data), "Fail in executing the function of implementation contract");emit __AssertPostCoverageOwnedUpgradeabilityProxy('./contracts/proxy/OwnedUpgradeabilityProxy.sol',4);

    }

}
