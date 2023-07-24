// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Counter.sol";

contract CounterTest is Test {
    Counter public counter;

    function setUp() public {
        counter = new Counter();
    }

    function testincreament() public {
        counter.increment();
        assertEq(counter.number(),1);
    }

    function testFail() public {
        counter.decrement();

    }


    function testDecunderflow() public {
        vm.expectRevert(stdError.arithmeticError);
        counter.decrement();

    }

    function testvariable() public {
        assertEq(counter.number(),0);
    }

    function testDecrement() public {
        counter.increment();
        counter.increment();
        counter.increment();
        counter.decrement();
        assertEq(counter.number(),2);

    }




}
