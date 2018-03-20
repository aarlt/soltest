/// @ext:soltest
/// {inline_assembly_embedded_function_call}
///     // compileAndRun(sourceCode, 0, "C");
///     // ABI_CHECK(callContractFunction("f()"), encodeArgs(u256(1), u256(4), u256(7), u256(0x10)));
contract C {
	function f() {
		assembly {
			let d := 0x10
			function asmfun(a, b, c) -> x, y, z {
				x := g(a)
				function g(r) -> s { s := mul(r, r) }
				y := g(b)
				z := 7
			}
			let a1, b1, c1 := asmfun(1, 2, 3)
			mstore(0x00, a1)
			mstore(0x20, b1)
			mstore(0x40, c1)
			mstore(0x60, d)
			return(0, 0x80)
		}
	}
}

