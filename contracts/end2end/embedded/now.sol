/// @ext:soltest
/// {now}
///     // compileAndRun(sourceCode);
///     // u256 startBlock = m_blockNumber;
///     // size_t startTime = blockTimestamp(startBlock);
///     // auto ret = callContractFunction("someInfo()");
///     // u256 endBlock = m_blockNumber;
///     // size_t endTime = blockTimestamp(endBlock);
///     // BOOST_CHECK(startBlock != endBlock);
///     // BOOST_CHECK(startTime != endTime);
///     // ABI_CHECK(ret, encodeArgs(true, endTime));
contract test {
	function someInfo() returns (bool equal, uint val) {
		equal = block.timestamp == now;
		val = now;
	}
}

