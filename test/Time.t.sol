//SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;

import "forge-std/Test.sol";
import "../src/Time.sol";

contract Time is Test {
    //vm.wrap - set block.timstamp to future timestamp
    //vm.roll - set block number
    //skip - increament current timestamp
    //rewind - decrement current timestamp

    Auction auction;
    uint256 public startAt;

    function setUp() public {
        auction = new Auction();
        startAt = block.timestamp;

    }
    
    function testBidFailsBeforeStartTime() public {
        vm.expectRevert(bytes("Auction not started yet"));
        auction.bid();
        
    }

    function TestBid() public {
        vm.warp(startAt + 1 days);
        auction.bid();
    }

    function testBidEnd() public {
        vm.warp(startAt + 2 days);
        vm.expectRevert(bytes("Auction not started yet"));
        auction.bid();
        
    }

    function testTimeStamp() public {
        uint t = block.timestamp;
        //skip  -- increaments the time stamp 
        skip(100);
        assertEq(block.timestamp, t + 100);
        //rewind -- decreaments the time stamp

        rewind(10);
        assertEq(block.timestamp, t + 90);

    }

    function testBlockNumber() public {
        //vm.roll -- set block number
        uint   b = block.number;
        vm.roll(999);
        assertEq(block.number,999);
    }

     

}