//SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;

contract Error {
    error NotAuthorized();

    function throwError() external pure {
        require(false, "not authorized");
    }

    function throwCustomError() external pure {
        revert NotAuthorized();
    }
}
