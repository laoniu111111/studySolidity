// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;
import "hardhat/console.sol";
contract BaseTest{
    uint public i=1;
    //assert也会回滚整个事务
    function testAssert()public payable {
        i++;
        console.log("i:",i);
        assert(i==1);
        i++;
        console.log("after i:",i);
    }

    function test
}

contract A{
    function externalFun() external  pure{
        console.log("externalFun !");
    }
    function publicFun() public pure{
        console.log("publicFun !");
    }
    
    function currentFun() private pure{
        publicFun();
        //外部合约当前合约也访问不了
        // externalFun();
    }
}  

contract B{
    function currentFun() public {
        A a=new A();
        a.publicFun();
        a.externalFun();
    }
}