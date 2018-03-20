/// @ext:soltest
/// {struct_accessor}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("data(uint256)", 7), encodeArgs(1, 2, true));
contract test {
	struct Data { uint a; uint8 b; mapping(uint => uint) c; bool d; }
	mapping(uint => Data) public data;
	function test() {
		data[7].a = 1;
		data[7].b = 2;
		data[7].c[0] = 3;
		data[7].d = true;
	}
}

