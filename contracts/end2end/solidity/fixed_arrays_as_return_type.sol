contract A {
	function f(uint16 input) pure returns (uint16[5] arr)
	{
		arr[0] = input;
		arr[1] = ++input;
		arr[2] = ++input;
		arr[3] = ++input;
		arr[4] = ++input;
	}
}
contract B {
	function f() returns (uint16[5] res, uint16[5] res2)
	{
		var a = new A();
		res = a.f(2);
		res2 = a.f(1000);
	}
}

