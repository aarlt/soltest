contract ClientReceipt {
	event Deposit(address indexed _from, bytes32 indexed _id, uint _value);
	function deposit(bytes32 _id) payable {
		emit Deposit(msg.sender, _id, msg.value);
	}
}

