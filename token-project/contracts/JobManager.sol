// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./IncentiveToken.sol";

contract JobManager {
    IncentiveToken public token;
    address public admin;

    constructor(address tokenAddress) {
        token = IncentiveToken(tokenAddress);
        admin = msg.sender;
    }

    function completeJob(address worker, uint256 jobComplexity) public {
        require(msg.sender == admin, "Only admin can complete jobs");
        uint256 reward = calculateReward(jobComplexity);
        token.mint(worker, reward);
    }

    function calculateReward(uint256 complexity) private pure returns (uint256) {
        return complexity * 1 ether;  // 1 ITK per complexity point
    }
}
