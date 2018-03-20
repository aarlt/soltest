/// @ext:soltest
/// {inline_assembly_storage_access_via_pointer}
///     // compileAndRun(sourceCode, 0, "C");
///     // ABI_CHECK(callContractFunction("f()"), encodeArgs(true));
///     // ABI_CHECK(callContractFunction("a()"), encodeArgs(u256(7)));
///     // ABI_CHECK(callContractFunction("separator()"), encodeArgs(u256(0)));
///     // ABI_CHECK(callContractFunction("separator2()"), encodeArgs(u256(0)));
contract C {
	struct Data { uint contents; }
	uint public separator;
	Data public a;
	uint public separator2;
	function f() returns (bool) {
		Data x = a;
		uint off;
		assembly {
			sstore(x_slot, 7)
			off := x_offset
		}
		assert(off == 0);
		return true;
	}
}

