// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract MyToken {

    string public name;
    string public symbol;
    uint8 public decimals;

    constructor () {
        name = "Vivica";
        symbol = "VA";
        decimals = 18;
    }

    function getTokename () public view returns (string memory) {
        return name;
    }

    function getSymbol () public view returns (string memory) {
        return symbol;
    }

    function getDecimals () public view returns (uint8) {
        return decimals;
    }

    function totalSupply() public {

    }

    function balanceOf() public {

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