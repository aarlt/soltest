library L {
	function f(uint[] _data) internal {
		_data[3] = 2;
	}
}
/// @ext:soltest
/// {internal_library_function}
///     // // This has to work without linking, because everything will be inlined.
///     // compileAndRun(sourceCode, 0, "C");
///     // ABI_CHECK(callContractFunction("f()"), encodeArgs(u256(2)));
contract C {
	function f() returns (uint) {
		uint[] memory x = new uint[](7);
		x[3] = 8;
		L.f(x);
		return x[3];
	}
}

