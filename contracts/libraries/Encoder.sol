pragma solidity ^0.4.24;

library Encoder {event __CoverageEncoder(string fileName, uint256 lineNumber);
event __FunctionCoverageEncoder(string fileName, uint256 fnId);
event __StatementCoverageEncoder(string fileName, uint256 statementId);
event __BranchCoverageEncoder(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageEncoder(string fileName, uint256 branchId);
event __AssertPostCoverageEncoder(string fileName, uint256 branchId);


    function getKey(string _key) internal  returns (bytes32) {emit __FunctionCoverageEncoder('./contracts/libraries/Encoder.sol',1);

emit __CoverageEncoder('./contracts/libraries/Encoder.sol',6);
        emit __StatementCoverageEncoder('./contracts/libraries/Encoder.sol',1);
return bytes32(keccak256(abi.encodePacked(_key)));
    }

    function getKey(string _key1, address _key2) internal  returns (bytes32) {emit __FunctionCoverageEncoder('./contracts/libraries/Encoder.sol',2);

emit __CoverageEncoder('./contracts/libraries/Encoder.sol',10);
        emit __StatementCoverageEncoder('./contracts/libraries/Encoder.sol',2);
return bytes32(keccak256(abi.encodePacked(_key1, _key2)));
    }

    function getKey(string _key1, string _key2) internal  returns (bytes32) {emit __FunctionCoverageEncoder('./contracts/libraries/Encoder.sol',3);

emit __CoverageEncoder('./contracts/libraries/Encoder.sol',14);
        emit __StatementCoverageEncoder('./contracts/libraries/Encoder.sol',3);
return bytes32(keccak256(abi.encodePacked(_key1, _key2)));
    }

    function getKey(string _key1, uint256 _key2) internal  returns (bytes32) {emit __FunctionCoverageEncoder('./contracts/libraries/Encoder.sol',4);

emit __CoverageEncoder('./contracts/libraries/Encoder.sol',18);
        emit __StatementCoverageEncoder('./contracts/libraries/Encoder.sol',4);
return bytes32(keccak256(abi.encodePacked(_key1, _key2)));
    }

    function getKey(string _key1, bytes32 _key2) internal  returns (bytes32) {emit __FunctionCoverageEncoder('./contracts/libraries/Encoder.sol',5);

emit __CoverageEncoder('./contracts/libraries/Encoder.sol',22);
        emit __StatementCoverageEncoder('./contracts/libraries/Encoder.sol',5);
return bytes32(keccak256(abi.encodePacked(_key1, _key2)));
    }

    function getKey(string _key1, bool _key2) internal  returns (bytes32) {emit __FunctionCoverageEncoder('./contracts/libraries/Encoder.sol',6);

emit __CoverageEncoder('./contracts/libraries/Encoder.sol',26);
        emit __StatementCoverageEncoder('./contracts/libraries/Encoder.sol',6);
return bytes32(keccak256(abi.encodePacked(_key1, _key2)));
    }

}
