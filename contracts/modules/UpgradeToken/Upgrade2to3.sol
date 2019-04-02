pragma solidity ^0.4.24;

import "../Module.sol";
import "../../interfaces/ISecurityToken.sol";
import "../../SecurityTokenRegistry.sol";
import "../../RegistryUpdater.sol";
import "../../tokens/STFactory.sol";
/**
 * @title Module to help upgrade ST 2.0 to latest version (3.0)
 */
contract Upgrade2to3 is Module {

    address public newSecurityToken;

    /// @notice constructor
    constructor (address _securityToken, address _polyAddress) public
    Module(_securityToken, _polyAddress)
    {
    }

    function deployNewToken() public onlyOwner {
        SecurityTokenRegistry str = SecurityTokenRegistry(RegistryUpdater(securityToken).securityTokenRegistry());
        newSecurityToken = str.upgradeSecurityToken(
            ISecurityToken(securityToken).name(),
            ISecurityToken(securityToken).symbol(),
            ISecurityToken(securityToken).tokenDetails(),
            ISecurityToken(securityToken).granularity() > 1 ? true : false
        );
    }

    /**
     * @notice Init function i.e generalise function to maintain the structure of the module contract
     * @return bytes4
     */
    function getInitFunction() public pure returns (bytes4) {
        return bytes4(0);
    }

    /**
    * @notice Returns the Permission flag related the `this` contract
    * @return Array of permission flags
    */
    function getPermissions() public view returns(bytes32[]) {
        bytes32[] memory permsList = new bytes32[](0);
        return permsList;
    }

}
