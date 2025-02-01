// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;
import "hardhat/console.sol";
import {Bank} from "./Bank.sol";
contract TestReturn{
    
    mapping(uint=>address) public uintAddresMap;
    uint public i;

    function returnNamed() public pure returns(uint no,bool b,uint[2] memory arr){
        no=1;
        b=true;
        arr=[uint(1),2];
    }

    function testExplainContructor(address a) public payable {
        // (1,2,3)=returnName();
        uint256 _number;
        bool _bool=true;
        uint256[2] memory _array;
        // (_number, _bool, _array) = returnNamed();
        delete _number;
        console.log("bool",_number);
        (_number,,_array)= returnNamed();
        delete _number;
        console.log("bool",_number);
        Bank bank=new Bank(a);
    }

    
    function testPublic(mapping(uint=>address) storage map) private {

    }
}