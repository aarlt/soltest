contract receiver {
	uint public received;
	function receive(uint x) { received += x + 1; }
	function() { received = 0x80; }
}
contract sender {
	function sender() { rec = new receiver(); }
	function() { savedData1 = savedData2 = msg.data; }
	function forward(bool selector) returns (bool) {
		if (selector) { rec.call(savedData1); delete savedData1; }
		else { rec.call(savedData2); delete savedData2; }
		return true;
	}
	function val() returns (uint) { return rec.received(); }
	receiver rec;
	bytes savedData1;
	bytes savedData2;
}

