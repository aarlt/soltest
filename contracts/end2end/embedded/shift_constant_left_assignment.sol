/// @ext:soltest
/// {shift_constant_left_assignment}
///     // compileAndRun(sourceCode, 0, "C");
///     // ABI_CHECK(callContractFunction("f()"), encodeArgs(u256(0x4200)));
contract C {
	function f() returns (uint a) {
		a = 0x42;
		a <<= 8;
	}
}

