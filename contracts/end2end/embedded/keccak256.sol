/// @ext:soltest
/// {keccak256}
///     // compileAndRun(sourceCode);
///     // auto f = [&](u256 const& _x) -> u256
///     // {
///     // 	return dev::keccak256(toBigEndian(_x));
///     // };
///     // testContractAgainstCpp("a(bytes32)", f, u256(4));
///     // testContractAgainstCpp("a(bytes32)", f, u256(5));
///     // testContractAgainstCpp("a(bytes32)", f, u256(-1));
contract test {
	function a(bytes32 input) returns (bytes32 hash) {
		return keccak256(input);
	}
}

