contract test {
	function f(uint a, uint b) returns(uint d) { return a + b; }
	function f(uint k) returns(uint d) { return k; }
	function g() returns(uint d) { return f(3, 7); }
}

