// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.16;

import "forge-std/Test.sol";
import "forge-std/console.sol";
import {WETH} from "../src/WETH.sol";

// NOTE : open function --randomly call all pubilc functions

contract weth_open_invariant_test is Test {
    WETH public weth;

    function setUp() public {
        weth = new WETH();
    }

    function invariant_totalSupply() public {
        assertEq(weth.totalSupply() , 0);
    }

}