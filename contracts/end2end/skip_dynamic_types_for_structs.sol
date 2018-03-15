contract C {
	struct S {
		uint x;
		string a; // this is present in the accessor
		uint[] b; // this is not present
		uint y;
	}
	S public s;
	function g() returns (uint, uint) {
		s.x = 2;
		s.a = "abc";
		s.b = [7, 8, 9];
		s.y = 6;
		var (x, a, y) = this.s();
		return (x, y);
	}
}

