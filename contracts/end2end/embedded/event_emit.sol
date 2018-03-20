/// @ext:soltest
/// {event_emit}
///     // compileAndRun(sourceCode);
///     // u256 value(18);
///     // u256 id(0x1234);
///     // callContractFunctionWithValue("deposit(bytes32)", value, id);
///     // BOOST_REQUIRE_EQUAL(m_logs.size(), 1);
///     // BOOST_CHECK_EQUAL(m_logs[0].address, m_contractAddress);
///     // BOOST_CHECK_EQUAL(h256(m_logs[0].data), h256(u256(value)));
///     // BOOST_REQUIRE_EQUAL(m_logs[0].topics.size(), 3);
///     // BOOST_CHECK_EQUAL(m_logs[0].topics[0], dev::keccak256(string("Deposit(address,bytes32,uint256)")));
///     // BOOST_CHECK_EQUAL(m_logs[0].topics[1], h256(m_sender, h256::AlignRight));
///     // BOOST_CHECK_EQUAL(m_logs[0].topics[2], h256(id));
contract ClientReceipt {
	event Deposit(address indexed _from, bytes32 indexed _id, uint _value);
	function deposit(bytes32 _id) payable {
		emit Deposit(msg.sender, _id, msg.value);
	}
}

