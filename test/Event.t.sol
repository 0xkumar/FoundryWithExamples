//SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;

import "forge-std/Test.sol";
import {Event} from "../src/Event.sol";

contract EventTest is Test {
    Event public e;

    event Transfer(address indexed from, address indexed to, uint256 value);

    function setUp() public {
        e = new Event();
    }

    function testEmitTransferEvent() public {
        // function expectemit(
        //     bool checkTopic1,
        //     bool checkTopic2,
        //     bool checkTopic3,
        //     bool checkData,
        // ) external

        //1.Tell the foundry which data to check
        //2.Emit the expected event
        //3. call the function that should emit the event

        vm.expectEmit(true, true, false, true);
        emit Transfer(address(this), address(1), 1234);
        e.transfer(address(this), address(1), 1234);
    }

    //function to test the failing condition

    function testFailEmitTransferEvent() public {
        // function expectemit(
        //     bool checkTopic1,
        //     bool checkTopic2,
        //     bool checkTopic3,
        //     bool checkData,
        // ) external

        //1.Tell the foundry which data to check
        //2.Emit the expected event
        //3. call the function that should emit the event

        vm.expectEmit(true, true, false, true);
        emit Transfer(address(this), address(1), 1234);
        e.transfer(address(this), address(123), 1234);
    }

    //check only index 1
    function testIndexOneEmitTransferEvent() public {
        // function expectemit(
        //     bool checkTopic1,
        //     bool checkTopic2,
        //     bool checkTopic3,
        //     bool checkData,
        // ) external

        //1.Tell the foundry which data to check
        //2.Emit the expected event
        //3. call the function that should emit the event

        vm.expectEmit(true, false, false, false);
        emit Transfer(address(this), address(1), 1234);
        e.transfer(address(this), address(123), 1234);
    }

    function testEmitManyTransferEvent() public {
        //1.Tell the foundry which data to check
        //2.Emit the expected event
        //3. call the function that should emit the event

        address[] memory to = new address[](2);
        to[0] = address(123);
        to[1] = address(456);

        uint256[] memory amount = new uint256[](2);
        amount[0] = 777;
        amount[1] = 888;

        for (uint256 i; i < to.length; i++) {
            //1.Tell the foundry which data to check
            //2.Emit the expected event
            //3. call the function that should emit the event
            vm.expectEmit(true, true, false, true);
            emit Transfer(address(this), to[i], amount[i]);
            e.transferMany(address(this),to,amount);
        }
    }
}
