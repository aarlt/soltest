/// @ext:soltest
/// {shift_left_uint32}
///     // compileAndRun(sourceCode, 0, "C");
///     // ABI_CHECK(callContractFunction("f(uint32,uint32)", u256(0x4266), u256(0)), encodeArgs(u256(0x4266)));
///     // ABI_CHECK(callContractFunction("f(uint32,uint32)", u256(0x4266), u256(8)), encodeArgs(u256(0x426600)));
///     // ABI_CHECK(callContractFunction("f(uint32,uint32)", u256(0x4266), u256(16)), encodeArgs(u256(0x42660000)));
///     // ABI_CHECK(callContractFunction("f(uint32,uint32)", u256(0x4266), u256(17)), encodeArgs(u256(0x84cc0000)));
///     // ABI_CHECK(callContractFunction("f(uint32,uint32)", u256(0x4266), u256(32)), encodeArgs(u256(0)));
contract C {
	function f(uint32 a, uint32 b) returns (uint) {
		return a << b;
	}
}

