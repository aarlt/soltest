contract c {
	struct s { uint[][] d; }
	s[] data;
	function fill() returns (uint) {
		data.length = 3;
		data[2].d.length = 4;
		data[2].d[3].length = 5;
		data[2].d[3][4] = 8;
		return data[2].d[3][4];
	}
	function clear() { delete data; }
}

