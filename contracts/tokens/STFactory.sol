pragma solidity ^0.4.24;

import "./SecurityToken.sol";
import "../interfaces/ISTFactory.sol";

/**
 * @title Proxy for deploying SecurityToken instances
 */
contract STFactory is ISTFactory {event __CoverageSTFactory(string fileName, uint256 lineNumber);
event __FunctionCoverageSTFactory(string fileName, uint256 fnId);
event __StatementCoverageSTFactory(string fileName, uint256 statementId);
event __BranchCoverageSTFactory(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageSTFactory(string fileName, uint256 branchId);
event __AssertPostCoverageSTFactory(string fileName, uint256 branchId);


    address public transferManagerFactory;

    constructor (address _transferManagerFactory) public {emit __FunctionCoverageSTFactory('./contracts/tokens/STFactory.sol',1);

emit __CoverageSTFactory('./contracts/tokens/STFactory.sol',14);
        emit __StatementCoverageSTFactory('./contracts/tokens/STFactory.sol',1);
transferManagerFactory = _transferManagerFactory;
    }

    /**
     * @notice deploys the token and adds default modules like the GeneralTransferManager.
     * Future versions of the proxy can attach different modules or pass different parameters.
     */
    function deployToken(
        string _name,
        string _symbol,
        uint8 _decimals,
        string _tokenDetails,
        address _issuer,
        bool _divisible,
        address _polymathRegistry
        ) external returns (address) {emit __FunctionCoverageSTFactory('./contracts/tokens/STFactory.sol',2);

emit __CoverageSTFactory('./contracts/tokens/STFactory.sol',30);
        emit __StatementCoverageSTFactory('./contracts/tokens/STFactory.sol',2);
address newSecurityTokenAddress = new SecurityToken(
            _name,
            _symbol,
            _decimals,
            _divisible ? 1 : uint256(10)**_decimals,
            _tokenDetails,
            _polymathRegistry
        );
emit __CoverageSTFactory('./contracts/tokens/STFactory.sol',38);
        emit __StatementCoverageSTFactory('./contracts/tokens/STFactory.sol',3);
SecurityToken(newSecurityTokenAddress).addModule(transferManagerFactory, "", 0, 0);
emit __CoverageSTFactory('./contracts/tokens/STFactory.sol',39);
        emit __StatementCoverageSTFactory('./contracts/tokens/STFactory.sol',4);
SecurityToken(newSecurityTokenAddress).transferOwnership(_issuer);
emit __CoverageSTFactory('./contracts/tokens/STFactory.sol',40);
        emit __StatementCoverageSTFactory('./contracts/tokens/STFactory.sol',5);
return newSecurityTokenAddress;
    }
}
