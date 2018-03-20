/// @ext:soltest
/// {multi_variable_declaration}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("f()", encodeArgs()), encodeArgs(true));
contract C {
	function g() returns (uint a, uint b, uint c) {
		a = 1; b = 2; c = 3;
	}
	function f() returns (bool) {
		var (x, y, z) = g();
		if (x != 1 || y != 2 || z != 3) return false;
		var (, a,) = g();
		if (a != 2) return false;
		var (b,) = g();
		if (b != 1) return false;
		var (,c) = g();
		if (c != 3) return false;
		return true;
	}
}

