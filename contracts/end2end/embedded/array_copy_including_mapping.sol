/// @ext:soltest
/// {array_copy_including_mapping}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("test()"), encodeArgs(0x02000200));
///     // // storage is not empty because we cannot delete the mappings
///     // BOOST_CHECK(!storageEmpty(m_contractAddress));
///     // ABI_CHECK(callContractFunction("clear()"), encodeArgs(7));
///     // BOOST_CHECK(storageEmpty(m_contractAddress));
contract c {
	mapping(uint=>uint)[90][] large;
	mapping(uint=>uint)[3][] small;
	function test() returns (uint r) {
		large.length = small.length = 7;
		large[3][2][0] = 2;
		large[1] = large[3];
		small[3][2][0] = 2;
		small[1] = small[2];
		r = ((
			small[3][2][0] * 0x100 |
			small[1][2][0]) * 0x100 |
			large[3][2][0]) * 0x100 |
			large[1][2][0];
		delete small;
		delete large;
	}
	function clear() returns (uint r) {
		large.length = small.length = 7;
		small[3][2][0] = 0;
		large[3][2][0] = 0;
		small.length = large.length = 0;
		return 7;
	}
}

