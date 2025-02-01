// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "hardhat/console.sol";
import "contracts/airDrop/AirDrop.sol";
contract Test {
    
    constructor() public payable {
    }
    address payable[] public payableAddresses;
     uint256[] public arr;
    function testTransfer(address payable x) public payable {
        payable(x).transfer(1);
    }
    function testAirDropTransferEth() public{
        uint total;
        AirDrop ad=new AirDrop();
        
        payableAddresses.push(payable(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4));
        payableAddresses.push(payable(0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2));
        payableAddresses.push(payable(0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db));
        arr.push(uint(1));
        arr.push(uint(0));
        arr.push(uint(1));
        for(uint i;i<arr.length;i++){
            total+=arr[i];
        }
        ad.multiTransferETH{value: total}(payableAddresses,arr);
    }
}
