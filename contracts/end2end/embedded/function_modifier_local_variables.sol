/// @ext:soltest
/// {function_modifier_local_variables}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("f(bool)", true), encodeArgs(0));
///     // ABI_CHECK(callContractFunction("f(bool)", false), encodeArgs(3));
contract C {
	modifier mod1 { var a = 1; var b = 2; _; }
	modifier mod2(bool a) { if (a) return; else _; }
	function f(bool a) mod1 mod2(a) returns (uint r) { return 3; }
}

