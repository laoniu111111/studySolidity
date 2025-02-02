// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/math/SafeMath.sol";
library ExSafeMath {
    function add(uint x, uint y) external pure returns (uint) {
        uint z = x + y;
        require(z >= x, "uint overflow");
        return z;
    }
}

contract TestExLib {
    using ExSafeMath for uint;

    function testAdd(uint x, uint y) public pure returns (uint) {

        return x.add(y);
    }
    function testSub(uint x, uint y) public pure returns (uint) {
        return x.sub(y);
    }
}
