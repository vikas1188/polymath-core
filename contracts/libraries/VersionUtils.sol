pragma solidity ^0.4.24;

/**
 * @title Helper library use to compare or validate the semantic versions
 */

library VersionUtils {event __CoverageVersionUtils(string fileName, uint256 lineNumber);
event __FunctionCoverageVersionUtils(string fileName, uint256 fnId);
event __StatementCoverageVersionUtils(string fileName, uint256 statementId);
event __BranchCoverageVersionUtils(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageVersionUtils(string fileName, uint256 branchId);
event __AssertPostCoverageVersionUtils(string fileName, uint256 branchId);


    /**
     * @notice This function is used to validate the version submitted
     * @param _current Array holds the present version of ST
     * @param _new Array holds the latest version of the ST
     * @return bool
     */
    function isValidVersion(uint8[] _current, uint8[] _new) internal  returns(bool) {emit __FunctionCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',1);

emit __CoverageVersionUtils('./contracts/libraries/VersionUtils.sol',16);
        emit __StatementCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',1);
bool[] memory _temp = new bool[](_current.length);
emit __CoverageVersionUtils('./contracts/libraries/VersionUtils.sol',17);
        emit __StatementCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',2);
uint8 counter = 0;
emit __CoverageVersionUtils('./contracts/libraries/VersionUtils.sol',18);
        emit __StatementCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',3);
for (uint8 i = 0; i < _current.length; i++) {
emit __CoverageVersionUtils('./contracts/libraries/VersionUtils.sol',19);
            emit __StatementCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',4);
if (_current[i] < _new[i])
                {emit __StatementCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',5);
emit __BranchCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',1,0);emit __CoverageVersionUtils('./contracts/libraries/VersionUtils.sol',20);
_temp[i] = true;}
            else
                {emit __StatementCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',6);
emit __BranchCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',1,1);emit __CoverageVersionUtils('./contracts/libraries/VersionUtils.sol',22);
_temp[i] = false;}
        }

emit __CoverageVersionUtils('./contracts/libraries/VersionUtils.sol',25);
        emit __StatementCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',7);
for (i = 0; i < _current.length; i++) {
emit __CoverageVersionUtils('./contracts/libraries/VersionUtils.sol',26);
            emit __StatementCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',8);
if (i == 0) {emit __BranchCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',2,0);
emit __CoverageVersionUtils('./contracts/libraries/VersionUtils.sol',27);
                emit __StatementCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',9);
if (_current[i] <= _new[i])
                    {emit __StatementCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',10);
emit __BranchCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',3,0);emit __CoverageVersionUtils('./contracts/libraries/VersionUtils.sol',28);
if(_temp[0]) {emit __BranchCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',4,0);
emit __CoverageVersionUtils('./contracts/libraries/VersionUtils.sol',29);
                        emit __StatementCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',11);
counter = counter + 3;
emit __CoverageVersionUtils('./contracts/libraries/VersionUtils.sol',30);
                        break;
                    } else
                        {emit __BranchCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',4,1);emit __CoverageVersionUtils('./contracts/libraries/VersionUtils.sol',32);
counter++;}}
                else
                    {emit __StatementCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',12);
emit __BranchCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',3,1);emit __CoverageVersionUtils('./contracts/libraries/VersionUtils.sol',34);
return false;}
            } else {emit __BranchCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',2,1);
emit __CoverageVersionUtils('./contracts/libraries/VersionUtils.sol',36);
                emit __StatementCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',13);
if (_temp[i-1])
                    {emit __BranchCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',5,0);emit __CoverageVersionUtils('./contracts/libraries/VersionUtils.sol',37);
counter++;}
                else {emit __StatementCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',14);
emit __BranchCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',5,1);if (_current[i] <= _new[i])
                    {emit __BranchCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',6,0);emit __CoverageVersionUtils('./contracts/libraries/VersionUtils.sol',39);
counter++;}
                else
                    {emit __StatementCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',15);
emit __BranchCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',6,1);emit __CoverageVersionUtils('./contracts/libraries/VersionUtils.sol',41);
return false;}}
            }
        }
emit __CoverageVersionUtils('./contracts/libraries/VersionUtils.sol',44);
        emit __StatementCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',16);
if (counter == _current.length)
            {emit __StatementCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',17);
emit __BranchCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',7,0);emit __CoverageVersionUtils('./contracts/libraries/VersionUtils.sol',45);
return true;}else { emit __BranchCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',7,1);}

    }

    /**
     * @notice Used to compare the lower bound with the latest version
     * @param _version1 Array holds the lower bound of the version
     * @param _version2 Array holds the latest version of the ST
     * @return bool
     */
    function compareLowerBound(uint8[] _version1, uint8[] _version2) internal  returns(bool) {emit __FunctionCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',2);

emit __CoverageVersionUtils('./contracts/libraries/VersionUtils.sol',55);
        emit __AssertPreCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',8);
emit __StatementCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',18);
require(_version1.length == _version2.length, "Input length mismatch");emit __AssertPostCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',8);

emit __CoverageVersionUtils('./contracts/libraries/VersionUtils.sol',56);
        emit __StatementCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',19);
uint counter = 0;
emit __CoverageVersionUtils('./contracts/libraries/VersionUtils.sol',57);
        emit __StatementCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',20);
for (uint8 j = 0; j < _version1.length; j++) {
emit __CoverageVersionUtils('./contracts/libraries/VersionUtils.sol',58);
            emit __StatementCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',21);
if (_version1[j] == 0)
                {emit __BranchCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',9,0);emit __CoverageVersionUtils('./contracts/libraries/VersionUtils.sol',59);
counter ++;}else { emit __BranchCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',9,1);}

        }
emit __CoverageVersionUtils('./contracts/libraries/VersionUtils.sol',61);
        emit __StatementCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',22);
if (counter != _version1.length) {emit __BranchCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',10,0);
emit __CoverageVersionUtils('./contracts/libraries/VersionUtils.sol',62);
            emit __StatementCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',23);
counter = 0;
emit __CoverageVersionUtils('./contracts/libraries/VersionUtils.sol',63);
            emit __StatementCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',24);
for (uint8 i = 0; i < _version1.length; i++) {
emit __CoverageVersionUtils('./contracts/libraries/VersionUtils.sol',64);
                emit __StatementCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',25);
if (_version2[i] > _version1[i])
                    {emit __StatementCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',26);
emit __BranchCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',11,0);emit __CoverageVersionUtils('./contracts/libraries/VersionUtils.sol',65);
return true;}
                else {emit __StatementCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',27);
emit __BranchCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',11,1);if (_version2[i] < _version1[i])
                    {emit __StatementCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',28);
emit __BranchCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',12,0);emit __CoverageVersionUtils('./contracts/libraries/VersionUtils.sol',67);
return false;}
                else
                    {emit __BranchCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',12,1);emit __CoverageVersionUtils('./contracts/libraries/VersionUtils.sol',69);
counter++;}}
            }
emit __CoverageVersionUtils('./contracts/libraries/VersionUtils.sol',71);
            emit __StatementCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',29);
if (counter == _version1.length - 1)
                {emit __StatementCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',30);
emit __BranchCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',13,0);emit __CoverageVersionUtils('./contracts/libraries/VersionUtils.sol',72);
return true;}
            else
                {emit __StatementCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',31);
emit __BranchCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',13,1);emit __CoverageVersionUtils('./contracts/libraries/VersionUtils.sol',74);
return false;}
        } else
            {emit __StatementCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',32);
emit __BranchCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',10,1);emit __CoverageVersionUtils('./contracts/libraries/VersionUtils.sol',76);
return true;}
    }

    /**
     * @notice Used to compare the upper bound with the latest version
     * @param _version1 Array holds the upper bound of the version
     * @param _version2 Array holds the latest version of the ST
     * @return bool
     */
    function compareUpperBound(uint8[] _version1, uint8[] _version2) internal  returns(bool) {emit __FunctionCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',3);

emit __CoverageVersionUtils('./contracts/libraries/VersionUtils.sol',86);
        emit __AssertPreCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',14);
emit __StatementCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',33);
require(_version1.length == _version2.length, "Input length mismatch");emit __AssertPostCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',14);

emit __CoverageVersionUtils('./contracts/libraries/VersionUtils.sol',87);
        emit __StatementCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',34);
uint counter = 0;
emit __CoverageVersionUtils('./contracts/libraries/VersionUtils.sol',88);
        emit __StatementCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',35);
for (uint8 j = 0; j < _version1.length; j++) {
emit __CoverageVersionUtils('./contracts/libraries/VersionUtils.sol',89);
            emit __StatementCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',36);
if (_version1[j] == 0)
                {emit __BranchCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',15,0);emit __CoverageVersionUtils('./contracts/libraries/VersionUtils.sol',90);
counter ++;}else { emit __BranchCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',15,1);}

        }
emit __CoverageVersionUtils('./contracts/libraries/VersionUtils.sol',92);
        emit __StatementCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',37);
if (counter != _version1.length) {emit __BranchCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',16,0);
emit __CoverageVersionUtils('./contracts/libraries/VersionUtils.sol',93);
            emit __StatementCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',38);
counter = 0;
emit __CoverageVersionUtils('./contracts/libraries/VersionUtils.sol',94);
            emit __StatementCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',39);
for (uint8 i = 0; i < _version1.length; i++) {
emit __CoverageVersionUtils('./contracts/libraries/VersionUtils.sol',95);
                emit __StatementCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',40);
if (_version1[i] > _version2[i])
                    {emit __StatementCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',41);
emit __BranchCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',17,0);emit __CoverageVersionUtils('./contracts/libraries/VersionUtils.sol',96);
return true;}
                else {emit __StatementCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',42);
emit __BranchCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',17,1);if (_version1[i] < _version2[i])
                    {emit __StatementCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',43);
emit __BranchCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',18,0);emit __CoverageVersionUtils('./contracts/libraries/VersionUtils.sol',98);
return false;}
                else
                    {emit __BranchCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',18,1);emit __CoverageVersionUtils('./contracts/libraries/VersionUtils.sol',100);
counter++;}}
            }
emit __CoverageVersionUtils('./contracts/libraries/VersionUtils.sol',102);
            emit __StatementCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',44);
if (counter == _version1.length - 1)
                {emit __StatementCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',45);
emit __BranchCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',19,0);emit __CoverageVersionUtils('./contracts/libraries/VersionUtils.sol',103);
return true;}
            else
                {emit __StatementCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',46);
emit __BranchCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',19,1);emit __CoverageVersionUtils('./contracts/libraries/VersionUtils.sol',105);
return false;}
        } else
            {emit __StatementCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',47);
emit __BranchCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',16,1);emit __CoverageVersionUtils('./contracts/libraries/VersionUtils.sol',107);
return true;}
    }


    /**
     * @notice Used to pack the uint8[] array data into uint24 value
     * @param _major Major version
     * @param _minor Minor version
     * @param _patch Patch version
     */
    function pack(uint8 _major, uint8 _minor, uint8 _patch) internal  returns(uint24) {emit __FunctionCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',4);

emit __CoverageVersionUtils('./contracts/libraries/VersionUtils.sol',118);
        emit __StatementCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',48);
return (uint24(_major) << 16) | (uint24(_minor) << 8) | uint24(_patch);
    }

    /**
     * @notice Used to convert packed data into uint8 array
     * @param _packedVersion Packed data
     */
    function unpack(uint24 _packedVersion) internal  returns (uint8[]) {emit __FunctionCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',5);

emit __CoverageVersionUtils('./contracts/libraries/VersionUtils.sol',126);
        emit __StatementCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',49);
uint8[] memory _unpackVersion = new uint8[](3);
emit __CoverageVersionUtils('./contracts/libraries/VersionUtils.sol',127);
        emit __StatementCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',50);
_unpackVersion[0] = uint8(_packedVersion >> 16);
emit __CoverageVersionUtils('./contracts/libraries/VersionUtils.sol',128);
        emit __StatementCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',51);
_unpackVersion[1] = uint8(_packedVersion >> 8);
emit __CoverageVersionUtils('./contracts/libraries/VersionUtils.sol',129);
        emit __StatementCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',52);
_unpackVersion[2] = uint8(_packedVersion);
emit __CoverageVersionUtils('./contracts/libraries/VersionUtils.sol',130);
        emit __StatementCoverageVersionUtils('./contracts/libraries/VersionUtils.sol',53);
return _unpackVersion;
    }


}
