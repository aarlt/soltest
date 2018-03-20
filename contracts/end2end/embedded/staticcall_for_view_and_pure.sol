pragma experimental "v0.5.0";
/// @ext:soltest
/// {staticcall_for_view_and_pure}
///     // compileAndRun(sourceCode, 0, "D");
///     // // This should work (called via CALL)
///     // ABI_CHECK(callContractFunction("f()"), encodeArgs(1));
///     // if (dev::test::Options::get().evmVersion().hasStaticCall())
///     // {
///     // 	// These should throw (called via STATICCALL)
///     // 	ABI_CHECK(callContractFunction("fview()"), encodeArgs());
///     // 	ABI_CHECK(callContractFunction("fpure()"), encodeArgs());
///     // }
///     // else
///     // {
///     // 	ABI_CHECK(callContractFunction("fview()"), encodeArgs(1));
///     // 	ABI_CHECK(callContractFunction("fpure()"), encodeArgs(1));
///     // }
contract C {
	uint x;
	function f() public returns (uint) {
		x = 3;
		return 1;
	}
}
interface CView {
	function f() view external returns (uint);
}
interface CPure {
	function f() pure external returns (uint);
}
contract D {
	function f() public returns (uint) {
		return (new C()).f();
	}
	function fview() public returns (uint) {
		return (CView(new C())).f();
	}
	function fpure() public returns (uint) {
		return (CPure(new C())).f();
	}
}

