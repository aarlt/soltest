/// @ext:soltest
/// {string_as_mapping_key}
///     // compileAndRun(sourceCode, 0, "Test");
///     // vector<string> strings{
///     // 	"Hello, World!",
///     // 	"Hello,                            World!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1111",
///     // 	"",
///     // 	"1"
///     // };
///     // for (unsigned i = 0; i < strings.size(); i++)
///     // 	ABI_CHECK(callContractFunction(
///     // 		"set(string,uint256)",
///     // 		u256(0x40),
///     // 		u256(7 + i),
///     // 		u256(strings[i].size()),
///     // 		strings[i]
///     // 	), encodeArgs());
///     // for (unsigned i = 0; i < strings.size(); i++)
///     // 	ABI_CHECK(callContractFunction(
///     // 		"get(string)",
///     // 		u256(0x20),
///     // 		u256(strings[i].size()),
///     // 		strings[i]
///     // 	), encodeArgs(u256(7 + i)));
contract Test {
	mapping(string => uint) data;
	function set(string _s, uint _v) { data[_s] = _v; }
	function get(string _s) returns (uint) { return data[_s]; }
}

