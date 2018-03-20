/// @ext:soltest
/// {overloaded_function_call_with_if_else}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("g(bool)", true), encodeArgs(3));
///     // ABI_CHECK(callContractFunction("g(bool)", false), encodeArgs(10));
contract test {
	function f(uint a, uint b) returns(uint d) { return a + b; }
	function f(uint k) returns(uint d) { return k; }
	function g(bool flag) returns(uint d) {
		if (flag)
			return f(3);
		else
			return f(3, 7);
	}
}

