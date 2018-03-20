/// @ext:soltest
/// {function_modifier_multiple_times}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("f(uint256)", u256(3)), encodeArgs(2 + 5 + 3));
///     // ABI_CHECK(callContractFunction("a()"), encodeArgs(2 + 5 + 3));
contract C {
	uint public a;
	modifier mod(uint x) { a += x; _; }
	function f(uint x) mod(2) mod(5) mod(x) returns(uint) { return a; }
}

