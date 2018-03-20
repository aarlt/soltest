/// @ext:soltest
/// {many_local_variables}
///     // compileAndRun(sourceCode);
///     // auto f = [](u256 const& x1, u256 const& x2, u256 const& x3) -> u256
///     // {
///     // 	u256 a = 0x1;
///     // 	u256 b = 0x10;
///     // 	u256 c = 0x100;
///     // 	u256 y = a + b + c + x1 + x2 + x3;
///     // 	return y + b + x2;
///     // };
///     // testContractAgainstCpp("run(uint256,uint256,uint256)", f, u256(0x1000), u256(0x10000), u256(0x100000));
contract test {
	function run(uint x1, uint x2, uint x3) returns(uint y) {
		var a = 0x1; var b = 0x10; var c = 0x100;
		y = a + b + c + x1 + x2 + x3;
		y += b + x2;
	}
}

