/// @ext:soltest
/// {address_overload_resolution}
///     // compileAndRun(sourceCode, 0, "D");
///     // BOOST_CHECK(callContractFunction("f()") == encodeArgs(u256(1)));
///     // BOOST_CHECK(callContractFunction("g()") == encodeArgs(u256(5)));
contract C {
	function balance() returns (uint) {
		return 1;
	}
	function transfer(uint amount) returns (uint) {
		return amount;
	}
}
contract D {
	function f() returns (uint) {
		return (new C()).balance();
	}
	function g() returns (uint) {
		return (new C()).transfer(5);
	}
}

