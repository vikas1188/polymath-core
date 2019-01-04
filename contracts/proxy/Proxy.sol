pragma solidity ^0.4.24;

/**
 * @title Proxy
 * @dev Gives the possibility to delegate any call to a foreign implementation.
 */
contract Proxy {event __CoverageProxy(string fileName, uint256 lineNumber);
event __FunctionCoverageProxy(string fileName, uint256 fnId);
event __StatementCoverageProxy(string fileName, uint256 statementId);
event __BranchCoverageProxy(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageProxy(string fileName, uint256 branchId);
event __AssertPostCoverageProxy(string fileName, uint256 branchId);


    /**
    * @dev Tells the address of the implementation where every call will be delegated.
    * @return address of the implementation to which it will be delegated
    */
    function _implementation() internal  returns (address);

    /**
    * @dev Fallback function.
    * Implemented entirely in `_fallback`.
    */
    function _fallback() internal {emit __FunctionCoverageProxy('./contracts/proxy/Proxy.sol',1);

emit __CoverageProxy('./contracts/proxy/Proxy.sol',20);
        emit __StatementCoverageProxy('./contracts/proxy/Proxy.sol',1);
_delegate(_implementation());
    }

    /**
    * @dev Fallback function allowing to perform a delegatecall to the given implementation.
    * This function will return whatever the implementation call returns
    */
    function _delegate(address implementation) internal {emit __FunctionCoverageProxy('./contracts/proxy/Proxy.sol',2);

        /*solium-disable-next-line security/no-inline-assembly*/
emit __CoverageProxy('./contracts/proxy/Proxy.sol',29);
        assembly {
            // Copy msg.data. We take full control of memory in this inline assembly
            // block because it will not return to Solidity code. We overwrite the
            // Solidity scratch pad at memory position 0.
            calldatacopy(0, 0, calldatasize)

            // Call the implementation.
            // out and outsize are 0 because we don't know the size yet.
            let result := delegatecall(gas, implementation, 0, calldatasize, 0, 0)

            // Copy the returned data.
            returndatacopy(0, 0, returndatasize)

            switch result
            // delegatecall returns 0 on error.
            case 0 { revert(0, returndatasize) }
            default { return(0, returndatasize) }
        }
    }

    function () public payable {emit __FunctionCoverageProxy('./contracts/proxy/Proxy.sol',3);

emit __CoverageProxy('./contracts/proxy/Proxy.sol',50);
        emit __StatementCoverageProxy('./contracts/proxy/Proxy.sol',2);
_fallback();
    }
}