/// @ext:soltest
/// {struct_copy_via_local}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("test()"), encodeArgs(true));
contract c {
	struct Struct { uint a; uint b; }
	Struct data1;
	Struct data2;
	function test() returns (bool) {
		data1.a = 1;
		data1.b = 2;
		var x = data1;
		data2 = x;
		return data2.a == data1.a && data2.b == data1.b;
	}
}

