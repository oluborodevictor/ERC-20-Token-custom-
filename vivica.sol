// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract MyToken {

    string public name;
    string public symbol;
    uint8 public decimals;
    uint private _totalSupply;
    address public owner;

    constructor () {
        name = "Vivica";
        symbol = "VA";
        decimals = 18;
        owner = msg.sender;
        _mint(msg.sender, 1000 * 10 ** uint(decimals));
    }

    mapping(address account => uint256) private _balances;
    mapping(address => mapping(address => uint256)) private _allowances;

    function _mint (address account, uint256 amount) internal {
        _balances[account]+= amount;
        _totalSupply += amount;
        emit Transfer(address(0), account, amount);
    }

    function mint (address account, uint256 amount) public {
        require(msg.sender == owner, "Not allowed!");
        uint rawAmount = amount * 10 ** uint(decimals);
        _mint(account, rawAmount);
    }

    function getTokenName () public view returns (string memory) {
        return name;
    }

    function getSymbol () public view returns (string memory) {
        return symbol;
    }

    function getDecimals () public view returns (uint8) {
        return decimals;
    }

    function totalSupply() public view returns (uint256) {
        return _totalSupply;
    }

    function balanceOf(address account) public view returns (uint256) {
        return _balances[account];
    }

    event Transfer(address indexed from, address indexed to, uint256 amount);
    event Approval(address indexed owner, address indexed spender, uint256 amount);

    function transfer (address account, uint amount) public returns (bool success) {
        uint rawAmount = amount * 10 ** uint(decimals);
        require(balanceOf(msg.sender) >= rawAmount, "Not enough balance!");
        _balances[msg.sender] -= rawAmount;
        _balances[account] += rawAmount;
        emit Transfer(msg.sender, account, rawAmount);
        return true;   
    }

    function transferFrom (address sender, address recipient, uint amount) public returns (bool success){
        uint rawAmount = amount * 10 ** uint(decimals);
        require(_balances[sender] >= rawAmount, "Not enough balance!");
        require(_allowances[msg.sender][sender] >= rawAmount, "Not enough allowance!");
        _balances[sender] -= rawAmount;
        _balances[recipient] += rawAmount;
        _allowances[sender][msg.sender] -= rawAmount;
        emit Transfer(sender, recipient, rawAmount);
        return true;
    }

    function approve (address spender, uint amount) public returns (bool success) {
        uint rawAmount = amount * 10 ** uint(decimals);
        _allowances[msg.sender][spender] = rawAmount;
        emit Approval(msg.sender, spender, rawAmount);
        return true;
    }

    function allowance (address from, address spender) public view returns (uint256 remaining){
        return _allowances[from][spender];
    }
}