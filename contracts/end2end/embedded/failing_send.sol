/// @ext:soltest
/// {failing_send}
///     // compileAndRun(sourceCode, 0, "Helper");
///     // u160 const c_helperAddress = m_contractAddress;
///     // compileAndRun(sourceCode, 20, "Main");
///     // BOOST_REQUIRE(callContractFunction("callHelper(address)", c_helperAddress) == encodeArgs(true, 20));
contract Helper {
	uint[] data;
	function () {
		data[9]; // trigger exception
	}
}
contract Main {
	function Main() payable {}
	function callHelper(address _a) returns (bool r, uint bal) {
		r = !_a.send(5);
		bal = this.balance;
	}
}

