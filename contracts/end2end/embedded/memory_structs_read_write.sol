/// @ext:soltest
/// {memory_structs_read_write}
///     // compileAndRun(sourceCode, 0, "Test");
///     //
///     // ABI_CHECK(callContractFunction("testInit()"), encodeArgs(u256(0), u256(0), u256(0), u256(0), true));
///     // ABI_CHECK(callContractFunction("testCopyRead()"), encodeArgs(u256(1), u256(2), u256(3), u256(4)));
///     // ABI_CHECK(callContractFunction("testAssign()"), encodeArgs(u256(1), u256(2), u256(3), u256(4)));
contract Test {
	struct S { uint8 x; uint16 y; uint z; uint8[2] a; }
	S[5] data;
	function testInit() returns (uint8 x, uint16 y, uint z, uint8 a, bool flag) {
		S[2] memory d;
		x = d[0].x;
		y = d[0].y;
		z = d[0].z;
		a = d[0].a[1];
		flag = true;
	}
	function testCopyRead() returns (uint8 x, uint16 y, uint z, uint8 a) {
		data[2].x = 1;
		data[2].y = 2;
		data[2].z = 3;
		data[2].a[1] = 4;
		S memory s = data[2];
		x = s.x;
		y = s.y;
		z = s.z;
		a = s.a[1];
	}
	function testAssign() returns (uint8 x, uint16 y, uint z, uint8 a) {
		S memory s;
		s.x = 1;
		s.y = 2;
		s.z = 3;
		s.a[1] = 4;
		x = s.x;
		y = s.y;
		z = s.z;
		a = s.a[1];
	}
}

