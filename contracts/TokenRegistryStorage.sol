pragma solidity ^0.4.24;

import "./Ownable.sol";
import "./EventStore.sol";

contract TokenRegistryStorage is Ownable {

    address public eventStoreAddress;

    enum TokenState {NULL,RESERVED,DEPLOYED}
    uint256 public reservationTime = 15 * 1 days;

    mapping(bytes32 => TokenState) public tokenState;
    mapping(bytes32 => string) public tokenName;
    mapping(bytes32 => address) public tokenOwner; // external account when registered, becomes token contract on deployment
    mapping(bytes32 => uint256) public reservationTimestamp;
    mapping(bytes32 => bytes32) public reservationData; // Set on reservation
    mapping(bytes32 => bytes32) public deploymentData;  // Set on deployment

    constructor(address _eventStoreAddress) public {
        eventStoreAddress = _eventStoreAddress;
        _restoreStorage();
    }

    /***** Using abi.decode *****/

    function _restoreStorage() internal {
        for (uint i = 0; i < EventStore(eventStoreAddress).getLength(); i++) {
            (bytes1 eventType, bytes1 version, bytes memory data) = abi.decode(EventStore(eventStoreAddress).getEvent(i), (bytes1, bytes1, bytes));
            if (eventType == bytes1(1) && version == bytes1(1)) {
                (
                    string memory _tokenSymbol,
                    uint8 _tokenState,
                    string memory _tokenName,
                    address _tokenOwner,
                    uint256 _reservationTimestamp,
                    bytes32 _reservationData,
                    bytes32 _deploymentData
                ) = abi.decode(data, (string, uint8, string, address, uint256, bytes32, bytes32));
                bytes32 symbolHash = keccak256(abi.encodePacked(_tokenSymbol));
                tokenState[symbolHash] = TokenState(_tokenState);
                tokenName[symbolHash] = _tokenName;
                tokenOwner[symbolHash] = _tokenOwner;
                reservationTimestamp[symbolHash] = _reservationTimestamp;
                reservationData[symbolHash] = _reservationData;
                deploymentData[symbolHash] = _deploymentData;
            }
        }
    }

    function _TokenStateChangeEvent(
        string _tokenSymbol,
        uint8 _tokenState,
        string _tokenName,
        address _tokenOwner,
        uint256 _reservationTimestamp,
        bytes32 _reservationData,
        bytes32 _deploymentData
    ) external {
        require(permissions[msg.sender] == true, 'msg.sender does not have permission to append event');
        bytes memory data = abi.encodePacked(_tokenSymbol,_tokenState,_tokenName,_tokenOwner,_reservationTimestamp,_reservationData,_deploymentData);
        bytes1 eventType = bytes1(1);
        bytes1 version = bytes1(1);
        bytes memory prefixedData = abi.encodePacked(eventType,version,data);
        EventStore(eventStoreAddress).appendEvent(prefixedData);
    }

    /* Maintenance */

    mapping(address => bool) public permissions;

    function modifyPermission(address logic, bool status) public onlyOwner() {
        permissions[logic] = status;
    }

}
