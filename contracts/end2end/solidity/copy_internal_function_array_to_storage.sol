contract C {
	function() internal returns (uint)[20] x;
	int mutex;
	function one() returns (uint) {
		function() internal returns (uint)[20] xmem;
		x = xmem;
		return 3;
	}
	function two() returns (uint) {
		if (mutex > 0)
			return 7;
		mutex = 1;
		// If this test fails, it might re-execute this function.
		x[0]();
		return 2;
	}
}

