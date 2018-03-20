/// @ext:soltest
/// {deleteStruct}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("getToDelete()"), encodeArgs(0));
///     // ABI_CHECK(callContractFunction("getTopValue()"), encodeArgs(0));
///     // ABI_CHECK(callContractFunction("getNestedValue()"), encodeArgs(0));
///     // // mapping values should be the same
///     // ABI_CHECK(callContractFunction("getTopMapping(uint256)", 0), encodeArgs(1));
///     // ABI_CHECK(callContractFunction("getTopMapping(uint256)", 1), encodeArgs(2));
///     // ABI_CHECK(callContractFunction("getNestedMapping(uint256)", 0), encodeArgs(true));
///     // ABI_CHECK(callContractFunction("getNestedMapping(uint256)", 1), encodeArgs(false));
contract test {
	struct topStruct {
		nestedStruct nstr;
		emptyStruct empty;
		uint topValue;
		mapping (uint => uint) topMapping;
	}
	uint toDelete;
	topStruct str;
	struct nestedStruct {
		uint nestedValue;
		mapping (uint => bool) nestedMapping;
	}
	struct emptyStruct{
	}
	function test(){
		toDelete = 5;
		str.topValue = 1;
		str.topMapping[0] = 1;
		str.topMapping[1] = 2;

		str.nstr.nestedValue = 2;
		str.nstr.nestedMapping[0] = true;
		str.nstr.nestedMapping[1] = false;
		delete str;
		delete toDelete;
	}
	function getToDelete() returns (uint res){
		res = toDelete;
	}
	function getTopValue() returns(uint topValue){
		topValue = str.topValue;
	}
	function getNestedValue() returns(uint nestedValue){
		nestedValue = str.nstr.nestedValue;
	}
	function getTopMapping(uint index) returns(uint ret) {
		ret = str.topMapping[index];
	}
	function getNestedMapping(uint index) returns(bool ret) {
		return str.nstr.nestedMapping[index];
	}
}

