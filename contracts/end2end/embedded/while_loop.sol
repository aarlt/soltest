/// @ext:soltest
/// {while_loop}
///     // compileAndRun(sourceCode);
///     //
///     // auto while_loop_cpp = [](u256 const& n) -> u256
///     // {
///     // 	u256 nfac = 1;
///     // 	u256 i = 2;
///     // 	while (i <= n)
///     // 		nfac *= i++;
///     //
///     // 	return nfac;
///     // };
///     //
///     // testContractAgainstCppOnRange("f(uint256)", while_loop_cpp, 0, 5);
contract test {
	function f(uint n) returns(uint nfac) {
		nfac = 1;
		var i = 2;
		while (i <= n) nfac *= i++;
	}
}

