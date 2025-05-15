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

    mapping(address account => uint256) public _balances;

    function _mint (address account, uint256 amount) internal {
        _balances[account]+= amount;
        _totalSupply += amount;
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

    function transfer () public {

    }

    function transferFrom () public {

    }

    function approve () public {

    }

    function allowance () public {

    }
}