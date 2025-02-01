//  SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "hardhat/console.sol";

contract Counter {

  uint public counter;
  constructor() {
      counter = 0;
  }
  // "0x06661abd"
  function count() public {
      counter = counter + 1;
  }
}

contract testAbi {
	
  constructor()payable {

  }
  function newCall() public  {
		Counter c = new Counter();
		c.count();
	}
  function productByte(string memory str) public pure {
    console.log("t0");
    bytes memory b= abi.encodeWithSignature(str);
    for(uint i=0;i<b.length;i++){
      // console.log(b[i]);
    }
  }
  function call(address counter, bytes memory payload) public {
    (bool success, ) = counter.call(payload);
    require(success, "failed");
  }
  function encode() public pure returns(bytes memory result) {
    uint x = 10;
    address addr = 0x7A58c0Be72BE218B41C608b7Fe7C5bB630736C71;
    string memory name = "0xAA";
    uint[2] memory array = [uint(5), 6]; 
    result = abi.encode(x, addr, name, array);
  }
  function encodePack() public pure returns(bytes memory result) {
    uint x = 10;
    address addr = 0x7A58c0Be72BE218B41C608b7Fe7C5bB630736C71;
    string memory name = "0xAA";
    uint[2] memory array = [uint(5), 6]; 
    result = abi.encodePacked(x, addr, name, array);
  }
  function encodeWithSignature() public pure returns(bytes memory result) {
    uint x = 10;
    address addr = 0x7A58c0Be72BE218B41C608b7Fe7C5bB630736C71;
    string memory name = "0xAA";
    uint[2] memory array = [uint(5), 6]; 
    result = abi.encodeWithSignature("foo(uint256,address,string,uint256[2])", x, addr, name, array);
  }
  function encodeWithSelector() public pure returns(bytes memory result) {
    uint x = 10;
    address addr = 0x7A58c0Be72BE218B41C608b7Fe7C5bB630736C71;
    string memory name = "0xAA";
    uint[2] memory array = [uint(5), 6]; 
    result = abi.encodeWithSelector(bytes4(keccak256("foo(uint256,address,string,uint256[2])")), x, addr, name, array);
  }
  function decode(bytes memory data) public pure returns(uint dx, address daddr, string memory dname, uint[2] memory darray) {
    (dx, daddr, dname, darray) = abi.decode(data, (uint, address, string, uint[2]));
  }
}