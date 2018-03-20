/// @ext:soltest
/// {contracts_as_addresses}
///     // compileAndRun(sourceCode, 20);
///     // BOOST_CHECK_EQUAL(balanceAt(m_contractAddress), 20 - 5);
///     // BOOST_REQUIRE(callContractFunction("getBalance()") == encodeArgs(u256(20 - 5), u256(5)));
contract helper {
	function() payable { } // can receive ether
}
contract test {
	helper h;
	function test() payable { h = new helper(); h.send(5); }
	function getBalance() returns (uint256 myBalance, uint256 helperBalance) {
		myBalance = this.balance;
		helperBalance = h.balance;
	}
}

