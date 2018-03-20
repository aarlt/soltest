/// @ext:soltest
/// {storing_invalid_boolean}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("set()"), encodeArgs(1));
///     // ABI_CHECK(callContractFunction("perm()"), encodeArgs(1));
///     // ABI_CHECK(callContractFunction("ret()"), encodeArgs(1));
///     // ABI_CHECK(callContractFunction("ev()"), encodeArgs(1));
///     // BOOST_REQUIRE_EQUAL(m_logs.size(), 1);
///     // BOOST_CHECK_EQUAL(m_logs[0].address, m_contractAddress);
///     // BOOST_CHECK(m_logs[0].data == encodeArgs(1));
///     // BOOST_REQUIRE_EQUAL(m_logs[0].topics.size(), 1);
///     // BOOST_CHECK_EQUAL(m_logs[0].topics[0], dev::keccak256(string("Ev(bool)")));
contract C {
	event Ev(bool);
	bool public perm;
	function set() returns(uint) {
		bool tmp;
		assembly {
			tmp := 5
		}
		perm = tmp;
		return 1;
	}
	function ret() returns(bool) {
		bool tmp;
		assembly {
			tmp := 5
		}
		return tmp;
	}
	function ev() returns(uint) {
		bool tmp;
		assembly {
			tmp := 5
		}
		Ev(tmp);
		return 1;
	}
}

