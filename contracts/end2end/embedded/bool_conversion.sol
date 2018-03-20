/// @ext:soltest
/// {bool_conversion}
///     // compileAndRun(sourceCode, 0, "C");
///     // ABI_CHECK(callContractFunction("f(bool)", 0), encodeArgs(0));
///     // ABI_CHECK(callContractFunction("f(bool)", 1), encodeArgs(1));
///     // ABI_CHECK(callContractFunction("f(bool)", 2), encodeArgs(1));
///     // ABI_CHECK(callContractFunction("f(bool)", 3), encodeArgs(1));
///     // ABI_CHECK(callContractFunction("f(bool)", 255), encodeArgs(1));
///     // ABI_CHECK(callContractFunction("g(bool)", 0), encodeArgs(0));
///     // ABI_CHECK(callContractFunction("g(bool)", 1), encodeArgs(1));
///     // ABI_CHECK(callContractFunction("g(bool)", 2), encodeArgs(1));
///     // ABI_CHECK(callContractFunction("g(bool)", 3), encodeArgs(1));
///     // ABI_CHECK(callContractFunction("g(bool)", 255), encodeArgs(1));
contract C {
	function f(bool _b) returns(uint) {
		if (_b)
			return 1;
		else
			return 0;
	}
	function g(bool _in) returns (bool _out) {
		_out = _in;
	}
}

