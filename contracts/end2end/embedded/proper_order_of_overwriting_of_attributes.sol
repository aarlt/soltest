/// @ext:soltest
/// {proper_order_of_overwriting_of_attributes}
///     // compileAndRun(sourceCode, 0, "init_fix");
///     // ABI_CHECK(callContractFunction("isOk()"), encodeArgs(true));
///     // ABI_CHECK(callContractFunction("ok()"), encodeArgs(true));
///     //
///     // compileAndRun(sourceCode, 0, "fix_init");
///     // ABI_CHECK(callContractFunction("isOk()"), encodeArgs(false));
///     // ABI_CHECK(callContractFunction("ok()"), encodeArgs(false));
contract init {
	function isOk() returns (bool) { return false; }
	bool public ok = false;
}
contract fix {
	function isOk() returns (bool) { return true; }
	bool public ok = true;
}

contract init_fix is init, fix {
	function checkOk() returns (bool) { return ok; }
}
contract fix_init is fix, init {
	function checkOk() returns (bool) { return ok; }
}

