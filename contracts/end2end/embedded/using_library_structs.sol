library Lib {
	struct Data { uint a; uint[] b; }
	function set(Data storage _s)
	{
		_s.a = 7;
		_s.b.length = 20;
		_s.b[19] = 8;
	}
}
/// @ext:soltest
/// {using_library_structs}
///     // compileAndRun(sourceCode, 0, "Lib");
///     // compileAndRun(sourceCode, 0, "Test", bytes(), map<string, Address>{{"Lib", m_contractAddress}});
///     // ABI_CHECK(callContractFunction("f()"), encodeArgs(u256(7), u256(8)));
contract Test {
	mapping(string => Lib.Data) data;
	function f() returns (uint a, uint b)
	{
		Lib.set(data["abc"]);
		a = data["abc"].a;
		b = data["abc"].b[19];
	}
}

