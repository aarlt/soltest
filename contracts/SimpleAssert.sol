pragma solidity ^0.4.0;

contract SimpleAssert {
    uint16 d;
    address owner;
    function SimpleAssignment(uint16 a) public {
        owner = msg.sender;
        d = a;
    }

    /// @ext:soltest
    /// {assert-false}
    ///     assert(false);
    /// {assert-true}
    ///     assert(true);
    /// {assert-true-false}
    ///     assert(true);
    ///     assert(false);
    /// {assert-false-true}
    ///     assert(false);
    ///     assert(true);
    function add(uint16 a, uint16 b) public returns (uint16 sum)  {
        if (msg.sender == owner) {
            return a + b + d;
        } else {
            return a + b;
        }
    }
}
