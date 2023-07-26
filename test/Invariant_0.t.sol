// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.16;


//Topics 

//  Invariants
// Difference between fuzz and invariant
//Failing invariant tests
// Passing invariant tests
// Stats -runs,calls,reverts

contract IntroInvariant{
    bool public flag;

    function func_1() external{

    }

        function func_2() external{

    }

        function func_3() external{

    }

        function func_4() external{

    }

        function func_5() external{

    }

        function func_6() external{
            flag = true;

    }




}

import "forge-std/Test.sol";
contract Intro is Test{
    IntroInvariant private target;

    function setUp() public {
        target = new IntroInvariant();
    }
    
    function invariantfalgisalwaysfalse() public {
        assertEq(target.flag(),false);
    }
}
