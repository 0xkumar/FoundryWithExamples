//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "lib/solmate/src/tokens/ERC20.sol";

contract Token is ERC20 {
    constructor() ERC20("name", "symbol", 18) {}
}
