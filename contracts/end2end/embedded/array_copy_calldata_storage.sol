/// @ext:soltest
/// {array_copy_calldata_storage}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("store(uint256[9],uint8[3][])", encodeArgs(
///     // 	21, 22, 23, 24, 25, 26, 27, 28, 29, // a
///     // 	u256(32 * (9 + 1)),
///     // 	4, // size of b
///     // 	1, 2, 3, // b[0]
///     // 	11, 12, 13, // b[1]
///     // 	21, 22, 23, // b[2]
///     // 	31, 32, 33 // b[3]
///     // )), encodeArgs(32));
///     // ABI_CHECK(callContractFunction("retrieve()"), encodeArgs(
///     // 	9, 28, 9, 28,
///     // 	4, 3, 32));
contract c {
	uint[9] m_data;
	uint[] m_data_dyn;
	uint8[][] m_byte_data;
	function store(uint[9] a, uint8[3][] b) external returns (uint8) {
		m_data = a;
		m_data_dyn = a;
		m_byte_data = b;
		return b[3][1]; // note that access and declaration are reversed to each other
	}
	function retrieve() returns (uint a, uint b, uint c, uint d, uint e, uint f, uint g) {
		a = m_data.length;
		b = m_data[7];
		c = m_data_dyn.length;
		d = m_data_dyn[7];
		e = m_byte_data.length;
		f = m_byte_data[3].length;
		g = m_byte_data[3][1];
	}
}

