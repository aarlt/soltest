library Lib {
	function find(uint16[] storage _haystack, uint16 _needle) view returns (uint)
	{
		for (uint i = 0; i < _haystack.length; ++i)
			if (_haystack[i] == _needle)
				return i;
		return uint(-1);
	}
}
/// @ext:soltest
/// {internal_types_in_library}
///     // compileAndRun(sourceCode, 0, "Lib");
///     // compileAndRun(sourceCode, 0, "Test", bytes(), map<string, Address>{{"Lib", m_contractAddress}});
///     // ABI_CHECK(callContractFunction("f()"), encodeArgs(u256(4), u256(17)));
contract Test {
	mapping(string => uint16[]) data;
	function f() returns (uint a, uint b)
	{
		data["abc"].length = 20;
		data["abc"][4] = 9;
		data["abc"][17] = 3;
		a = Lib.find(data["abc"], 9);
		b = Lib.find(data["abc"], 3);
	}
}

