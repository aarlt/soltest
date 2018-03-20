/// @ext:soltest
/// {evm_exceptions_out_of_band_access}
///     // compileAndRun(sourceCode, 0, "A");
///     // ABI_CHECK(callContractFunction("test()"), encodeArgs(false));
///     // ABI_CHECK(callContractFunction("testIt()"), encodeArgs());
///     // ABI_CHECK(callContractFunction("test()"), encodeArgs(false));
contract A {
	uint[3] arr;
	bool public test = false;
	function getElement(uint i) returns (uint)
	{
		return arr[i];
	}
	function testIt() returns (bool)
	{
		uint i = this.getElement(5);
		test = true;
		return true;
	}
}

