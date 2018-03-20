/// @ext:soltest
/// {value_for_constructor}
///     // compileAndRun(sourceCode, 22, "Main");
///     // BOOST_REQUIRE(callContractFunction("getFlag()") == encodeArgs(true));
///     // BOOST_REQUIRE(callContractFunction("getName()") == encodeArgs("abc"));
///     // BOOST_REQUIRE(callContractFunction("getBalances()") == encodeArgs(12, 10));
contract Helper {
	bytes3 name;
	bool flag;
	function Helper(bytes3 x, bool f) payable {
		name = x;
		flag = f;
	}
	function getName() returns (bytes3 ret) { return name; }
	function getFlag() returns (bool ret) { return flag; }
}
contract Main {
	Helper h;
	function Main() payable {
		h = (new Helper).value(10)("abc", true);
	}
	function getFlag() returns (bool ret) { return h.getFlag(); }
	function getName() returns (bytes3 ret) { return h.getName(); }
	function getBalances() returns (uint me, uint them) { me = this.balance; them = h.balance;}
}

