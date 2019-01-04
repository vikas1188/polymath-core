pragma solidity ^0.4.18;

import "./Proxy.sol";

/**
 * @title OwnedProxy
 * @dev This contract combines an upgradeability proxy with basic authorization control functionalities
 */
contract OwnedProxy is Proxy {event __CoverageOwnedProxy(string fileName, uint256 lineNumber);
event __FunctionCoverageOwnedProxy(string fileName, uint256 fnId);
event __StatementCoverageOwnedProxy(string fileName, uint256 statementId);
event __BranchCoverageOwnedProxy(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageOwnedProxy(string fileName, uint256 branchId);
event __AssertPostCoverageOwnedProxy(string fileName, uint256 branchId);


    // Owner of the contract
    address private __owner;

    // Address of the current implementation
    address internal __implementation;

    /**
    * @dev Event to show ownership has been transferred
    * @param _previousOwner representing the address of the previous owner
    * @param _newOwner representing the address of the new owner
    */
    event ProxyOwnershipTransferred(address _previousOwner, address _newOwner);

    /**
    * @dev Throws if called by any account other than the owner.
    */
    modifier ifOwner() {emit __FunctionCoverageOwnedProxy('./contracts/proxy/OwnedProxy.sol',1);

emit __CoverageOwnedProxy('./contracts/proxy/OwnedProxy.sol',28);
        emit __StatementCoverageOwnedProxy('./contracts/proxy/OwnedProxy.sol',1);
if (msg.sender == _owner()) {emit __BranchCoverageOwnedProxy('./contracts/proxy/OwnedProxy.sol',1,0);
emit __CoverageOwnedProxy('./contracts/proxy/OwnedProxy.sol',29);
            _;
        } else {emit __BranchCoverageOwnedProxy('./contracts/proxy/OwnedProxy.sol',1,1);
emit __CoverageOwnedProxy('./contracts/proxy/OwnedProxy.sol',31);
            emit __StatementCoverageOwnedProxy('./contracts/proxy/OwnedProxy.sol',2);
_fallback();
        }
    }

    /**
    * @dev the constructor sets the original owner of the contract to the sender account.
    */
    constructor() public {emit __FunctionCoverageOwnedProxy('./contracts/proxy/OwnedProxy.sol',2);

emit __CoverageOwnedProxy('./contracts/proxy/OwnedProxy.sol',39);
        emit __StatementCoverageOwnedProxy('./contracts/proxy/OwnedProxy.sol',3);
_setOwner(msg.sender);
    }

    /**
    * @dev Tells the address of the owner
    * @return the address of the owner
    */
    function _owner() internal  returns (address) {emit __FunctionCoverageOwnedProxy('./contracts/proxy/OwnedProxy.sol',3);

emit __CoverageOwnedProxy('./contracts/proxy/OwnedProxy.sol',47);
        emit __StatementCoverageOwnedProxy('./contracts/proxy/OwnedProxy.sol',4);
return __owner;
    }

    /**
    * @dev Sets the address of the owner
    */
    function _setOwner(address _newOwner) internal {emit __FunctionCoverageOwnedProxy('./contracts/proxy/OwnedProxy.sol',4);

emit __CoverageOwnedProxy('./contracts/proxy/OwnedProxy.sol',54);
        emit __AssertPreCoverageOwnedProxy('./contracts/proxy/OwnedProxy.sol',2);
emit __StatementCoverageOwnedProxy('./contracts/proxy/OwnedProxy.sol',5);
require(_newOwner != address(0), "Address should not be 0x");emit __AssertPostCoverageOwnedProxy('./contracts/proxy/OwnedProxy.sol',2);

emit __CoverageOwnedProxy('./contracts/proxy/OwnedProxy.sol',55);
        emit __StatementCoverageOwnedProxy('./contracts/proxy/OwnedProxy.sol',6);
__owner = _newOwner;
    }

    /**
    * @notice Internal function to provide the address of the implementation contract
    */
    function _implementation() internal  returns (address) {emit __FunctionCoverageOwnedProxy('./contracts/proxy/OwnedProxy.sol',5);

emit __CoverageOwnedProxy('./contracts/proxy/OwnedProxy.sol',62);
        emit __StatementCoverageOwnedProxy('./contracts/proxy/OwnedProxy.sol',7);
return __implementation;
    }

    /**
    * @dev Tells the address of the proxy owner
    * @return the address of the proxy owner
    */
    function proxyOwner() external ifOwner returns (address) {emit __FunctionCoverageOwnedProxy('./contracts/proxy/OwnedProxy.sol',6);

emit __CoverageOwnedProxy('./contracts/proxy/OwnedProxy.sol',70);
        emit __StatementCoverageOwnedProxy('./contracts/proxy/OwnedProxy.sol',8);
return _owner();
    }

    /**
    * @dev Tells the address of the current implementation
    * @return address of the current implementation
    */
    function implementation() external ifOwner returns (address) {emit __FunctionCoverageOwnedProxy('./contracts/proxy/OwnedProxy.sol',7);

emit __CoverageOwnedProxy('./contracts/proxy/OwnedProxy.sol',78);
        emit __StatementCoverageOwnedProxy('./contracts/proxy/OwnedProxy.sol',9);
return _implementation();
    }

    /**
    * @dev Allows the current owner to transfer control of the contract to a newOwner.
    * @param _newOwner The address to transfer ownership to.
    */
    function transferProxyOwnership(address _newOwner) external ifOwner {emit __FunctionCoverageOwnedProxy('./contracts/proxy/OwnedProxy.sol',8);

emit __CoverageOwnedProxy('./contracts/proxy/OwnedProxy.sol',86);
        emit __AssertPreCoverageOwnedProxy('./contracts/proxy/OwnedProxy.sol',3);
emit __StatementCoverageOwnedProxy('./contracts/proxy/OwnedProxy.sol',10);
require(_newOwner != address(0), "Address should not be 0x");emit __AssertPostCoverageOwnedProxy('./contracts/proxy/OwnedProxy.sol',3);

emit __CoverageOwnedProxy('./contracts/proxy/OwnedProxy.sol',87);
        emit __StatementCoverageOwnedProxy('./contracts/proxy/OwnedProxy.sol',11);
emit ProxyOwnershipTransferred(_owner(), _newOwner);
emit __CoverageOwnedProxy('./contracts/proxy/OwnedProxy.sol',88);
        emit __StatementCoverageOwnedProxy('./contracts/proxy/OwnedProxy.sol',12);
_setOwner(_newOwner);
    }

}
