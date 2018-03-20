/// @ext:soltest
/// {break_in_modifier}
///     // compileAndRun(sourceCode, 0, "C");
///     // ABI_CHECK(callContractFunction("x()"), encodeArgs(u256(0)));
///     // ABI_CHECK(callContractFunction("f()"), encodeArgs());
///     // ABI_CHECK(callContractFunction("x()"), encodeArgs(u256(1)));
contract C {
	uint public x;
	modifier run() {
		for (uint i = 0; i < 10; i++) {
			_;
			break;
		}
	}
	function f() run {
		x++;
	}
}

