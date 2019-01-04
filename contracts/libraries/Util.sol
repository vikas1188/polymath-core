pragma solidity ^0.4.24;

/**
 * @title Utility contract for reusable code
 */
library Util {event __CoverageUtil(string fileName, uint256 lineNumber);
event __FunctionCoverageUtil(string fileName, uint256 fnId);
event __StatementCoverageUtil(string fileName, uint256 statementId);
event __BranchCoverageUtil(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageUtil(string fileName, uint256 branchId);
event __AssertPostCoverageUtil(string fileName, uint256 branchId);


   /**
    * @notice Changes a string to upper case
    * @param _base String to change
    */
    function upper(string _base) internal  returns (string) {emit __FunctionCoverageUtil('./contracts/libraries/Util.sol',1);

emit __CoverageUtil('./contracts/libraries/Util.sol',13);
        emit __StatementCoverageUtil('./contracts/libraries/Util.sol',1);
bytes memory _baseBytes = bytes(_base);
emit __CoverageUtil('./contracts/libraries/Util.sol',14);
        emit __StatementCoverageUtil('./contracts/libraries/Util.sol',2);
for (uint i = 0; i < _baseBytes.length; i++) {
emit __CoverageUtil('./contracts/libraries/Util.sol',15);
            emit __StatementCoverageUtil('./contracts/libraries/Util.sol',3);
bytes1 b1 = _baseBytes[i];
emit __CoverageUtil('./contracts/libraries/Util.sol',16);
            emit __StatementCoverageUtil('./contracts/libraries/Util.sol',4);
if (b1 >= 0x61 && b1 <= 0x7A) {emit __BranchCoverageUtil('./contracts/libraries/Util.sol',1,0);
emit __CoverageUtil('./contracts/libraries/Util.sol',17);
                emit __StatementCoverageUtil('./contracts/libraries/Util.sol',5);
b1 = bytes1(uint8(b1)-32);
            }else { emit __BranchCoverageUtil('./contracts/libraries/Util.sol',1,1);}

emit __CoverageUtil('./contracts/libraries/Util.sol',19);
            emit __StatementCoverageUtil('./contracts/libraries/Util.sol',6);
_baseBytes[i] = b1;
        }
emit __CoverageUtil('./contracts/libraries/Util.sol',21);
        emit __StatementCoverageUtil('./contracts/libraries/Util.sol',7);
return string(_baseBytes);
    }

    /**
     * @notice Changes the string into bytes32
     * @param _source String that need to convert into bytes32
     */
    /// Notice - Maximum Length for _source will be 32 chars otherwise returned bytes32 value will have lossy value.
    function stringToBytes32(string memory _source) internal  returns (bytes32) {emit __FunctionCoverageUtil('./contracts/libraries/Util.sol',2);

emit __CoverageUtil('./contracts/libraries/Util.sol',30);
        emit __StatementCoverageUtil('./contracts/libraries/Util.sol',8);
return bytesToBytes32(bytes(_source), 0);
    }

    /**
     * @notice Changes bytes into bytes32
     * @param _b Bytes that need to convert into bytes32
     * @param _offset Offset from which to begin conversion
     */
    /// Notice - Maximum length for _source will be 32 chars otherwise returned bytes32 value will have lossy value.
    function bytesToBytes32(bytes _b, uint _offset) internal  returns (bytes32) {emit __FunctionCoverageUtil('./contracts/libraries/Util.sol',3);

emit __CoverageUtil('./contracts/libraries/Util.sol',40);
        bytes32 result;

emit __CoverageUtil('./contracts/libraries/Util.sol',42);
        emit __StatementCoverageUtil('./contracts/libraries/Util.sol',9);
for (uint i = 0; i < _b.length; i++) {
emit __CoverageUtil('./contracts/libraries/Util.sol',43);
            emit __StatementCoverageUtil('./contracts/libraries/Util.sol',10);
result |= bytes32(_b[_offset + i] & 0xFF) >> (i * 8);
        }
emit __CoverageUtil('./contracts/libraries/Util.sol',45);
        emit __StatementCoverageUtil('./contracts/libraries/Util.sol',11);
return result;
    }

    /**
     * @notice Changes the bytes32 into string
     * @param _source that need to convert into string
     */
    function bytes32ToString(bytes32 _source) internal  returns (string result) {emit __FunctionCoverageUtil('./contracts/libraries/Util.sol',4);

emit __CoverageUtil('./contracts/libraries/Util.sol',53);
        emit __StatementCoverageUtil('./contracts/libraries/Util.sol',12);
bytes memory bytesString = new bytes(32);
emit __CoverageUtil('./contracts/libraries/Util.sol',54);
        emit __StatementCoverageUtil('./contracts/libraries/Util.sol',13);
uint charCount = 0;
emit __CoverageUtil('./contracts/libraries/Util.sol',55);
        emit __StatementCoverageUtil('./contracts/libraries/Util.sol',14);
for (uint j = 0; j < 32; j++) {
emit __CoverageUtil('./contracts/libraries/Util.sol',56);
            emit __StatementCoverageUtil('./contracts/libraries/Util.sol',15);
byte char = byte(bytes32(uint(_source) * 2 ** (8 * j)));
emit __CoverageUtil('./contracts/libraries/Util.sol',57);
            emit __StatementCoverageUtil('./contracts/libraries/Util.sol',16);
if (char != 0) {emit __BranchCoverageUtil('./contracts/libraries/Util.sol',2,0);
emit __CoverageUtil('./contracts/libraries/Util.sol',58);
                emit __StatementCoverageUtil('./contracts/libraries/Util.sol',17);
bytesString[charCount] = char;
emit __CoverageUtil('./contracts/libraries/Util.sol',59);
                charCount++;
            }else { emit __BranchCoverageUtil('./contracts/libraries/Util.sol',2,1);}

        }
emit __CoverageUtil('./contracts/libraries/Util.sol',62);
        emit __StatementCoverageUtil('./contracts/libraries/Util.sol',18);
bytes memory bytesStringTrimmed = new bytes(charCount);
emit __CoverageUtil('./contracts/libraries/Util.sol',63);
        emit __StatementCoverageUtil('./contracts/libraries/Util.sol',19);
for (j = 0; j < charCount; j++) {
emit __CoverageUtil('./contracts/libraries/Util.sol',64);
            emit __StatementCoverageUtil('./contracts/libraries/Util.sol',20);
bytesStringTrimmed[j] = bytesString[j];
        }
emit __CoverageUtil('./contracts/libraries/Util.sol',66);
        emit __StatementCoverageUtil('./contracts/libraries/Util.sol',21);
return string(bytesStringTrimmed);
    }

    /**
     * @notice Gets function signature from _data
     * @param _data Passed data
     * @return bytes4 sig
     */
    function getSig(bytes _data) internal  returns (bytes4 sig) {emit __FunctionCoverageUtil('./contracts/libraries/Util.sol',5);

emit __CoverageUtil('./contracts/libraries/Util.sol',75);
        emit __StatementCoverageUtil('./contracts/libraries/Util.sol',22);
uint len = _data.length < 4 ? _data.length : 4;
emit __CoverageUtil('./contracts/libraries/Util.sol',76);
        emit __StatementCoverageUtil('./contracts/libraries/Util.sol',23);
for (uint i = 0; i < len; i++) {
emit __CoverageUtil('./contracts/libraries/Util.sol',77);
            emit __StatementCoverageUtil('./contracts/libraries/Util.sol',24);
sig = bytes4(uint(sig) + uint(_data[i]) * (2 ** (8 * (len - 1 - i))));
        }
    }


}
