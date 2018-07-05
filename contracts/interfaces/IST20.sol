pragma solidity ^0.4.24;

import "openzeppelin-solidity/contracts/token/ERC20/StandardToken.sol";
import "openzeppelin-solidity/contracts/token/ERC20/DetailedERC20.sol";

/**
 * @title Interface for the ST20 token standard
 */
contract IST20 is StandardToken, DetailedERC20 {

    // off-chain hash
    string public tokenDetails;
    // true if force transfers are not enabled on this security token (and can never be re-enabled)
    bool public forceTransferDisabled;

    /**
     * @notice Verifies whether a transaction is valid
     * @notice transfer, transferFrom functions must respect use respect the result of verifyTransfer
     * @param _from address The address which you want to send tokens from
     * @param _to address The address which you want to transfer to
     * @param _value uint256 the amount of tokens to be transferred
     */
    function verifyTransfer(address _from, address _to, uint256 _value) public returns (bool success);

    /**
     * @notice Mints new tokens and assigns them to the target _investor.
     * @notice Can only be called by the STO attached to the token (Or by the ST owner if there's no STO attached yet)
     * @param _investor address of investor
     * @param _value amount of tokens to mint
     */
    function mint(address _investor, uint256 _value) public returns (bool success);

    /**
     * @notice Burn function used to burn the securityToken
     * @param _value Number of token that get burned
     */
    function burn(uint256 _value) public;

    /**
     * @notice Force transfers tokens between addresses
     * @notice if forceTransferDisabled is true, this should fail
     * @param _from address The address which you want to send tokens from
     * @param _to address The address which you want to transfer to
     * @param _value uint256 the amount of tokens to be transferred
     */
    function forceTransfer(address _from, address _to, uint256 _value) public returns (bool success);

    event Minted(address indexed _to, uint256 _value);
    event Burnt(address indexed _burner, uint256 _value);
    event ForceTransfer(address indexed _from, address indexed _to, uint256 _value, address indexed _forcer);

}
