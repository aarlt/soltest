library lib {}
/// @ext:soltest
/// {reject_ether_sent_to_library}
///     // compileAndRun(sourceCode, 0, "lib");
///     // Address libraryAddress = m_contractAddress;
///     // compileAndRun(sourceCode, 10, "c");
///     // BOOST_CHECK_EQUAL(balanceAt(m_contractAddress), 10);
///     // BOOST_CHECK_EQUAL(balanceAt(libraryAddress), 0);
///     // ABI_CHECK(callContractFunction("f(address)", encodeArgs(u160(libraryAddress))), encodeArgs(false));
///     // BOOST_CHECK_EQUAL(balanceAt(m_contractAddress), 10);
///     // BOOST_CHECK_EQUAL(balanceAt(libraryAddress), 0);
///     // ABI_CHECK(callContractFunction("f(address)", encodeArgs(u160(m_contractAddress))), encodeArgs(true));
///     // BOOST_CHECK_EQUAL(balanceAt(m_contractAddress), 10);
///     // BOOST_CHECK_EQUAL(balanceAt(libraryAddress), 0);
contract c {
	function c() payable {}
	function f(address x) returns (bool) {
		return x.send(1);
	}
	function () payable {}
}

