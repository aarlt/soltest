/// @ext:soltest
/// {packed_storage_structs_delete}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("test()"), encodeArgs(1));
///     // BOOST_CHECK(storageEmpty(m_contractAddress));
contract C {
	struct str { uint8 a; uint16 b; uint8 c; }
	uint8 x;
	uint16 y;
	str data;
	function test() returns (uint) {
		x = 1;
		y = 2;
		data.a = 2;
		data.b = 0xabcd;
		data.c = 0xfa;
		if (x != 1 || y != 2 || data.a != 2 || data.b != 0xabcd || data.c != 0xfa)
			return 2;
		delete y;
		delete data.b;
		if (x != 1 || y != 0 || data.a != 2 || data.b != 0 || data.c != 0xfa)
			return 3;
		delete x;
		delete data;
		return 1;
	}
}

