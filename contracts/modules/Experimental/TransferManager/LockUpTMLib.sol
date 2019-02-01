import "../../../interfaces/IDataStore.sol";
import "../../../interfaces/ISecurityToken.sol";

pragma solidity ^0.5.0;

library LockupTMLib {
	bytes32 internal constant NAME = "LOCKUP_NAME";
	bytes32 internal constant USER = "LOCKUP_USER";
	bytes32 internal constant USER_INDEX = "LOCKUP_USER_INDEX";
	bytes32 internal constant LOCKUP_INDEX = "LOCKUP_INDEX";
	bytes32 internal constant LOCKUP_ARRAY_KEY = 0x62b5061683f61db2d47d220e4e954b149cbf4090d1579a8df59405eca6142006; //keccak256("LOCKUP_ARRAY_KEY")

	function setLockup(
		address _securityToken, 
		bytes32 _lockupName,
		uint256 _lockupAmount, 
		uint64 _startTime, 
		uint64 _lockUpPeriodSeconds, 
		uint64 _releaseFrequencySeconds
	) public {
		IDataStore dataStore = IDataStore(_getDataStore(_securityToken));
		bytes32 key = _getLockupNameKey(_lockupName);
		bytes memory lockUp = abi.encodePacked(_lockupAmount, _startTime, _lockUpPeriodSeconds, _releaseFrequencySeconds);
		dataStore.setBytes(key, lockUp);
	}

	function deleteFromLockupArray(address _securityToken, bytes32 _lockupName) public {
		IDataStore dataStore = IDataStore(_getDataStore(_securityToken));
		uint256 length = dataStore.getBytes32ArrayLength(LOCKUP_ARRAY_KEY);
		for (uint256 i = 0; i < length; i++) {
			if (dataStore.getBytes32ArrayElement(LOCKUP_ARRAY_KEY, i) == _lockupName) {
				dataStore.deleteBytes32(LOCKUP_ARRAY_KEY, i);
				break;
			}
		}
	}

	function pushInLockupArray(address _securityToken, bytes32 _lockupName) public {
		IDataStore dataStore = IDataStore(_getDataStore(_securityToken));
		dataStore.insertBytes32(LOCKUP_ARRAY_KEY, _lockupName);
	}

	function deleteFromUserToLockup(address _securityToken, address _userAddress, bytes32 _lockupName) public {
		IDataStore dataStore = IDataStore(_getDataStore(_securityToken));
		bytes32 indexKey = _getUserToLockupIndexKey(_userAddress, _lockupName);
		uint256 lockupIndex = dataStore.getUint256(indexKey);
		bytes32 userKey = _getLockupUserKey(_userAddress);
		dataStore.deleteBytes32(userKey, lockupIndex);
		dataStore.setUint256(indexKey, 0); //delete index
	}

	function pushInUserToLockup(address _securityToken, address _userAddress, bytes32 _lockupName) public {
		IDataStore dataStore = IDataStore(_getDataStore(_securityToken));
		bytes32 indexKey = _getUserToLockupIndexKey(_userAddress, _lockupName);
		bytes32 userKey = _getLockupUserKey(_userAddress);
		dataStore.setUint256(indexKey, dataStore.getBytes32ArrayLength(userKey));
		dataStore.insertBytes32(userKey, _lockupName);
	}

	function deleteFromLockupToUser(address _securityToken, bytes32 _lockupName, address _userAddress) public {
		IDataStore dataStore = IDataStore(_getDataStore(_securityToken));
		bytes32 indexKey = _getLockupToUserIndexKey(_lockupName, _userAddress);
		uint256 lockupIndex = dataStore.getUint256(indexKey);
		bytes32 nameKey = _getLockupNameKey(_lockupName);
		dataStore.deleteAddress(nameKey, lockupIndex);
		dataStore.setUint256(indexKey, 0); //delete index
	}

	function pushInLockupToUser(address _securityToken, bytes32 _lockupName, address _userAddress) public {
		IDataStore dataStore = IDataStore(_getDataStore(_securityToken));
		bytes32 indexKey = _getLockupToUserIndexKey(_lockupName, _userAddress);
		bytes32 nameKey = _getLockupNameKey(_lockupName);
		dataStore.setUint256(indexKey, dataStore.getAddressArrayLength(nameKey));
		dataStore.insertAddress(nameKey, _userAddress);
	}

	function setLockupToUsers(address _securityToken, bytes32 _lockupName) public returns (address[] memory lockupToUsers) {
		IDataStore dataStore = IDataStore(_getDataStore(_securityToken));
		bytes32 key = _getLockupNameKey(_lockupName);
		lockupToUsers = dataStore.getAddressArray(key);
	}

	function setUserToLockupIndex(address _securityToken, address _user, bytes32 _lockupName, uint256 _index) public {
		IDataStore dataStore = IDataStore(_getDataStore(_securityToken));
		bytes32 key = _getUserToLockupIndexKey(_user, _lockupName);
		dataStore.setUint256(key, _index);
	}

	function setLockupToUserIndex(address _securityToken, bytes32 _lockupName, address _user, uint256 _index) public {
		IDataStore dataStore = IDataStore(_getDataStore(_securityToken));
		bytes32 key = _getLockupToUserIndexKey(_lockupName, _user);
		dataStore.setUint256(key, _index);
	}

	function getLockup(address _securityToken, bytes32 _lockupName) 
		public 
		view 
		returns (uint256 lockupAmount, uint64 startTime, uint64 lockUpPeriodSeconds, uint64 releaseFrequencySeconds)
	{
		address dataStore = _getDataStore(_securityToken);
		bytes32 key = _getLockupNameKey(_lockupName);
		(lockupAmount, startTime, lockUpPeriodSeconds, releaseFrequencySeconds) = 
			abi.decode(_getLockupBytes(dataStore, key), (uint256, uint64, uint64, uint64));
	}


	function getUserToLockups(address _securityToken, address _user) public view returns (bytes32[] memory userToLockups) {
		IDataStore dataStore = IDataStore(_getDataStore(_securityToken));
		bytes32 key = _getLockupUserKey(_user);
		userToLockups = dataStore.getBytes32Array(key);
	}

	function getLockupToUsers(address _securityToken, bytes32 _lockupName) public view returns (address[] memory lockupToUsers) {
		IDataStore dataStore = IDataStore(_getDataStore(_securityToken));
		bytes32 key = _getLockupNameKey(_lockupName);
		lockupToUsers = dataStore.getAddressArray(key);
	}

	function getUserToLockupsLength(address _securityToken, address _user) public view returns (uint256 length) {
		IDataStore dataStore = IDataStore(_getDataStore(_securityToken));
		bytes32 key = _getLockupUserKey(_user);
		length = dataStore.getBytes32ArrayLength(key);
	}

	function getLockupToUsersLength(address _securityToken, bytes32 _lockupName) public view returns (uint256 length) {
		IDataStore dataStore = IDataStore(_getDataStore(_securityToken));
		bytes32 key = _getLockupNameKey(_lockupName);
		length = dataStore.getAddressArrayLength(key);
	}

	function getUserToLockupIndex(address _securityToken, address _user, bytes32 _lockupName) public view returns (uint256 index) {
		IDataStore dataStore = IDataStore(_getDataStore(_securityToken));
		bytes32 key = _getUserToLockupIndexKey(_user, _lockupName);
		index = dataStore.getUint256(key);
	}

	function getLockupToUserIndex(address _securityToken, bytes32 _lockupName, address _user) public view returns (uint256 index) {
		IDataStore dataStore = IDataStore(_getDataStore(_securityToken));
		bytes32 key = _getLockupToUserIndexKey(_lockupName, _user);
		index = dataStore.getUint256(key);
	}

	function getLockupArray(address _securityToken) public view returns (bytes32[] memory lockups) {
		IDataStore dataStore = IDataStore(_getDataStore(_securityToken));
		return dataStore.getBytes32Array(LOCKUP_ARRAY_KEY);
	}

	function _getDataStore(address _securityToken) internal view returns (address dataStore) {
		dataStore = ISecurityToken(_securityToken).dataStore();
	}

	function _getLockupNameKey(bytes32 _lockupName) internal view returns (bytes32 key) {
		key = keccak256(abi.encodePacked(NAME, _lockupName));
	}

	function _getLockupUserKey(address _user) internal view returns (bytes32 key) {
		key = keccak256(abi.encodePacked(USER, _user));
	}

	function _getUserToLockupIndexKey(address _user, bytes32 _lockupName) internal view returns (bytes32 key) {
		key = keccak256(abi.encodePacked(USER_INDEX, _user, _lockupName));
	}

	function _getLockupToUserIndexKey(bytes32 _lockupName, address _user) internal view returns (bytes32 key) {
		key = keccak256(abi.encodePacked(LOCKUP_INDEX, _lockupName, _user));
	}

	function _getLockupBytes(address _dataStore, bytes32 _key) internal view returns (bytes memory lockUp) {
		IDataStore dataStore = IDataStore(_dataStore);
		lockUp = dataStore.getBytes(_key);
	}
}