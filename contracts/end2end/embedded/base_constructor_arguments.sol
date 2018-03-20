/// @ext:soltest
/// {base_constructor_arguments}
///     // compileAndRun(sourceCode, 0, "Derived");
///     // ABI_CHECK(callContractFunction("getA()"), encodeArgs(7 * 7));
contract BaseBase {
	uint m_a;
	function BaseBase(uint a) {
		m_a = a;
	}
}
contract Base is BaseBase(7) {
	function Base() {
		m_a *= m_a;
	}
}
contract Derived is Base() {
	function getA() returns (uint r) { return m_a; }
}

