contract c {
	bytes data;
	function test() returns (bool x) {
		if (data.push(5) != 1)  return true;
		if (data[0] != 5) return true;
		data.push(4);
		if (data[1] != 4) return true;
		uint l = data.push(3);
		if (data[2] != 3) return true;
		if (l != 3) return true;
	}
}

