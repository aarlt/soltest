contract test {
	function fixedBytes() returns(bytes32 ret) {
		return "abc\x00\xff__";
	}
	function pipeThrough(bytes2 small, bool one) returns(bytes16 large, bool oneRet) {
		oneRet = one;
		large = small;
	}
}

