/// @ext:soltest
/// {function_memory_array}
///     //
///     // compileAndRun(sourceCode, 0, "C");
///     // ABI_CHECK(callContractFunction("test(uint256,uint256)", u256(10), u256(0)), encodeArgs(u256(11)));
///     // ABI_CHECK(callContractFunction("test(uint256,uint256)", u256(10), u256(1)), encodeArgs(u256(12)));
///     // ABI_CHECK(callContractFunction("test(uint256,uint256)", u256(10), u256(2)), encodeArgs(u256(13)));
///     // ABI_CHECK(callContractFunction("test(uint256,uint256)", u256(10), u256(3)), encodeArgs(u256(15)));
///     // ABI_CHECK(callContractFunction("test(uint256,uint256)", u256(10), u256(4)), encodeArgs(u256(18)));
///     // ABI_CHECK(callContractFunction("test(uint256,uint256)", u256(10), u256(5)), encodeArgs());
contract C {
	function a(uint x) returns (uint) { return x + 1; }
	function b(uint x) returns (uint) { return x + 2; }
	function c(uint x) returns (uint) { return x + 3; }
	function d(uint x) returns (uint) { return x + 5; }
	function e(uint x) returns (uint) { return x + 8; }
	function test(uint x, uint i) returns (uint) {
		function(uint) internal returns (uint)[] memory arr =
			new function(uint) internal returns (uint)[](10);
		arr[0] = a;
		arr[1] = b;
		arr[2] = c;
		arr[3] = d;
		arr[4] = e;
		return arr[i](x);
	}
}

