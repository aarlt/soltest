/// @ext:soltest
/// {mutex}
///     // compileAndRun(sourceCode, 500, "Fund");
///     // auto fund = m_contractAddress;
///     // BOOST_CHECK_EQUAL(balanceAt(fund), 500);
///     // compileAndRun(sourceCode, 0, "Attacker", encodeArgs(u160(fund)));
///     // ABI_CHECK(callContractFunction("setProtected(bool)", true), encodeArgs());
///     // ABI_CHECK(callContractFunction("attack()"), encodeArgs());
///     // BOOST_CHECK_EQUAL(balanceAt(fund), 500);
///     // ABI_CHECK(callContractFunction("setProtected(bool)", false), encodeArgs());
///     // ABI_CHECK(callContractFunction("attack()"), encodeArgs(u256(460)));
///     // BOOST_CHECK_EQUAL(balanceAt(fund), 460);
contract mutexed {
	bool locked;
	modifier protected {
		if (locked) throw;
		locked = true;
		_;
		locked = false;
	}
}
contract Fund is mutexed {
	uint shares;
	function Fund() payable { shares = msg.value; }
	function withdraw(uint amount) protected returns (uint) {
		// NOTE: It is very bad practice to write this function this way.
		// Please refer to the documentation of how to do this properly.
		if (amount > shares) throw;
		if (!msg.sender.call.value(amount)()) throw;
		shares -= amount;
		return shares;
	}
	function withdrawUnprotected(uint amount) returns (uint) {
		// NOTE: It is very bad practice to write this function this way.
		// Please refer to the documentation of how to do this properly.
		if (amount > shares) throw;
		if (!msg.sender.call.value(amount)()) throw;
		shares -= amount;
		return shares;
	}
}
contract Attacker {
	Fund public fund;
	uint callDepth;
	bool protected;
	function setProtected(bool _protected) { protected = _protected; }
	function Attacker(Fund _fund) { fund = _fund; }
	function attack() returns (uint) {
		callDepth = 0;
		return attackInternal();
	}
	function attackInternal() internal returns (uint) {
		if (protected)
			return fund.withdraw(10);
		else
			return fund.withdrawUnprotected(10);
	}
	function() payable {
		callDepth++;
		if (callDepth < 4)
			attackInternal();
	}
}

