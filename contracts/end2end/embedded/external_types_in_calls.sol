/// @ext:soltest
/// {external_types_in_calls}
///     // compileAndRun(sourceCode, 0, "C");
///     // ABI_CHECK(callContractFunction("test()"), encodeArgs(u256(9), u256(7)));
///     // ABI_CHECK(callContractFunction("t2()"), encodeArgs(u256(9)));
contract C1 { C1 public bla; function C1(C1 x) { bla = x; } }
contract C {
	function test() returns (C1 x, C1 y) {
		C1 c = new C1(C1(9));
		x = c.bla();
		y = this.t1(C1(7));
	}
	function t1(C1 a) returns (C1) { return a; }
	function t2() returns (C1) { return C1(9); }
}

