/// @ext:soltest
/// {bytes_inside_mappings}
///     // compileAndRun(sourceCode);
///     // // store a short byte array at 1 and a longer one at 2
///     // ABI_CHECK(callContractFunction("set(uint256)", 1, 2), encodeArgs(true));
///     // ABI_CHECK(callContractFunction("set(uint256)", 2, 2, 3, 4, 5), encodeArgs(true));
///     // BOOST_CHECK(!storageEmpty(m_contractAddress));
///     // // copy shorter to longer
///     // ABI_CHECK(callContractFunction("copy(uint256,uint256)", 1, 2), encodeArgs(true));
///     // BOOST_CHECK(!storageEmpty(m_contractAddress));
///     // // copy empty to both
///     // ABI_CHECK(callContractFunction("copy(uint256,uint256)", 99, 1), encodeArgs(true));
///     // BOOST_CHECK(!storageEmpty(m_contractAddress));
///     // ABI_CHECK(callContractFunction("copy(uint256,uint256)", 99, 2), encodeArgs(true));
///     // BOOST_CHECK(storageEmpty(m_contractAddress));
contract c {
	function set(uint key) returns (bool) { data[key] = msg.data; return true; }
	function copy(uint from, uint to) returns (bool) { data[to] = data[from]; return true; }
	mapping(uint => bytes) data;
}

