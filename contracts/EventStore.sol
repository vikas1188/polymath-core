pragma solidity ^0.4.24;

import "./Ownable.sol";

contract EventStore is Ownable {

    bytes[] public EventLog;

    function appendEvent(bytes _data) external {
        require(permissions[msg.sender] == true, 'msg.sender does not have permission to append event');
        EventLog.push(_data);
    }

    function getLength() public view returns(uint256) {
        return EventLog.length;
    }

    function getEvent(uint256 i) public view returns(bytes) {
        return EventLog[i];
    }

    /* Maintenance */

    mapping(address => bool) public permissions;

    function modifyPermission(address resolver, bool status) public onlyOwner() {
        permissions[resolver] = status;
    }

}
