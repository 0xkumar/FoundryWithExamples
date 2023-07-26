//SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;

contract Auction {
    uint256 public startAt = block.timestamp + 1 days;
    uint256 public endAt = startAt + 1 days;

    function bid() external {
        require(block.timestamp >= startAt && block.timestamp < endAt, "Auction not started yet");
    }

    function end() external {
        require(block.timestamp >= endAt, "Auction not ended yet");
    }
}
