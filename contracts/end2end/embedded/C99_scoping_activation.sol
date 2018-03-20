pragma experimental "v0.5.0";
/// @ext:soltest
/// {C99_scoping_activation}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("f()"), encodeArgs(3));
///     // ABI_CHECK(callContractFunction("g()"), encodeArgs(0));
///     // ABI_CHECK(callContractFunction("h()"), encodeArgs(3, 3, 4));
///     // ABI_CHECK(callContractFunction("i()"), encodeArgs(3, 3));
contract test {
	function f() pure public returns (uint) {
		uint x = 7;
		{
			x = 3; // This should still assign to the outer variable
			uint x;
			x = 4; // This should assign to the new one
		}
		return x;
	}
	function g() pure public returns (uint x) {
		x = 7;
		{
			x = 3;
			uint x;
			return x; // This returns the new variable, i.e. 0
		}
	}
	function h() pure public returns (uint x, uint a, uint b) {
		x = 7;
		{
			x = 3;
			a = x; // This should read from the outer
			uint x = 4;
			b = x;
		}
	}
	function i() pure public returns (uint x, uint a) {
		x = 7;
		{
			x = 3;
			uint x = x; // This should read from the outer and assign to the inner
			a = x;
		}
	}
}

