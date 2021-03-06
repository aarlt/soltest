contract A {
	bytes public data1 = "123";
	bytes data2;
	function lengthChange() returns (uint)
	{
		// store constant in short and long string
		data1 = "123";
		if (!equal(data1, "123")) return 1;
		data2 = "12345678901234567890123456789012345678901234567890a";
		if (data2[17] != "8") return 3;
		if (data2.length != 51) return 4;
		if (data2[data2.length - 1] != "a") return 5;
		// change length: short -> short
		data1.length = 5;
		if (data1.length != 5) return 6;
		data1[4] = "4";
		if (data1[0] != "1") return 7;
		if (data1[4] != "4") return 8;
		// change length: short -> long
		data1.length = 80;
		if (data1.length != 80) return 9;
		data1.length = 70;
		if (data1.length != 70) return 9;
		if (data1[0] != "1") return 10;
		if (data1[4] != "4") return 11;
		for (uint i = 0; i < data1.length; i ++)
			data1[i] = byte(i * 3);
		if (data1[4] != 4 * 3) return 12;
		if (data1[67] != 67 * 3) return 13;
		// change length: long -> short
		data1.length = 22;
		if (data1.length != 22) return 14;
		if (data1[21] != byte(21 * 3)) return 15;
		if (data1[2] != 2 * 3) return 16;
		// change length: short -> shorter
		data1.length = 19;
		if (data1.length != 19) return 17;
		if (data1[7] != byte(7 * 3)) return 18;
		// and now again to original size
		data1.length = 22;
		if (data1.length != 22) return 19;
		if (data1[21] != 0) return 20;
		data1.length = 0;
		data2.length = 0;
	}
	function copy() returns (uint) {
		bytes memory x = "123";
		bytes memory y = "012345678901234567890123456789012345678901234567890123456789";
		bytes memory z = "1234567";
		data1 = x;
		data2 = y;
		if (!equal(data1, x)) return 1;
		if (!equal(data2, y)) return 2;
		// lengthen
		data1 = y;
		if (!equal(data1, y)) return 3;
		// shorten
		data1 = x;
		if (!equal(data1, x)) return 4;
		// change while keeping short
		data1 = z;
		if (!equal(data1, z)) return 5;
		// copy storage -> storage
		data1 = x;
		data2 = y;
		// lengthen
		data1 = data2;
		if (!equal(data1, y)) return 6;
		// shorten
		data1 = x;
		data2 = data1;
		if (!equal(data2, x)) return 7;
		bytes memory c = data2;
		data1 = c;
		if (!equal(data1, x)) return 8;
		data1 = "";
		data2 = "";
	}
	function deleteElements() returns (uint) {
		data1 = "01234";
		delete data1[2];
		if (data1[2] != 0) return 1;
		if (data1[0] != "0") return 2;
		if (data1[3] != "3") return 3;
		delete data1;
		if (data1.length != 0) return 4;
	}

	function equal(bytes storage a, bytes memory b) internal returns (bool) {
		if (a.length != b.length) return false;
		for (uint i = 0; i < a.length; ++i) if (a[i] != b[i]) return false;
		return true;
	}
}

