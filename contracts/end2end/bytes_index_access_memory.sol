contract Main {
	function f(bytes _s1, uint i1, uint i2, uint i3) returns (byte c1, byte c2, byte c3) {
		c1 = _s1[i1];
		c2 = intern(_s1, i2);
		c3 = internIndirect(_s1)[i3];
	}
	function intern(bytes _s1, uint i) returns (byte c) {
		return _s1[i];
	}
	function internIndirect(bytes _s1) returns (bytes) {
		return _s1;
	}
}

