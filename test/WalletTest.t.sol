//SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;

import "forge-std/Test.sol";
import "forge-std/console.sol";
import {Wallet} from "../src/Wallet.sol";

//Examples of deal and hoax
// deal(address,uint) --set the balance of address
// hoax(address,uint) --deal + prank. Sets up a prank and set balance

contract WalletTest is Test {

    
    Wallet public wallet;


    function setUp() public {
        wallet = new Wallet{value:1e18}();
    }

    function sendEth(uint256 amount) public {
        (bool ok,) = address(wallet).call{value: amount}("");
        require(ok, "send eth failed");
        
    }

    function testEthBalance() public {
        console.log("WalletTest balance is :", address(this).balance);
    }

    function testsendEth() public {
        uint bal = address(wallet).balance;
        vm.deal(address(1), 100 ether);
        assertEq(address(1).balance, 100 ether);

        vm.deal(address(1), 10 ether);
        assertEq(address(1).balance, 10 ether);

        // hoax(address,uint) --deal + prank. Sets up a prank and set balance
        deal(address(1),123);
        vm.prank(address(1));
        sendEth(123);

        hoax(address(1), 456);
        sendEth(456);
        assertEq(address(wallet).balance,bal + 123 + 456);
    }
}
