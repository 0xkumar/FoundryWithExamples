//SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;

contract Wallet {
    address private owner;

    constructor() payable {
        owner = payable(msg.sender);
    }

    receive() external payable {}

    function withdraw(uint256 _amount) external {
        require(msg.sender == owner, " caller is not a owner");
        payable(msg.sender).transfer(_amount);
    }

    function setOwner(address _owner) external {
        require(msg.sender == owner, "caller is not the owner");
        owner = payable(_owner);
    }

    function check_owner() external view returns (address) {
        return owner;
    }

    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }
}
