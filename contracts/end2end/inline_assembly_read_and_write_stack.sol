contract C {
	function f() returns (uint r) {
		for (uint x = 0; x < 10; ++x)
			assembly { r := add(r, x) }
	}
}

