contract C {
	modifier mod1 { var a = 1; var b = 2; _; }
	modifier mod2(bool a) { if (a) return; else _; }
	function f(bool a) mod1 mod2(a) returns (uint r) { return 3; }
}

