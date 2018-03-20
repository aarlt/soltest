/// @ext:soltest
/// {create_memory_array}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("f()"), encodeArgs(string("A"), u256(8), u256(4), string("B")));
contract C {
	struct S { uint[2] a; bytes b; }
	function f() returns (byte, uint, uint, byte) {
		var x = new bytes(200);
		x[199] = 'A';
		var y = new uint[2][](300);
		y[203][1] = 8;
		var z = new S[](180);
		z[170].a[1] = 4;
		z[170].b = new bytes(102);
		z[170].b[99] = 'B';
		return (x[199], y[203][1], z[170].a[1], z[170].b[99]);
	}
}

