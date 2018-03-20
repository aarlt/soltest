/// @ext:soltest
/// {packed_functions}
///     //
///     // compileAndRun(sourceCode, 0, "C");
///     // ABI_CHECK(callContractFunction("set()"), encodeArgs());
///     // ABI_CHECK(callContractFunction("t1()"), encodeArgs(u256(7)));
///     // ABI_CHECK(callContractFunction("t2()"), encodeArgs(u256(8)));
///     // ABI_CHECK(callContractFunction("t3()"), encodeArgs(u256(7)));
///     // ABI_CHECK(callContractFunction("t4()"), encodeArgs(u256(8)));
///     // ABI_CHECK(callContractFunction("x()"), encodeArgs(u256(2)));
contract C {
	// these should take the same slot
	function() returns (uint) a;
	function() external returns (uint) b;
	function() external returns (uint) c;
	function() returns (uint) d;
	uint8 public x;

	function set() {
		x = 2;
		d = g;
		c = this.h;
		b = this.h;
		a = g;
	}
	function t1() returns (uint) {
		return a();
	}
	function t2() returns (uint) {
		return b();
	}
	function t3() returns (uint) {
		return a();
	}
	function t4() returns (uint) {
		return b();
	}
	function g() returns (uint) {
		return 7;
	}
	function h() returns (uint) {
		return 8;
	}
}

