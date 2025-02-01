pragma solidity ^0.8.0;
import "hardhat/console.sol";
contract Counter {
    uint public counter;
    address public sender;
    constructor() payable  {

    }
    event receiveEth(address indexed  from,address indexed to,uint amount,string msg);
    function count() public  {
        counter += 1;
        sender = msg.sender;
    }
    fallback() external payable {
        emit receiveEth(msg.sender, address(this), msg.value,"fallback");
    }
    receive() external payable {
        emit receiveEth(msg.sender, address(this), msg.value,"receive");
     }

     function balanceAmount() public view returns(uint){
        return address(this).balance;
     }

}
contract CallTest {
    uint public counter;
    address public sender;

    function callCount(Counter c) public {
        c.count();
    }

    // 只是调用代码，合约环境还是当前合约。
    function lowDelegatecallCount(address addr) public {
        bytes memory methodData = abi.encodeWithSignature("count()");
        addr.delegatecall(methodData);
    }

    function lowCallCount(address addr) public {
        bytes memory methodData =abi.encodeWithSignature("count()");
        addr.call(methodData);
        // addr.call{gas:1000}(methodData);
        // addr.call{gas:1000, value: 1 ether}(methodData);
        addr.call{value: 1 ether}(methodData);
    }

    function testCallTransfer(address addr) public payable {
        
        bytes memory methodData = abi.encodeWithSignature("count1()");
        (bool b,)=addr.call{value:1 ether}(methodData);
        console.log("call ",b);
    }    

}