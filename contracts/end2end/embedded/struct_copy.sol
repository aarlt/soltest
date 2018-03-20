/// @ext:soltest
/// {struct_copy}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("set(uint256)", 7), encodeArgs(true));
///     // ABI_CHECK(callContractFunction("retrieve(uint256)", 7), encodeArgs(1, 3, 4, 2));
///     // ABI_CHECK(callContractFunction("copy(uint256,uint256)", 7, 8), encodeArgs(true));
///     // ABI_CHECK(callContractFunction("retrieve(uint256)", 7), encodeArgs(1, 3, 4, 2));
///     // ABI_CHECK(callContractFunction("retrieve(uint256)", 8), encodeArgs(1, 3, 4, 2));
///     // ABI_CHECK(callContractFunction("copy(uint256,uint256)", 0, 7), encodeArgs(true));
///     // ABI_CHECK(callContractFunction("retrieve(uint256)", 7), encodeArgs(0, 0, 0, 0));
///     // ABI_CHECK(callContractFunction("retrieve(uint256)", 8), encodeArgs(1, 3, 4, 2));
///     // ABI_CHECK(callContractFunction("copy(uint256,uint256)", 7, 8), encodeArgs(true));
///     // ABI_CHECK(callContractFunction("retrieve(uint256)", 8), encodeArgs(0, 0, 0, 0));
contract c {
	struct Nested { uint x; uint y; }
	struct Struct { uint a; mapping(uint => Struct) b; Nested nested; uint c; }
	mapping(uint => Struct) data;
	function set(uint k) returns (bool) {
		data[k].a = 1;
		data[k].nested.x = 3;
		data[k].nested.y = 4;
		data[k].c = 2;
		return true;
	}
	function copy(uint from, uint to) returns (bool) {
		data[to] = data[from];
		return true;
	}
	function retrieve(uint k) returns (uint a, uint x, uint y, uint c)
	{
		a = data[k].a;
		x = data[k].nested.x;
		y = data[k].nested.y;
		c = data[k].c;
	}
}

