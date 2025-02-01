
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
import "hardhat/console.sol";
library SafeMath {
    function add(uint x, uint y) internal pure returns (uint) {
        uint z = x + y;
        require(z >= x, "uint overflow");

        return z;
    }

    function con(string memory x, bytes memory y) internal pure returns (string memory) {
        string memory z=string.concat(x,string(y));
        return z;
    }
}

contract TestLib {
    using SafeMath for uint;
    
    using SafeMath for string;

    function testAdd(uint x, uint y) public pure returns (uint) {
        return x.add(y);
    }
    
    function testString(string memory x,bytes memory y) public pure returns(string memory) {
        console.log("t1");
        bytes memory b=abi.encodeWithSignature("count()");
        console.log("t2");
        string memory a=string(b);
        console.log("a",a);
        console.log("t3");
        return x.con(y);
    }

}