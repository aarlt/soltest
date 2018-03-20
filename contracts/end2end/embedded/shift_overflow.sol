/// @ext:soltest
/// {shift_overflow}
///     // compileAndRun(sourceCode, 0, "C");
///     // ABI_CHECK(callContractFunction("leftU(uint8,uint8)", 255, 8), encodeArgs(u256(0)));
///     // ABI_CHECK(callContractFunction("leftU(uint8,uint8)", 255, 1), encodeArgs(u256(254)));
///     // ABI_CHECK(callContractFunction("leftU(uint8,uint8)", 255, 0), encodeArgs(u256(255)));
///     //
///     // // Result is -128 and output is sign-extended, not zero-padded.
///     // ABI_CHECK(callContractFunction("leftS(int8,int8)", 1, 7), encodeArgs(u256(0) - 128));
///     // ABI_CHECK(callContractFunction("leftS(int8,int8)", 1, 6), encodeArgs(u256(64)));
contract C {
	function leftU(uint8 x, uint8 y) returns (uint8) {
		return x << y;
	}
	function leftS(int8 x, int8 y) returns (int8) {
		return x << y;
	}
}

