/// @ext:soltest
/// {array_copy_nested_array}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("test(uint256[2][])", encodeArgs(
///     // 	32, 3,
///     // 	7, 8,
///     // 	9, 10,
///     // 	11, 12
///     // )), encodeArgs(10));
contract c {
	uint[4][] a;
	uint[10][] b;
	uint[][] c;
	function test(uint[2][] d) external returns (uint) {
		a = d;
		b = a;
		c = b;
		return c[1][1] | c[1][2] | c[1][3] | c[1][4];
	}
}

