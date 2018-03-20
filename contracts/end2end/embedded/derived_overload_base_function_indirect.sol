/// @ext:soltest
/// {derived_overload_base_function_indirect}
///     // compileAndRun(sourceCode, 0, "C");
///     // ABI_CHECK(callContractFunction("g()"), encodeArgs(10));
///     // ABI_CHECK(callContractFunction("h()"), encodeArgs(2));
contract A { function f(uint a) returns(uint) { return 2 * a; } }
contract B { function f() returns(uint) { return 10; } }
contract C is A, B {
	function g() returns(uint) { return f(); }
	function h() returns(uint) { return f(1); }
}

