// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "hardhat/console.sol";
import "contracts/AirDrop.sol";
contract Test {
    
    constructor() public payable {
    }
    address payable[] public payableAddresses;
     uint256[] public arr;
    function testTransfer(address payable x) public payable {
        payable(x).transfer(1);
    }
    function testAirDropTransferEth() public{
        AirDrop ad=new AirDrop();
        
        payableAddresses.push(payable(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4));
        payableAddresses.push(payable(0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2));
        payableAddresses.push(payable(0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db));
        arr.push(uint(1));
        arr.push(uint(0));
        arr.push(uint(1));
        ad.multiTransferETH{value}(payableAddresses,arr);

    }
}

contract Bank {
    uint state=1;
    constructor() public payable {
        
    }
    receive() external payable {
        // state++; 
        console.log("receive !");
         emit Received(msg.sender, msg.value);
    }
    event Received(address indexed sender, uint256 amount);
    
}


contract C {

    event Received(address indexed sender, uint256 amount);

    receive() external payable {
        
        //console.log("receive !");
        emit Received(msg.sender, msg.value);
    }

}