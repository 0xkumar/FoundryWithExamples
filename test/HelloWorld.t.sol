//SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import{HelloWorld} from "src/HelloWorld.sol";
import {Test} from "forge-std/Test.sol";

contract TestHelloWorld is Test {
    HelloWorld helloworld;

    function setUp() public {
        helloworld = new HelloWorld();
    }
    function testgreet() public {
        assertEq(helloworld.greet(),"Hello World!");
    }
}