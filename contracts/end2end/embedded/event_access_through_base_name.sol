/// @ext:soltest
/// {event_access_through_base_name}
///     // compileAndRun(sourceCode);
///     // callContractFunction("f()");
///     // BOOST_REQUIRE_EQUAL(m_logs.size(), 1);
///     // BOOST_CHECK_EQUAL(m_logs[0].address, m_contractAddress);
///     // BOOST_CHECK(m_logs[0].data.empty());
///     // BOOST_REQUIRE_EQUAL(m_logs[0].topics.size(), 1);
///     // BOOST_CHECK_EQUAL(m_logs[0].topics[0], dev::keccak256(string("x()")));
contract A {
	event x();
}
contract B is A {
	function f() returns (uint) {
		A.x();
		return 1;
	}
}

