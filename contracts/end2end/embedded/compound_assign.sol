/// @ext:soltest
/// {compound_assign}
///     // compileAndRun(sourceCode);
///     //
///     // u256 value1;
///     // u256 value2;
///     // auto f = [&](u256 const& _x, u256 const& _y) -> u256
///     // {
///     // 	u256 value3 = _y;
///     // 	value1 += _x;
///     // 	value3 *= _x;
///     // 	value2 *= value3 + value1;
///     // 	return value2 += 7;
///     // };
///     // testContractAgainstCpp("f(uint256,uint256)", f, u256(0), u256(6));
///     // testContractAgainstCpp("f(uint256,uint256)", f, u256(1), u256(3));
///     // testContractAgainstCpp("f(uint256,uint256)", f, u256(2), u256(25));
///     // testContractAgainstCpp("f(uint256,uint256)", f, u256(3), u256(69));
///     // testContractAgainstCpp("f(uint256,uint256)", f, u256(4), u256(84));
///     // testContractAgainstCpp("f(uint256,uint256)", f, u256(5), u256(2));
///     // testContractAgainstCpp("f(uint256,uint256)", f, u256(6), u256(51));
///     // testContractAgainstCpp("f(uint256,uint256)", f, u256(7), u256(48));
contract test {
	uint value1;
	uint value2;
	function f(uint x, uint y) returns (uint w) {
		uint value3 = y;
		value1 += x;
		value3 *= x;
		value2 *= value3 + value1;
		return value2 += 7;
	}
}

