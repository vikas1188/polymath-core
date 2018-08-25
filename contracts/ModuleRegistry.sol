pragma solidity ^0.4.24;

import "./interfaces/IModuleRegistry.sol";
import "./interfaces/IModuleFactory.sol";
import "./interfaces/ISecurityTokenRegistry.sol";
import "./Pausable.sol";
import "./RegistryUpdater.sol";
import "./ReclaimTokens.sol";

/**
* @title Registry contract to store registered modules
* @notice Anyone can register modules, but only those "approved" by Polymath will be available for issuers to add
*/
contract ModuleRegistry is IModuleRegistry, Pausable, RegistryUpdater, ReclaimTokens {

    // Mapping used to hold the type of module factory corresponds to the address of the Module factory contract
    mapping (address => uint8) public registry;
    // Mapping used to hold the reputation of the factory
    mapping (address => address[]) public reputation;
    // Mapping contain the list of addresses of Module factory for a particular type
    mapping (uint8 => address[]) public moduleList;
    // Contains the list of verified modules
    mapping (address => bool) public verified;
    // Contains the list of the available tags corresponds to the module type
    mapping (uint8 => bytes32[]) public availableTags;

    // Indicates if custom modules can be added by token issuers.
    bool public customModulesAllowed;

    // Emit when Module been used by the securityToken
    event LogModuleUsed(address indexed _moduleFactory, address indexed _securityToken);
    // Emit when the Module Factory get registered with the ModuleRegistry contract
    event LogModuleRegistered(address indexed _moduleFactory, address indexed _owner);
    // Emit when the module get verified by the Polymath team
    event LogModuleVerified(address indexed _moduleFactory, bool _verified);

    constructor (address _polymathRegistry) public
        RegistryUpdater(_polymathRegistry)
    {
    }

    /**
     * @notice Called by a security token to check if the ModuleFactory is verified or appropriate custom module
     * @dev ModuleFactory reputation increases by one every time it is deployed
     * @param _moduleFactory is the address of the relevant module factory
     */
    function useModule(address _moduleFactory) external {
        require(ISecurityTokenRegistry(securityTokenRegistry).isSecurityToken(msg.sender), "msg.sender must be a registered SecurityToken");
        if (customModulesAllowed) {
            require(verified[_moduleFactory]||(Ownable(_moduleFactory).owner() == Ownable(msg.sender).owner()),
              "ModuleFactory must be verified or SecurityToken owner must be ModuleFactory owner");
        } else {
            require(verified[_moduleFactory], "ModuleFactory must be verified");
        }
        require(registry[_moduleFactory] != 0, "ModuleFactory type should not be 0");
        reputation[_moduleFactory].push(msg.sender);
        emit LogModuleUsed(_moduleFactory, msg.sender);
    }

    /**
     * @notice Called by moduleFactory owner to register new modules for SecurityToken to use
     * @param _moduleFactory is the address of the module factory to be registered
     * @return bool
     */
    function registerModule(address _moduleFactory) external whenNotPaused returns(bool) {
        require(registry[_moduleFactory] == 0, "Module factory should not be pre-registered");
        IModuleFactory moduleFactory = IModuleFactory(_moduleFactory);
        require(moduleFactory.getType() != 0, "Factory type should not equal to 0");
        registry[_moduleFactory] = moduleFactory.getType();
        moduleList[moduleFactory.getType()].push(_moduleFactory);
        reputation[_moduleFactory] = new address[](0);
        emit LogModuleRegistered (_moduleFactory, Ownable(_moduleFactory).owner());
        return true;
    }

    /**
    * @notice Called by Polymath to verify modules for SecurityToken to use.
    * @notice A module can not be used by an ST unless first approved/verified by Polymath
    * @notice (The only exception to this is that the author of the module is the owner of the ST)
    * @param _moduleFactory is the address of the module factory to be registered
    * @return bool
    */
    function verifyModule(address _moduleFactory, bool _verified) external onlyOwner returns(bool) {
        //Must already have been registered
        require(registry[_moduleFactory] != 0, "Module factory should have been already registered");
        verified[_moduleFactory] = _verified;
        emit LogModuleVerified(_moduleFactory, _verified);
        return true;
    }

    /**
     * @notice Called by Polymath to modify ability to add custom modules
     * @param _status true if custom modules are to be allowed, false otherwise.
     */
    function allowCustomModules(bool _status) onlyOwner {
        customModulesAllowed = _status;
    }

    /**
     * @notice Use to get all the tags releated to the functionality of the Module Factory.
     * @param _moduleType Type of module
     * @return bytes32 array
     */
    function getTagByModuleType(uint8 _moduleType) external view returns(bytes32[]) {
        return availableTags[_moduleType];
    }

    /**
     * @notice Add the tag for specified Module Factory
     * @param _moduleType Type of module.
     * @param _tag List of tags
     */
    function addTagByModuleType(uint8 _moduleType, bytes32[] _tag) external onlyOwner {
       for (uint8 i = 0; i < _tag.length; i++) {
           availableTags[_moduleType].push(_tag[i]);
       }
    }

    /**
     * @notice remove the tag for specified Module Factory
     * @param _moduleType Type of module.
     * @param _removedTags List of tags
     */
    function removeTagByModuleType(uint8 _moduleType, bytes32[] _removedTags) external onlyOwner {
        for (uint8 i = 0; i < availableTags[_moduleType].length; i++) {
            for (uint8 j = 0; j < _removedTags.length; j++) {
                if (availableTags[_moduleType][i] == _removedTags[j]) {
                    delete availableTags[_moduleType][i];
                }
            }
        }
    }

    /**
     * @notice pause registration function
     */
    function unpause() public onlyOwner  {
        _unpause();
    }

    /**
     * @notice unpause registration function
     */
    function pause() public onlyOwner {
        _pause();
    }


}
