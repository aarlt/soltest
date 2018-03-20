/// @ext:soltest
/// {event_anonymous_with_topics}
///     // compileAndRun(sourceCode);
///     // u256 value(18);
///     // u256 id(0x1234);
///     // callContractFunctionWithValue("deposit(bytes32)", value, id);
///     // BOOST_REQUIRE_EQUAL(m_logs.size(), 1);
///     // BOOST_CHECK_EQUAL(m_logs[0].address, m_contractAddress);
///     // BOOST_CHECK(m_logs[0].data == encodeArgs("abc"));
///     // BOOST_REQUIRE_EQUAL(m_logs[0].topics.size(), 4);
///     // BOOST_CHECK_EQUAL(m_logs[0].topics[0], h256(m_sender, h256::AlignRight));
///     // BOOST_CHECK_EQUAL(m_logs[0].topics[1], h256(id));
///     // BOOST_CHECK_EQUAL(m_logs[0].topics[2], h256(value));
///     // BOOST_CHECK_EQUAL(m_logs[0].topics[3], h256(2));
contract ClientReceipt {
	event Deposit(address indexed _from, bytes32 indexed _id, uint indexed _value, uint indexed _value2, bytes32 data) anonymous;
	function deposit(bytes32 _id) payable {
		Deposit(msg.sender, _id, msg.value, 2, "abc");
	}
}

