/// @ext:soltest
/// {memory_structs_as_function_args}
///     // compileAndRun(sourceCode, 0, "Test");
///     //
///     // ABI_CHECK(callContractFunction("test()"), encodeArgs(u256(1), u256(2), u256(3)));
contract Test {
	struct S { uint8 x; uint16 y; uint z; }
	function test() returns (uint x, uint y, uint z) {
		S memory data = combine(1, 2, 3);
		x = extract(data, 0);
		y = extract(data, 1);
		z = extract(data, 2);
	}
	function extract(S s, uint which) internal returns (uint x) {
		if (which == 0) return s.x;
		else if (which == 1) return s.y;
		else return s.z;
	}
	function combine(uint8 x, uint16 y, uint z) internal returns (S s) {
		s.x = x;
		s.y = y;
		s.z = z;
	}
}

