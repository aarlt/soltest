/// @ext:soltest
/// {sign_extension}
///     // compileAndRun(sourceCode);
///     // auto sign_extension_cpp = []() -> u256
///     // {
///     // 	int64_t x = -int32_t(0xff);
///     // 	if (x >= 0xff)
///     // 		return 0;
///     // 	return u256(x) * -1;
///     // };
///     // testContractAgainstCpp("run()", sign_extension_cpp);
contract test {
	function run() returns(uint256 y) {
		int64 x = -int32(0xff);
		if (x >= 0xff) return 0;
		return -uint256(x);
	}
}

