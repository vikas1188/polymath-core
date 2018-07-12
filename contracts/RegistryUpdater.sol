pragma solidity ^0.4.24;

import "openzeppelin-solidity/contracts/ownership/Ownable.sol";
import "./PolymathRegistry.sol";

contract RegistryUpdater is Ownable {

    address public polymathRegistry;
    address public moduleRegistry;
    address public securityTokenRegistry;
    address public tickerRegistry;
    address public polyToken;

    function updateFromRegistry() onlyOwner public {
        require(polymathRegistry != address(0));
        moduleRegistry = PolymathRegistry(polymathRegistry).getAddress("ModuleRegistry");
        securityTokenRegistry = PolymathRegistry(polymathRegistry).getAddress("ModuleRegistry");
        tickerRegistry = PolymathRegistry(polymathRegistry).getAddress("TickerRegistry");
        polyToken = PolymathRegistry(polymathRegistry).getAddress("PolyToken");
    }

}
