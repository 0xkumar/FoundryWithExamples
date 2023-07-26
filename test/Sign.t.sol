//SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;

import "forge-std/Test.sol";
import "forge-std/console.sol";

contract SignTest is Test {
    //private key = 123
    //public key = vm.addr(private key)
    //message = "secret message"
    //message hash = keccak256(message)
    //vm.sign(private key , message hash)

    function testSignature() public {
        uint256 privatekey = 1234;
        address publickey = vm.addr(privatekey);
        console.log(publickey);

        bytes32 messagehash = keccak256("secret message");

        (uint8 v, bytes32 r, bytes32 s) = vm.sign(privatekey, messagehash);

        address signer = ecrecover(messagehash, v, r, s);
        console.log(signer);

        assertEq(signer, publickey);

        bytes32 invalidMessageHash = keccak256("invalidmessage");

        signer = ecrecover(invalidMessageHash, v, r, s);

        assertTrue(signer != publickey);
    }
}
