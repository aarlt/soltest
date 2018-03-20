/// @ext:soltest
/// {virtual_function_calls}
///     // compileAndRun(sourceCode, 0, "Derived");
///     // ABI_CHECK(callContractFunction("g()"), encodeArgs(2));
///     // ABI_CHECK(callContractFunction("f()"), encodeArgs(2));
contract Base {
	function f() returns (uint i) { return g(); }
	function g() returns (uint i) { return 1; }
}
contract Derived is Base {
	function g() returns (uint i) { return 2; }
}

