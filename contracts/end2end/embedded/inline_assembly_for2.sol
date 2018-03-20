/// @ext:soltest
/// {inline_assembly_for2}
///     // compileAndRun(sourceCode, 0, "C");
///     // ABI_CHECK(callContractFunction("f(uint256)", u256(0)), encodeArgs(u256(0), u256(2), u256(0)));
///     // ABI_CHECK(callContractFunction("f(uint256)", u256(1)), encodeArgs(u256(1), u256(4), u256(3)));
///     // ABI_CHECK(callContractFunction("f(uint256)", u256(2)), encodeArgs(u256(0), u256(2), u256(0)));
contract C {
	uint st;
	function f(uint a) returns (uint b, uint c, uint d) {
		st = 0;
		assembly {
			function sideeffect(r) -> x { sstore(0, add(sload(0), r)) x := 1}
			for { let i := a } eq(i, sideeffect(2)) { d := add(d, 3) } {
				b := i
				i := 0
			}
		}
		c = st;
	}
}

