/// @ext:soltest
/// {arrays_complex_memory_index_access}
///     // compileAndRun(sourceCode, 0, "Test");
///     //
///     // vector<u256> data{1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18};
///     // BOOST_REQUIRE(callContractFunction(
///     // 		"set(uint24[3][],uint256,uint256)",
///     // 		u256(0x60),
///     // 		u256(3),
///     // 		u256(2),
///     // 		u256(data.size() / 3),
///     // 		data
///     // ) == encodeArgs(u256(data.size() / 3), u256(data[3 * 3 + 2])));
contract Test {
	function set(uint24[3][] _data, uint a, uint b) returns (uint l, uint e) {
		l = _data.length;
		e = _data[a][b];
	}
}

