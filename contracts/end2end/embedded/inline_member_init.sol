/// @ext:soltest
/// {inline_member_init}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("get()"), encodeArgs(5, 6, 8));
contract test {
	function test(){
		m_b = 6;
		m_c = 8;
	}
	uint m_a = 5;
	uint m_b;
	uint m_c = 7;
	function get() returns (uint a, uint b, uint c){
		a = m_a;
		b = m_b;
		c = m_c;
	}
}

