/// @ext:soltest
/// {convert_fixed_bytes_to_uint_same_size}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(
///     // 	callContractFunction("bytesToUint(bytes32)", string("abc2")),
///     // 	encodeArgs(u256("0x6162633200000000000000000000000000000000000000000000000000000000"))
///     // );
contract Test {
	function bytesToUint(bytes32 s) returns (uint256 h) {
		return uint(s);
	}
}

