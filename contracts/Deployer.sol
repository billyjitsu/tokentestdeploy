// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "./MyToken.sol";

contract TokenDeployer {
    MyToken public token;

    function create(string memory _name, string memory _symbol) public returns(MyToken){
       token = new MyToken(_name, _symbol);
       return token;
    }
}
