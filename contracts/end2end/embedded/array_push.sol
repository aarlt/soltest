/// @ext:soltest
/// {array_push}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("test()"), encodeArgs(5, 4, 3, 3));
contract c {
	uint[] data;
	function test() returns (uint x, uint y, uint z, uint l) {
		data.push(5);
		x = data[0];
		data.push(4);
		y = data[1];
		l = data.push(3);
		z = data[2];
	}
}

