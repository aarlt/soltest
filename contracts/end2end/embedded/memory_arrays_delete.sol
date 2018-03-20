/// @ext:soltest
/// {memory_arrays_delete}
///     // compileAndRun(sourceCode, 0, "Test");
///     //
///     // vector<u256> data(3 * 4);
///     // for (unsigned i = 0; i < 4; i++)
///     // 	for (unsigned j = 0; j < 3; j++)
///     // 	{
///     // 		u256 v = 0;
///     // 		if (!(i == 1 || (i == 3 && j == 2)))
///     // 			v = i * 0x10 + j;
///     // 		data[i * 3 + j] = v;
///     // 	}
///     // ABI_CHECK(callContractFunction("del()"), encodeArgs(data));
contract Test {
	function del() returns (uint24[3][4]) {
		uint24[3][4] memory x;
		for (uint24 i = 0; i < x.length; i ++)
			for (uint24 j = 0; j < x[i].length; j ++)
				x[i][j] = i * 0x10 + j;
		delete x[1];
		delete x[3][2];
		return x;
	}
}

