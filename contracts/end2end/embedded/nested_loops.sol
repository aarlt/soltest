/// @ext:soltest
/// {nested_loops}
///     // compileAndRun(sourceCode);
///     //
///     // auto nested_loops_cpp = [](u256 n) -> u256
///     // {
///     // 	while (n > 1)
///     // 	{
///     // 		if (n == 10)
///     // 			break;
///     // 		while (n > 5)
///     // 		{
///     // 			if (n == 8)
///     // 				break;
///     // 			n--;
///     // 			if (n == 6)
///     // 				continue;
///     // 			return n;
///     // 		}
///     // 		n--;
///     // 		if (n == 3)
///     // 			continue;
///     // 		break;
///     // 	}
///     //
///     // 	return n;
///     // };
///     //
///     // testContractAgainstCppOnRange("f(uint256)", nested_loops_cpp, 0, 12);
contract test {
	function f(uint x) returns(uint y) {
		while (x > 1) {
			if (x == 10) break;
			while (x > 5) {
				if (x == 8) break;
				x--;
				if (x == 6) continue;
				return x;
			}
			x--;
			if (x == 3) continue;
			break;
		}
		return x;
	}
}

