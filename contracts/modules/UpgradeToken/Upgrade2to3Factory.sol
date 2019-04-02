pragma solidity ^0.4.24;

import "./Upgrade2to3.sol";
import "../ModuleFactory.sol";

/**
 * @title Factory for deploying Upgrade2to3 module
 */
contract Upgrade2to3Factory is ModuleFactory {

    /**
     * @notice Constructor
     * @param _polyAddress Address of the polytoken
     */
    constructor (address _polyAddress, uint256 _setupCost, uint256 _usageCost, uint256 _subscriptionCost) public
    ModuleFactory(_polyAddress, _setupCost, _usageCost, _subscriptionCost)
    {
        version = "2.0.0";
        name = "Upgrade2to3";
        title = "Upgrade ST 2.0 to ST 3.0";
        description = "Module to help upgrade ST 2.0 to latest version (3.0)";
        compatibleSTVersionRange["lowerBound"] = VersionUtils.pack(uint8(2), uint8(0), uint8(0));
        compatibleSTVersionRange["upperBound"] = VersionUtils.pack(uint8(2), uint8(9), uint8(9));
    }

    /**
     * @notice Used to launch the Module with the help of factory
     * @return address Contract address of the Module
     */
    function deploy(bytes /* _data */) external returns(address) {
        if(setupCost > 0)
            require(polyToken.transferFrom(msg.sender, owner, setupCost), "Failed transferFrom due to insufficent Allowance provided");
        address upgrade2to3 = new Upgrade2to3(msg.sender, address(polyToken));
        /*solium-disable-next-line security/no-block-members*/
        emit GenerateModuleFromFactory(address(upgrade2to3), getName(), address(this), msg.sender, setupCost, now);
        return upgrade2to3;
    }

    /**
     * @notice Type of the Module factory
     */
    function getTypes() external view returns(uint8[]) {
        uint8[] memory res = new uint8[](7);
        res[0] = 1;
        return res;
    }

    /**
     * @notice Returns the instructions associated with the module
     */
    function getInstructions() external view returns(string) {
        /*solium-disable-next-line max-len*/
        return "";
    }

    /**
     * @notice Get the tags related to the module factory
     */
    function getTags() external view returns(bytes32[]) {
        bytes32[] memory availableTags = new bytes32[](0);
        return availableTags;
    }
}
