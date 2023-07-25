//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "forge-std/Test.sol";
import "forge-std/console.sol";
import {Wallet} from "../src/Wallet.sol";

contract AuthTest is Test {
    Wallet wallet;

    uint256 amount = 1 ether;

    address public TESTER = makeAddr("TESTER");
    uint256 public constant strarting_tester_balance = 100 ether;

    function setUp() public {
        wallet = new Wallet();
        vm.deal(address(this), strarting_tester_balance);
        vm.deal(TESTER, strarting_tester_balance);
    }

    function testcheckOwner() public {
        assertEq(address(this), wallet.check_owner());
    }

    function testFailDraw() public {
        vm.prank(address(this));

        wallet.withdraw(amount);
    }

    function testfundWallet() public {
        vm.prank(TESTER);
        payable(wallet).transfer(amount);
        vm.prank(address(this));
        wallet.withdraw(amount);
    }

    //fallback() external payable {}

    function testWithdraw() public {
        vm.prank(TESTER);
        vm.expectRevert();

        wallet.withdraw(amount);
    }

    function testWithdrw() external {
        //console.log(address(this).balance);
        vm.prank(TESTER);
        payable(wallet).transfer(amount);

        uint256 walletBalance = wallet.getBalance();
        uint256 thisBalance = address(this).balance;

        console.log(wallet.getBalance());
        console.log(address(this).balance);
        vm.prank(address(this));
        wallet.withdraw(amount);

        assertEq(address(this).balance, walletBalance + thisBalance);
    }

    function testsetowner() public {
        console.log(wallet.check_owner());
        vm.prank(address(this));
        wallet.setOwner(address(1));
        //console.log(wallet.check_owner());
        address new_owner = wallet.check_owner();
        assertEq(new_owner, address(1));
        console.log(wallet.check_owner());
    }
}
