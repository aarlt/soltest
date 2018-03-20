/// @ext:soltest
/// {gas_and_value_basic}
///     // compileAndRun(sourceCode, 20);
///     // BOOST_REQUIRE(callContractFunction("sendAmount(uint256)", 5) == encodeArgs(5));
///     // // call to helper should not succeed but amount should be transferred anyway
///     // BOOST_REQUIRE(callContractFunction("outOfGas()") == bytes());
///     // BOOST_REQUIRE(callContractFunction("checkState()") == encodeArgs(false, 20 - 5));
contract helper {
	bool flag;
	function getBalance() payable returns (uint256 myBalance) {
		return this.balance;
	}
	function setFlag() { flag = true; }
	function getFlag() returns (bool fl) { return flag; }
}
contract test {
	helper h;
	function test() payable { h = new helper(); }
	function sendAmount(uint amount) payable returns (uint256 bal) {
		return h.getBalance.value(amount)();
	}
	function outOfGas() returns (bool ret) {
		h.setFlag.gas(2)(); // should fail due to OOG
		return true;
	}
	function checkState() returns (bool flagAfter, uint myBal) {
		flagAfter = h.getFlag();
		myBal = this.balance;
	}
}

