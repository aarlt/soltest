/// @ext:soltest
/// {events_with_same_name_inherited}
///     // u160 const c_loggedAddress = m_contractAddress;
///     //
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("deposit()"), encodeArgs(u256(1)));
///     // BOOST_REQUIRE_EQUAL(m_logs.size(), 1);
///     // BOOST_CHECK_EQUAL(m_logs[0].address, m_contractAddress);
///     // BOOST_CHECK(m_logs[0].data.empty());
///     // BOOST_REQUIRE_EQUAL(m_logs[0].topics.size(), 1);
///     // BOOST_CHECK_EQUAL(m_logs[0].topics[0], dev::keccak256(string("Deposit()")));
///     //
///     // ABI_CHECK(callContractFunction("deposit(address)", c_loggedAddress), encodeArgs(u256(1)));
///     // BOOST_REQUIRE_EQUAL(m_logs.size(), 1);
///     // BOOST_CHECK_EQUAL(m_logs[0].address, m_contractAddress);
///     // BOOST_CHECK(m_logs[0].data == encodeArgs(c_loggedAddress));
///     // BOOST_REQUIRE_EQUAL(m_logs[0].topics.size(), 1);
///     // BOOST_CHECK_EQUAL(m_logs[0].topics[0], dev::keccak256(string("Deposit(address)")));
///     //
///     // ABI_CHECK(callContractFunction("deposit(address,uint256)", c_loggedAddress, u256(100)), encodeArgs(u256(1)));
///     // BOOST_REQUIRE_EQUAL(m_logs.size(), 1);
///     // BOOST_CHECK_EQUAL(m_logs[0].address, m_contractAddress);
///     // BOOST_CHECK(m_logs[0].data == encodeArgs(c_loggedAddress, 100));
///     // BOOST_REQUIRE_EQUAL(m_logs[0].topics.size(), 1);
///     // BOOST_CHECK_EQUAL(m_logs[0].topics[0], dev::keccak256(string("Deposit(address,uint256)")));
contract A {
	event Deposit();
}

contract B {
	event Deposit(address _addr);
}

contract ClientReceipt is A, B {
	event Deposit(address _addr, uint _amount);
	function deposit() returns (uint) {
		Deposit();
		return 1;
	}
	function deposit(address _addr) returns (uint) {
		Deposit(_addr);
		return 1;
	}
	function deposit(address _addr, uint _amount) returns (uint) {
		Deposit(_addr, _amount);
		return 1;
	}
}

