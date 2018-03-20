/// @ext:soltest
/// {simple_mapping}
///     // compileAndRun(sourceCode);
///     //
///     // ABI_CHECK(callContractFunction("get(uint8)", byte(0)), encodeArgs(byte(0x00)));
///     // ABI_CHECK(callContractFunction("get(uint8)", byte(0x01)), encodeArgs(byte(0x00)));
///     // ABI_CHECK(callContractFunction("get(uint8)", byte(0xa7)), encodeArgs(byte(0x00)));
///     // callContractFunction("set(uint8,uint8)", byte(0x01), byte(0xa1));
///     // ABI_CHECK(callContractFunction("get(uint8)", byte(0x00)), encodeArgs(byte(0x00)));
///     // ABI_CHECK(callContractFunction("get(uint8)", byte(0x01)), encodeArgs(byte(0xa1)));
///     // ABI_CHECK(callContractFunction("get(uint8)", byte(0xa7)), encodeArgs(byte(0x00)));
///     // callContractFunction("set(uint8,uint8)", byte(0x00), byte(0xef));
///     // ABI_CHECK(callContractFunction("get(uint8)", byte(0x00)), encodeArgs(byte(0xef)));
///     // ABI_CHECK(callContractFunction("get(uint8)", byte(0x01)), encodeArgs(byte(0xa1)));
///     // ABI_CHECK(callContractFunction("get(uint8)", byte(0xa7)), encodeArgs(byte(0x00)));
///     // callContractFunction("set(uint8,uint8)", byte(0x01), byte(0x05));
///     // ABI_CHECK(callContractFunction("get(uint8)", byte(0x00)), encodeArgs(byte(0xef)));
///     // ABI_CHECK(callContractFunction("get(uint8)", byte(0x01)), encodeArgs(byte(0x05)));
///     // ABI_CHECK(callContractFunction("get(uint8)", byte(0xa7)), encodeArgs(byte(0x00)));
contract test {
	mapping(uint8 => uint8) table;
	function get(uint8 k) returns (uint8 v) {
		return table[k];
	}
	function set(uint8 k, uint8 v) {
		table[k] = v;
	}
}

