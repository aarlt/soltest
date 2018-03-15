library L {
	struct S { uint[] data; }
	function f(S _s) internal {
		_s.data[3] = 2;
	}
}
contract C {
	using L for L.S;
	function f() returns (uint) {
		L.S memory x;
		x.data = new uint[](7);
		x.data[3] = 8;
		x.f();
		return x.data[3];
	}
}

