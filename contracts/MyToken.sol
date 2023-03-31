// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

error MaxAmount();
error AlreadyClaimed();
error NotReadyToClaim();

contract MyToken is ERC20, Ownable {
    uint256 public claimTime;
    uint256 public MAX_AMOUNT = 100 * 10 ** 18;
    mapping(address => bool) public claimed;

    constructor(
        string memory _name,
        string memory _symbol
    ) ERC20(_name, _symbol) {
        claimTime = block.timestamp + 1 minutes;
        _mint(msg.sender, 10 * 10 ** 18);
    }

    function claim() public {
        if (block.timestamp < claimTime) revert NotReadyToClaim();
        if (claimed[msg.sender]) revert AlreadyClaimed();
        if (totalSupply() >= MAX_AMOUNT) revert MaxAmount();
        _mint(msg.sender, 10 * 10 ** 18);
        claimed[msg.sender] = true;
    }
}
