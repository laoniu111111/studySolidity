pragma solidity  ^0.8.26;
import "hardhat/console.sol";
contract C {

    constructor() public payable {

    }
    receive() external payable { 
        // console.log("c receive!");
    }
    fallback() external payable {
        // console.log("c fallback !");
     }
    function f(uint a) private pure returns (uint b) { return a + 1; }
    function setData(uint a) internal { data = a; }
    uint public data;

}

contract CreateC {

    constructor() payable {

    }
    function createContract1() public payable  returns (address) {
        C  c = new C();
        console.log(address(c));
        return address(c);
    }

    function createContract2(address impl) public returns (address) {
        console.log(createClone(impl));
        return createClone(impl);
    }

    //create2方式创建合约，一个盐值只能创建一次，创建多次会报错
    function createContract3(uint _salt) public returns (address) {
        C c = new C{salt: keccak256(abi.encode(_salt))}();
        console.log(address(address(c)));
        return address(c);
    }
    //create2方式来创建合约
    function getAddress(uint _salt) public view returns (address) {
        bytes memory bytecode = type(C).creationCode;
        //  if constructor
        // bytecode = abi.encodePacked(bytecode, abi.encode(x));

        bytes32 hash = keccak256(
            abi.encodePacked(bytes1(0xff), address(this), keccak256(abi.encode(_salt)), keccak256(bytecode))
        );

        // NOTE: cast last 20 bytes of hash to address
        return address(uint160(uint(hash)));
    }
    //原始的创建方式，每创建一次都会生成一个新地址，相对于new消耗的gas更小，并且原始合约的验证后，创建的代理合约自动被验证
    function createClone(address prototype) internal returns (address proxy) {
        bytes20 targetBytes = bytes20(prototype);
        assembly {
            let clone := mload(0x40)
            mstore(clone, 0x3d602d80600a3d3981f3363d3d373d3d3d363d73000000000000000000000000)
            mstore(add(clone, 0x14), targetBytes)
            mstore(
                add(clone, 0x28),
                0x5af43d82803e903d91602b57fd5bf30000000000000000000000000000000000
            )
            proxy := create(0, clone, 0x37)
        }
        console.log(proxy);
        return proxy;
    }

    //只需要设置个盐值就能提前知道合约地址，摘取官网的代码
     function createDSalted(uint salt) public payable  returns(address){
        // This complicated expression just tells you how the address
        // can be pre-computed. It is just there for illustration.
        // You actually only need ``new C{salt: salt}(arg)``.
        address predictedAddress = address(uint160(uint(keccak256(abi.encodePacked(
            bytes1(0xff),
            address(this),
            keccak256(abi.encode(salt)),
            keccak256(abi.encodePacked(
                type(C).creationCode,
                abi.encode()
            ))
        )))));

        // C d = new C{salt: keccak256(abi.encode(salt))}();
        // require(address(d) == predictedAddress);
        console.log("address is",predictedAddress);
        return predictedAddress;
    }


    function transfer(address addr) public payable {
        payable(addr).transfer(1);
    }

    function getBalance(address addr) public view returns(uint){
        return addr.balance;
    }

    function getCreateCode() public {
        bytes memory bytecode = type(C).creationCode;
        console.log("bytecode", uint(keccak256(bytecode)));
        // return type(C).creationCode;
    }

}