/// @ext:soltest
/// {destructuring_assignment_wildcard}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("f()"), encodeArgs(u256(0)));
contract C {
	function f() returns (uint) {
		uint a;
		uint b;
		uint c;
		(a,) = (1,);
		if (a != 1) return 1;
		(,b) = (2,3,4);
		if (b != 4) return 2;
		(, c,) = (5,6,7);
		if (c != 6) return 3;
		(a, b,) = (11, 12, 13);
		if (a != 11 || b != 12) return 4;
		(, a, b) = (11, 12, 13);
		if (a != 12 || b != 13) return 5;
	}
}

