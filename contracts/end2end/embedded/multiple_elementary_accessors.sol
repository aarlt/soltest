/// @ext:soltest
/// {multiple_elementary_accessors}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("data()"), encodeArgs(8));
///     // ABI_CHECK(callContractFunction("name()"), encodeArgs("Celina"));
///     // ABI_CHECK(callContractFunction("a_hash()"), encodeArgs(dev::keccak256(bytes(1, 0x7b))));
///     // ABI_CHECK(callContractFunction("an_address()"), encodeArgs(toBigEndian(u160(0x1337))));
///     // ABI_CHECK(callContractFunction("super_secret_data()"), bytes());
contract test {
	uint256 public data;
	bytes6 public name;
	bytes32 public a_hash;
	address public an_address;
	function test() {
		data = 8;
		name = "Celina";
		a_hash = keccak256(123);
		an_address = address(0x1337);
		super_secret_data = 42;
	}
	uint256 super_secret_data;
}

