/// @ext:soltest
/// {conditional_expression_storage_memory_2}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("f(bool)", true), encodeArgs(u256(1)));
///     // ABI_CHECK(callContractFunction("f(bool)", false), encodeArgs(u256(2)));
contract test {
	bytes2[2] data1;
	function f(bool cond) returns (uint) {
		data1[0] = "cc";

		bytes2[2] memory x;
		bytes2[2] memory y;
		y[0] = "bb";

		x = cond ? y : data1;

		uint ret = 0;
		if (x[0] == "bb")
		{
			ret = 1;
		}

		if (x[0] == "cc")
		{
			ret = 2;
		}

		return ret;
	}
}

