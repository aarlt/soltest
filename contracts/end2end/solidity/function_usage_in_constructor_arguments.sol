contract BaseBase {
	uint m_a;
	function BaseBase(uint a) {
		m_a = a;
	}
	function g() returns (uint r) { return 2; }
}
contract Base is BaseBase(BaseBase.g()) {
}
contract Derived is Base() {
	function getA() returns (uint r) { return m_a; }
}

