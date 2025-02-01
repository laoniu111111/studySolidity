// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "hardhat/console.sol";
contract testAddr {
   

   constructor() payable {

   }

   // 如果合约的余额大于等于10，则给x转10 wei
	function testTrasfer(address payable x) public payable {
	   payable(x).transfer(msg.value);
	}

   function balance(address addr) public view returns (uint) {
      return addr.balance;
   }

   function testSend(address payable x) public payable {
	   address myAddress = address(this);

        // if (myAddress.balance >= 10 ) {
            require(x.send(1),"send error");
        // }
	}

}

contract B{

    constructor() payable {

    }
    
}



