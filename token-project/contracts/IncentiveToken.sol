// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract IncentiveToken is ERC20, Ownable {
    constructor() ERC20("IncentiveToken", "ITK") Ownable(msg.sender) {
        _mint(msg.sender, 10000 * 10 ** decimals()); // Initial mint to the contract owner for distribution
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
}
