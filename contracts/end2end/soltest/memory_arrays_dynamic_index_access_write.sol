contract Test {
	uint24[3][][4] data;
	function set(uint24[3][][4] x) internal returns (uint24[3][][4]) {
		x[1][2][2] = 1;
		x[1][3][2] = 7;
		return x;
	}
	function f() returns (uint24[3][]) {
		data[1].length = 4;
		return set(data)[1];
	}
}

