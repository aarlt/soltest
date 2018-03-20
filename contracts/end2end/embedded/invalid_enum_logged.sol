/// @ext:soltest
/// {invalid_enum_logged}
///     // compileAndRun(sourceCode, 0, "C");
///     // ABI_CHECK(callContractFunction("test_log_ok()"), encodeArgs(u256(1)));
///     // BOOST_REQUIRE_EQUAL(m_logs.size(), 1);
///     // BOOST_CHECK_EQUAL(m_logs[0].address, m_contractAddress);
///     // BOOST_REQUIRE_EQUAL(m_logs[0].topics.size(), 1);
///     // BOOST_REQUIRE_EQUAL(m_logs[0].topics[0], dev::keccak256(string("Log(uint8)")));
///     // BOOST_CHECK_EQUAL(h256(m_logs[0].data), h256(u256(0)));
///     //
///     // // should throw
///     // ABI_CHECK(callContractFunction("test_log()"), encodeArgs());
contract C {
	enum X { A, B }
	event Log(X);

	function test_log() returns (uint) {
		X garbled = X.A;
		assembly {
			garbled := 5
		}
		Log(garbled);
		return 1;
	}
	function test_log_ok() returns (uint) {
		X x = X.A;
		Log(x);
		return 1;
	}
}

