/// @ext:soltest
/// {calls_to_this}
///     // compileAndRun(sourceCode, 0, "Helper");
///     // u160 const c_helperAddress = m_contractAddress;
///     // compileAndRun(sourceCode, 0, "Main");
///     // BOOST_REQUIRE(callContractFunction("setHelper(address)", c_helperAddress) == bytes());
///     // BOOST_REQUIRE(callContractFunction("getHelper()", c_helperAddress) == encodeArgs(c_helperAddress));
///     // u256 a(3456789);
///     // u256 b("0x282837623374623234aa74");
///     // BOOST_REQUIRE(callContractFunction("callHelper(uint256,uint256)", a, b) == encodeArgs(a * b + 10));
contract Helper {
	function invoke(uint a, uint b) returns (uint c) {
		return this.multiply(a, b, 10);
	}
	function multiply(uint a, uint b, uint8 c) returns (uint ret) {
		return a * b + c;
	}
}
contract Main {
	Helper h;
	function callHelper(uint a, uint b) returns (uint ret) {
		return h.invoke(a, b);
	}
	function getHelper() returns (address addr) {
		return address(h);
	}
	function setHelper(address addr) {
		h = Helper(addr);
	}
}

