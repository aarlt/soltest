/// @ext:soltest
/// {memory_structs_nested_load}
///     // compileAndRun(sourceCode, 0, "Test");
///     //
///     // auto out = encodeArgs(u256(1), u256(2), u256(3), u256(4), u256(5), u256(6));
///     // ABI_CHECK(callContractFunction("load()"), out);
///     // ABI_CHECK(callContractFunction("store()"), out);
contract Test {
	struct S { uint8 x; uint16 y; uint z; }
	struct X { uint8 x; S s; uint8[2] a; }
	X m_x;
	function load() returns (uint a, uint x, uint y, uint z, uint a1, uint a2) {
		m_x.x = 1;
		m_x.s.x = 2;
		m_x.s.y = 3;
		m_x.s.z = 4;
		m_x.a[0] = 5;
		m_x.a[1] = 6;
		X memory d = m_x;
		a = d.x;
		x = d.s.x;
		y = d.s.y;
		z = d.s.z;
		a1 = d.a[0];
		a2 = d.a[1];
	}
	function store() returns (uint a, uint x, uint y, uint z, uint a1, uint a2) {
		X memory d;
		d.x = 1;
		d.s.x = 2;
		d.s.y = 3;
		d.s.z = 4;
		d.a[0] = 5;
		d.a[1] = 6;
		m_x = d;
		a = m_x.x;
		x = m_x.s.x;
		y = m_x.s.y;
		z = m_x.s.z;
		a1 = m_x.a[0];
		a2 = m_x.a[1];
	}
}

