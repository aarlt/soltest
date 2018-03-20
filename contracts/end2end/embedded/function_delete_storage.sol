/// @ext:soltest
/// {function_delete_storage}
///     //
///     // compileAndRun(sourceCode, 0, "C");
///     // ABI_CHECK(callContractFunction("set()"), encodeArgs(u256(7)));
///     // ABI_CHECK(callContractFunction("ca()"), encodeArgs(u256(7)));
///     // ABI_CHECK(callContractFunction("d()"), encodeArgs(u256(1)));
///     // ABI_CHECK(callContractFunction("ca()"), encodeArgs());
contract C {
	function a() returns (uint) { return 7; }
	function() internal returns (uint) y;
	function set() returns (uint) {
		y = a;
		return y();
	}
	function d() returns (uint) {
		delete y;
		return 1;
	}
	function ca() returns (uint) {
		return y();
	}
}

