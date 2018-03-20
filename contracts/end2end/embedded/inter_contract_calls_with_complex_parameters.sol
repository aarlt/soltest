/// @ext:soltest
/// {inter_contract_calls_with_complex_parameters}
///     // compileAndRun(sourceCode, 0, "Helper");
///     // u160 const c_helperAddress = m_contractAddress;
///     // compileAndRun(sourceCode, 0, "Main");
///     // BOOST_REQUIRE(callContractFunction("setHelper(address)", c_helperAddress) == bytes());
///     // BOOST_REQUIRE(callContractFunction("getHelper()", c_helperAddress) == encodeArgs(c_helperAddress));
///     // u256 a(3456789);
///     // u256 b("0x282837623374623234aa74");
///     // BOOST_REQUIRE(callContractFunction("callHelper(uint256,bool,uint256)", a, true, b) == encodeArgs(a * 3));
///     // BOOST_REQUIRE(callContractFunction("callHelper(uint256,bool,uint256)", a, false, b) == encodeArgs(b * 3));
contract Helper {
	function sel(uint a, bool select, uint b) returns (uint c) {
		if (select) return a; else return b;
	}
}
contract Main {
	Helper h;
	function callHelper(uint a, bool select, uint b) returns (uint c) {
		return h.sel(a, select, b) * 3;
	}
	function getHelper() returns (address haddress) {
		return address(h);
	}
	function setHelper(address haddress) {
		h = Helper(haddress);
	}
}

