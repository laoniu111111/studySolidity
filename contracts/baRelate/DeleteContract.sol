// SPDX-License-Identifier: MIT
pragma solidity ^0.8.1;
import "hardhat/console.sol";
contract DeleteContract {

    uint public value = 10;

    constructor() payable {}

    receive() external payable {}

    function deleteContract() external {
        // 调用selfdestruct销毁合约，并把剩余的ETH转给msg.sender
        selfdestruct(payable(msg.sender));
    }

    function getBalance() external view returns(uint balance){
        balance = address(this).balance;
    }
}
contract DeployContract {

    struct DemoResult {
        address addr;
        uint balance;
        uint value;
    }

    constructor() payable {}
    function getBalance(address addr) external  view returns(uint){
        return addr.balance;
    }
    function getBalance() external view returns(uint balance){
        balance = address(this).balance;
    }

    function demo(DeleteContract del) public payable returns (DemoResult memory){
        uint b=del.getBalance();
        console.log("delete contract before balance is",b);
        DemoResult memory res = DemoResult({
            addr: address(del),
            balance: del.getBalance(),
            value: del.value()
        });
        del.deleteContract();
        uint a=del.getBalance();
        console.log("delete contract after balance is",a);
        return res;
    }
    function getAddr() public payable returns(address){
        DeleteContract d=new DeleteContract{salt:keccak256(abi.encode((1)))}();

        return address(d);
    }
}