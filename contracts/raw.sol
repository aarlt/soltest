pragma solidity ^0.4.0;

contract Raw {
    uint16 d;
    address owner;
    function Raw(uint16 a) public {
        owner = msg.sender;
        d = a;
    }
    function add(uint16 a, uint16 b) public returns (uint16 sum)  {
        if (msg.sender == owner) {
            return a + b + d;
        } else {
            return a + b;
        }
    }
}
