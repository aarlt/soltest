contract BaseBase {
	uint m_a;
	function BaseBase(uint a) {
		m_a = a;
	}
	function overridden() returns (uint r) { return 1; }
	function g() returns (uint r) { return overridden(); }
}
contract Base is BaseBase(BaseBase.g()) {
}
contract Derived is Base() {
	function getA() returns (uint r) { return m_a; }
	function overridden() returns (uint r) { return 2; }
}

