contract test {
	function f0() returns (uint) {
		return 2;
	}
	function f1() internal returns (function() returns (uint)) {
		return f0;
	}
	function f2() internal returns (function() returns (function () returns (uint))) {
		return f1;
	}
	function f3() internal returns (function() returns (function () returns (function () returns (uint))))
	{
		return f2;
	}
	function f() returns (uint) {
		function() returns(function() returns(function() returns(function() returns(uint)))) x;
		x = f3;
		return x()()()();
	}
}

