library Lib {
	struct S { uint x; }
	// a direct call to this should revert
	function np(S storage s) public returns (address) { s.x = 3; return msg.sender; }
	// a direct call to this is fine
	function v(S storage) public view returns (address) { return msg.sender; }
	// a direct call to this is fine
	function pu() public pure returns (uint) { return 2; }
}
/// @ext:soltest
/// {library_call_protection}
///     // compileAndRun(sourceCode, 0, "Lib");
///     // ABI_CHECK(callContractFunction("np(Lib.S storage)", 0), encodeArgs());
///     // ABI_CHECK(callContractFunction("v(Lib.S storage)", 0), encodeArgs(u160(m_sender)));
///     // ABI_CHECK(callContractFunction("pu()"), encodeArgs(2));
///     // compileAndRun(sourceCode, 0, "Test", bytes(), map<string, Address>{{"Lib", m_contractAddress}});
///     // ABI_CHECK(callContractFunction("s()"), encodeArgs(0));
///     // ABI_CHECK(callContractFunction("np()"), encodeArgs(u160(m_sender)));
///     // ABI_CHECK(callContractFunction("s()"), encodeArgs(3));
///     // ABI_CHECK(callContractFunction("v()"), encodeArgs(u160(m_sender)));
///     // ABI_CHECK(callContractFunction("pu()"), encodeArgs(2));
contract Test {
	Lib.S public s;
	function np() public returns (address) { return Lib.np(s); }
	function v() public view returns (address) { return Lib.v(s); }
	function pu() public pure returns (uint) { return Lib.pu(); }
}

