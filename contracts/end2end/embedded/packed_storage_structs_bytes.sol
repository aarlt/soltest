/// @ext:soltest
/// {packed_storage_structs_bytes}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("test()"), encodeArgs(true));
contract C {
	struct s1 { byte a; byte b; bytes10 c; bytes9 d; bytes10 e; }
	struct s2 { byte a; s1 inner; byte b; byte c; }
	byte x;
	s2 data;
	byte y;
	function test() returns (bool) {
		x = 1;
		data.a = 2;
		data.inner.a = 3;
		data.inner.b = 4;
		data.inner.c = "1234567890";
		data.inner.d = "123456789";
		data.inner.e = "abcdefghij";
		data.b = 5;
		data.c = 6;
		y = 7;
		return x == 1 && data.a == 2 && data.inner.a == 3 && data.inner.b == 4 &&
			data.inner.c == "1234567890" && data.inner.d == "123456789" &&
			data.inner.e == "abcdefghij" && data.b == 5 && data.c == 6 && y == 7;
	}
}

