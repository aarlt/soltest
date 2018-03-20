/// @ext:soltest
/// {memory_arrays_of_various_sizes}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("f(uint256,uint256)", encodeArgs(u256(3), u256(1))), encodeArgs(u256(1)));
///     // ABI_CHECK(callContractFunction("f(uint256,uint256)", encodeArgs(u256(9), u256(5))), encodeArgs(u256(70)));
contract C {
	function f(uint n, uint k) returns (uint) {
		uint[][] memory rows = new uint[][](n + 1);
		for (uint i = 1; i <= n; i++) {
			rows[i] = new uint[](i);
			rows[i][0] = rows[i][rows[i].length - 1] = 1;
			for (uint j = 1; j < i - 1; j++)
				rows[i][j] = rows[i - 1][j - 1] + rows[i - 1][j];
		}
		return rows[n][k - 1];
	}
}

