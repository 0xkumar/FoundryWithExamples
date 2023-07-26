// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.16;

import "forge-std/Test.sol";
import {Bit} from "../src/Bit.sol";

//Topics
// Fuzz
//assume and bound
//Stats

contract FuzzTest is Test {
    Bit b;

    function setUp() public {
        b = new Bit();
    }

    function mostSignificantBit(uint256 x) public pure returns (uint256){
        uint256 i = 0;
        while((x >>= 1) > 0) {
            i++;

        }
        return i;
    }


    function testMostSignificantBit() public {
        assertEq(b.mostSignificantBit(0), 0);
        assertEq(b.mostSignificantBit(1), 0);
        assertEq(b.mostSignificantBit(2), 1);
        assertEq(b.mostSignificantBit(4), 2);
        assertEq(b.mostSignificantBit(8), 3);
        assertEq(b.mostSignificantBit(16), 4);
        assertEq(b.mostSignificantBit(32), 5);
        assertEq(b.mostSignificantBit(64), 6);
        assertEq(b.mostSignificantBit(128), 7);
        assertEq(b.mostSignificantBit(256), 8);
        assertEq(b.mostSignificantBit(512), 9);
        assertEq(b.mostSignificantBit(1024), 10);
        assertEq(b.mostSignificantBit(2048), 11);
        assertEq(b.mostSignificantBit(4096), 12);
        assertEq(b.mostSignificantBit(8192), 13);
        assertEq(b.mostSignificantBit(16384), 14);
        assertEq(b.mostSignificantBit(32768), 15);
        assertEq(b.mostSignificantBit(65536), 16);
        assertEq(b.mostSignificantBit(131072), 17);
        assertEq(b.mostSignificantBit(262144), 18);
        assertEq(b.mostSignificantBit(524288), 19);
        assertEq(b.mostSignificantBit(1048576), 20);
        assertEq(b.mostSignificantBit(2097152), 21);
        assertEq(b.mostSignificantBit(4194304), 22);
        assertEq(b.mostSignificantBit(8388608), 23);
        assertEq(b.mostSignificantBit(16777216), 24);
        assertEq(b.mostSignificantBit(33554432), 25);
        assertEq(b.mostSignificantBit(67108864), 26);
        assertEq(b.mostSignificantBit(134217728), 27);
        assertEq(b.mostSignificantBit(268435456), 28);
        assertEq(b.mostSignificantBit(536870912), 29);
        assertEq(b.mostSignificantBit(1073741824), 30);
        assertEq(b.mostSignificantBit(2147483648), 31);
        assertEq(b.mostSignificantBit(4294967296), 32);
        assertEq(b.mostSignificantBit(8589934592), 33);
        assertEq(b.mostSignificantBit(17179869184), 34);
        assertEq(b.mostSignificantBit(34359738368), 35);
        assertEq(b.mostSignificantBit(68719476736), 36);
        assertEq(b.mostSignificantBit(137438953472), 37);
        assertEq(b.mostSignificantBit(274877906944), 38);
        assertEq(b.mostSignificantBit(549755813888), 39);
        assertEq(b.mostSignificantBit(1099511627776), 40);
        assertEq(b.mostSignificantBit(type(uint256).max), 255);

    }

    function testMostSignificantBitFuzz(uint256 x) public {
        uint i = b.mostSignificantBit(x);
        assertEq(i,mostSignificantBit(x));
    }

    //Assume and Bound

    function testMostsignificantBitFuzz(uint256 x) public {
        //assumme --> If false, the fuzzer will discard the current fuzz inputs and start a new fuzz run
        // skip x = 0

        // vm.assume(x > 0);
        // assertGt(x,0);

        //bound(imput, min, max) -- bound input between min and max
        x = bound(x, 1, 10);
        assertGe(x,1);
        assertLe(x,10);

        uint i = b.mostSignificantBit(x);
        assertEq(i,mostSignificantBit(x));
    } 




}
