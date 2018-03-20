interface I {
	event A();
	function f() returns (bool);
	function() payable;
}

/// @ext:soltest
/// {interface_contract}
///     // compileAndRun(sourceCode, 0, "A");
///     // u160 const recipient = m_contractAddress;
///     // compileAndRun(sourceCode, 0, "C");
///     // ABI_CHECK(callContractFunction("f(address)", recipient), encodeArgs(true));
contract A is I {
	function f() returns (bool) {
		return g();
	}

	function g() returns (bool) {
		return true;
	}

	function() payable {
	}
}

contract C {
	function f(address _interfaceAddress) returns (bool) {
		I i = I(_interfaceAddress);
		return i.f();
	}
}

