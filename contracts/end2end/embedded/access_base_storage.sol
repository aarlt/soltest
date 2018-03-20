/// @ext:soltest
/// {access_base_storage}
///     // compileAndRun(sourceCode, 0, "Derived");
///     // ABI_CHECK(callContractFunction("setData(uint256,uint256)", 1, 2), encodeArgs(true));
///     // ABI_CHECK(callContractFunction("getViaBase()"), encodeArgs(1));
///     // ABI_CHECK(callContractFunction("getViaDerived()"), encodeArgs(1, 2));
contract Base {
	uint dataBase;
	function getViaBase() returns (uint i) { return dataBase; }
}
contract Derived is Base {
	uint dataDerived;
	function setData(uint base, uint derived) returns (bool r) {
		dataBase = base;
		dataDerived = derived;
		return true;
	}
	function getViaDerived() returns (uint base, uint derived) {
		base = dataBase;
		derived = dataDerived;
	}
}

