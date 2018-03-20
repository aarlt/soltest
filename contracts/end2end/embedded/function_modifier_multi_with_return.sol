/// @ext:soltest
/// {function_modifier_multi_with_return}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("f(bool)", false), encodeArgs(1));
///     // ABI_CHECK(callContractFunction("f(bool)", true), encodeArgs(2));
contract C {
	modifier repeat(bool twice) { if (twice) _; _; }
	function f(bool twice) repeat(twice) returns (uint r) { r += 1; return r; }
}

