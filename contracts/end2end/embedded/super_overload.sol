/// @ext:soltest
/// {super_overload}
///     // compileAndRun(sourceCode, 0, "C");
///     // ABI_CHECK(callContractFunction("g()"), encodeArgs(10));
///     // ABI_CHECK(callContractFunction("h()"), encodeArgs(2));
contract A { function f(uint a) returns(uint) { return 2 * a; } }
contract B { function f(bool b) returns(uint) { return 10; } }
contract C is A, B {
	function g() returns(uint) { return super.f(true); }
	function h() returns(uint) { return super.f(1); }
}

