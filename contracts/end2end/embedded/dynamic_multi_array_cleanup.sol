/// @ext:soltest
/// {dynamic_multi_array_cleanup}
///     // compileAndRun(sourceCode);
///     // BOOST_CHECK(storageEmpty(m_contractAddress));
///     // ABI_CHECK(callContractFunction("fill()"), encodeArgs(8));
///     // BOOST_CHECK(!storageEmpty(m_contractAddress));
///     // ABI_CHECK(callContractFunction("clear()"), bytes());
///     // BOOST_CHECK(storageEmpty(m_contractAddress));
contract c {
	struct s { uint[][] d; }
	s[] data;
	function fill() returns (uint) {
		data.length = 3;
		data[2].d.length = 4;
		data[2].d[3].length = 5;
		data[2].d[3][4] = 8;
		return data[2].d[3][4];
	}
	function clear() { delete data; }
}

