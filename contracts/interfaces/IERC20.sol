pragma solidity ^0.4.24;

/**
 * @title ERC20 interface
 * @dev see https://github.com/ethereum/EIPs/issues/20
 */
interface IERC20 {event __CoverageIERC20(string fileName, uint256 lineNumber);
event __FunctionCoverageIERC20(string fileName, uint256 fnId);
event __StatementCoverageIERC20(string fileName, uint256 statementId);
event __BranchCoverageIERC20(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageIERC20(string fileName, uint256 branchId);
event __AssertPostCoverageIERC20(string fileName, uint256 branchId);

    function decimals() external  returns (uint8);
    function totalSupply() external  returns (uint256);
    function balanceOf(address _owner) external  returns (uint256);
    function allowance(address _owner, address _spender) external  returns (uint256);
    function transfer(address _to, uint256 _value) external returns (bool);
    function transferFrom(address _from, address _to, uint256 _value) external returns (bool);
    function approve(address _spender, uint256 _value) external returns (bool);
    function decreaseApproval(address _spender, uint _subtractedValue) external returns (bool);
    function increaseApproval(address _spender, uint _addedValue) external returns (bool);
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
}
