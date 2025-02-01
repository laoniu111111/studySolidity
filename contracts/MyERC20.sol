// SPDX-License-Identifier: MIT
pragma solidity ^0.8.1;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract MyERC20 is ERC20{
     constructor() ERC20("NIUKB","NKB") {
        _mint(msg.sender, 1000);
    }
}