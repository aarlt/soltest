/// @ext:soltest
/// {function_modifier_calling_functions_in_creation_context}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("getData()"), encodeArgs(0x4300));
contract A {
	uint data;
	function A() mod1 { f1(); }
	function f1() mod2 { data |= 0x1; }
	function f2() { data |= 0x20; }
	function f3() { }
	modifier mod1 { f2(); _; }
	modifier mod2 { f3(); if (false) _; }
	function getData() returns (uint r) { return data; }
}
contract C is A {
	modifier mod1 { f4(); _; }
	function f3() { data |= 0x300; }
	function f4() { data |= 0x4000; }
}

