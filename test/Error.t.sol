//SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;

import "forge-std/Test.sol";
import {Error} from "../src/Error.sol";

contract ErrorTest is Test {
    Error public err;

    function setUp() public {
        err = new Error();
    }

    function testFail() public view {
        err.throwError();
    }

    function testings() public {
        vm.expectRevert(bytes("not authorized"));
        err.throwError();
    }

    //function to test the custom errors

    function testCustomError() public {
        vm.expectRevert(Error.NotAuthorized.selector);
        err.throwCustomError();
    }
}
