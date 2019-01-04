pragma solidity ^0.4.24;

import "../ModuleFactory.sol";
import "../../proxy/PartialHistoryProxy.sol";

/**
 * @title Factory for deploying CappedSTO module
 */
contract PartialHistoryFactory is ModuleFactory {

    address public logicContract;

    /**
     * @notice Constructor
     * @param _setupCost Setup cost of the module
     * @param _usageCost Usage cost of the module
     * @param _subscriptionCost Subscription cost of the module
     * @param _logicContract Contract address that contains the logic related to `description`
     */
    constructor (uint256 _setupCost, uint256 _usageCost, uint256 _subscriptionCost, address _logicContract) public
    ModuleFactory(_setupCost, _usageCost, _subscriptionCost)
    {
        require(_logicContract != address(0), "Invalid address");
        version = "1.0.0";
        name = "PartialHistory";
        title = "Partial History";
        description = "Allows checkpoints to be created to store partial history";
        compatibleSTVersionRange["lowerBound"] = VersionUtils.pack(uint8(0), uint8(0), uint8(0));
        compatibleSTVersionRange["upperBound"] = VersionUtils.pack(uint8(0), uint8(0), uint8(0));
        logicContract = _logicContract;
    }

     /**
     * @notice Used to launch the Module with the help of factory
     * @return address Contract address of the Module
     */
    function deploy(bytes _data) external returns(address) {
        address polyToken = _takeFee();
        //Check valid bytes - can only call module init function
        PartialHistoryProxy partialHistory = new PartialHistoryProxy(msg.sender, polyToken, logicContract);
        /*solium-disable-next-line security/no-block-members*/
        emit GenerateModuleFromFactory(address(partialHistory), getName(), address(this), msg.sender, setupCost, now);
        return address(partialHistory);
    }

    /**
     * @notice Type of the Module factory
     */
    function getTypes() external view returns(uint8[]) {
        uint8[] memory res = new uint8[](1);
        res[0] = 6;
        return res;
    }

    /**
     * @notice Returns the instructions associated with the module
     */
    function getInstructions() external view returns(string) {
        /*solium-disable-next-line max-len*/
        return "Set checkpoints to retain partial history";
    }

    /**
     * @notice Get the tags related to the module factory
     */
    function getTags() external view returns(bytes32[]) {
        bytes32[] memory availableTags = new bytes32[](2);
        availableTags[0] = "Partial";
        availableTags[1] = "History";
        return availableTags;
    }

}
