pragma solidity ^0.4.24;

import "./SafeMath.sol";
import "./TokenRegistryStorage.sol";

contract TokenRegistryLogic {

    constructor(address _tokenRegistryStorageAddress) public {
        TR = _tokenRegistryStorageAddress;
    }

    enum TokenState {NULL,RESERVED,DEPLOYED}

    TokenRegistryStorage public TR;

    event TokenReserved(bytes32 indexed symbolHash, string tokenSymbol, string tokenName, address indexed tokenOwner, uint256 reservationTimestamp, bytes32 reservationData);
    event TokenDeployed(bytes32 indexed symbolHash, address indexed tokenOwner, bytes32 deploymentData);

    function getTokenData(string _tokenSymbol) public view returns(TokenState state, string name, address owner, uint256 timestamp, bytes32 rs, bytes32 ds) {
        bytes32 symbolHash = keccak256(abi.encodePacked(_tokenSymbol));
        return (
            TR.tokenState[symbolHash],
            TR.tokenName[symbolHash],
            TR.tokenOwner[symbolHash],
            TR.reservationTimestamp[symbolHash],
            TR.reservationData[symbolHash],
            TR.deploymentData[symbolHash]
        );
    }

    // Not reserved -> reserveToken
    // Reserved and owner changing data before expiry -> updateToken
    // Reserve and after expiry -> reserveToken
    function reserveToken(string _tokenSymbol, string _tokenName, address _tokenOwner, bytes32 _reservationData) public {
        bytes32 symbolHash = keccak256(abi.encodePacked(_tokenSymbol));
        TokenState mState = TR.tokenState[symbolHash];
        uint256 mTimestamp = TR.reservationTimestamp[symbolHash];

        require(mState != TokenState.DEPLOYED);
        require(now >= mTimestamp.add(TR.reservationTime));

        TR.tokenName[symbolHash] = _tokenName;
        TR.tokenOwner[symbolHash] = _tokenOwner;
        TR.reservationData[symbolHash] = _reservationData;
        TR.reservationTimestamp[symbolHash] = now;
        TR.tokenState[symbolHash] = TokenState.RESERVED;

        TR._TokenStateChangeEvent(_tokenSymbol, uint8(TokenState.RESERVED), _tokenName, _tokenOwner, now, _reservationData, "");
        emit TokenReserved(symbolHash, _tokenSymbol, _tokenName, _tokenOwner, now, _reservationData);
    }

    function updateToken(string _tokenSymbol, string _tokenName, address _tokenOwner, bytes32 _reservationData) public {
        bytes32 symbolHash = keccak256(abi.encodePacked(_tokenSymbol));
        TokenState mState = TR.tokenState[symbolHash];
        address mOwner = TR.tokenOwner[symbolHash];
        uint256 mTimestamp = TR.reservationTimestamp[symbolHash];

        require(msg.sender == mOwner, 'msg.sender is not owner');
        require(TokenState.RESERVED == mState, 'token is not in reserved state');
        require(now < mTimestamp.add(TR.reservationTime), 'token reservation has expired');

        TR.tokenName[symbolHash] = _tokenName;
        TR.tokenOwner[symbolHash] = _tokenOwner;
        TR.reservationData[symbolHash] = _reservationData;

        TR._TokenStateChangeEvent(_tokenSymbol, uint8(TokenState.RESERVED), _tokenName, _tokenOwner, mTimestamp, _reservationData, "");
        emit TokenReserved(symbolHash, _tokenSymbol, _tokenName, _tokenOwner, mTimestamp, _reservationData);
    }

    function deployToken(string _tokenSymbol, bytes32 _deploymentData) public {
        bytes32 symbolHash = keccak256(abi.encodePacked(_tokenSymbol));
        TokenState mState = TR.tokenState[symbolHash];
        string memory mName = TR.tokenName[symbolHash];
        address mOwner = TR.tokenOwner[symbolHash];
        uint256 mTimestamp = TR.reservationTimestamp[symbolHash];
        bytes32 mResData = TR.reservationData[symbolHash];

        require(msg.sender == mOwner, 'msg.sender is not owner');
        require(TokenState.RESERVED == mState, 'token is not in reserved state');

        TR.tokenState[symbolHash] = TokenState.DEPLOYED;
        TR.deploymentData[symbolHash] = _deploymentData;
        TR.tokenOwner[symbolHash] = this; // set owner to token contract

        TR._TokenStateChangeEvent(_tokenSymbol, uint8(TokenState.DEPLOYED), mName, this, mTimestamp, mResData, _deploymentData);
        emit TokenDeployed(symbolHash, this, _deploymentData);
    }
}
