/// @ext:soltest
/// {bytes_index_access}
///     // compileAndRun(sourceCode);
///     // string array{
///     // 	0, 1, 2, 3, 4, 5, 6, 7, 8, 9,
///     // 	10, 11, 12, 13, 14, 15, 16, 17, 18, 19,
///     // 	20, 21, 22, 23, 24, 25, 26, 27, 28, 29,
///     // 	30, 31, 32, 33};
///     // ABI_CHECK(callContractFunction("direct(bytes,uint256)", 64, 33, u256(array.length()), array), encodeArgs(33));
///     // ABI_CHECK(callContractFunction("storageCopyRead(bytes,uint256)", 64, 33, u256(array.length()), array), encodeArgs(33));
///     // ABI_CHECK(callContractFunction("storageWrite()"), encodeArgs(0x193));
contract c {
	bytes data;
	function direct(bytes arg, uint index) external returns (uint) {
		return uint(arg[index]);
	}
	function storageCopyRead(bytes arg, uint index) external returns (uint) {
		data = arg;
		return uint(data[index]);
	}
	function storageWrite() external returns (uint) {
		data.length = 35;
		data[31] = 0x77;
		data[32] = 0x14;

		data[31] = 1;
		data[31] |= 8;
		data[30] = 1;
		data[32] = 3;
		return uint(data[30]) * 0x100 | uint(data[31]) * 0x10 | uint(data[32]);
	}
}

