//SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;

import "forge-std/Test.sol";
import "forge-std/console.sol";
import {WETH} from "../src/WETH.sol";

//Topics
//handler based testing test functions under specific conditions
//target condtions
//target selector



//This imports are required to write the handler contract

import {CommonBase} from "forge-std/Base.sol";
import {StdCheats} from "forge-std/StdCheats.sol";
import {StdUtils} from "forge-std/StdUtils.sol";


contract Handler is CommonBase, StdCheats, StdUtils{
    WETH private weth;
    uint public wethBalance;

    constructor(WETH _weth){
        weth = _weth;
    }

    receive() external payable{

    }

    function sendToFallback(uint amount) public{
        amount = bound(amount, 0,address(this).balance);
        wethBalance += amount;
        (bool ok, ) = address(weth).call{value: amount}("");
        require(ok , "send to fallback failed");
     }

    function deposit(uint amount) public {
        amount = bound(amount, 0,address(this).balance);
        wethBalance += amount;
        weth.deposit{value: amount}();
    }

    function withdraw(uint amount) public {
        amount = bound(amount, 0 ,weth.balanceOf(address(this)));
        wethBalance  -= amount;
        weth.withdraw(amount);
    }
    function fail () public {
        revert("fail");
    }


}

contract WETH_HANDLER_BASED_INVARIANT_TEST is Test{
    WETH public weth;
    Handler public handler;

    function setUp() public {
        weth = new WETH();
        handler = new Handler(weth);
        deal (address(handler), 100 ether);
        targetContract(address(handler));


        bytes4[] memory selectors = new bytes4[](3);
        selectors[0] = Handler.deposit.selector;
        selectors[1] = Handler.withdraw.selector;
        selectors[2] = Handler.sendToFallback.selector;
        targetSelector(
            FuzzSelector({addr: address(handler),selectors:selectors})
        );
    }
    
    function invariant_eth_balance() public {
        assertGe(address(weth).balance,handler.wethBalance());
    }
}
