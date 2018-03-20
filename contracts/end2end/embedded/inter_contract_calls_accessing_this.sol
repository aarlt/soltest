/// @ext:soltest
/// {inter_contract_calls_accessing_this}
///     // compileAndRun(sourceCode, 0, "Helper");
///     // u160 const c_helperAddress = m_contractAddress;
///     // compileAndRun(sourceCode, 0, "Main");
///     // BOOST_REQUIRE(callContractFunction("setHelper(address)", c_helperAddress) == bytes());
///     // BOOST_REQUIRE(callContractFunction("getHelper()", c_helperAddress) == encodeArgs(c_helperAddress));
///     // BOOST_REQUIRE(callContractFunction("callHelper()") == encodeArgs(c_helperAddress));
contract Helper {
	function getAddress() returns (address addr) {
		return address(this);
	}
}
contract Main {
	Helper h;
	function callHelper() returns (address addr) {
		return h.getAddress();
	}
	function getHelper() returns (address addr) {
		return address(h);
	}
	function setHelper(address addr) {
		h = Helper(addr);
	}
}

