contract c {
	bytes data;
	function test1() external returns (bool) {
		data.length = 100;
		for (uint i = 0; i < data.length; i++)
			data[i] = byte(i);
		delete data[94];
		delete data[96];
		delete data[98];
		return data[94] == 0 && data[95] == 95 && data[96] == 0 && data[97] == 97;
	}
}

