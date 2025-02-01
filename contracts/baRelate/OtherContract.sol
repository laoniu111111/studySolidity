// SPDX-License-Identifier: MIT
pragma solidity ^0.8.1;
contract OtherContract {
    uint256 private _x = 0; // 状态变量_x
    // 收到eth的事件，记录amount和gas
    event Log(uint amount, uint gas);
    
    // 返回合约ETH余额
    function getBalance() view public returns(uint) {
        return address(this).balance;
    }

    // 可以调整状态变量_x的函数，并且可以往合约转ETH (payable)
    function setX(uint256 x) external payable{
        _x = x;
        // 如果转入ETH，则释放Log事件
        if(msg.value > 0){
            emit Log(msg.value, gasleft());
        }
    }

    // 读取_x
    function getX() external view returns(uint x){
        x = _x;
    }
}

contract CallOtherContract{
    function callOther(address add,uint v) public{
        OtherContract(add).setX{value:1 ether}(v);
    }
    function callOther2(OtherContract addr,uint v) public payable {
        addr.setX{value:1 ether}(v);
    }
}