contract C {
	mapping(uint => Invoice) public invoices;
	struct Invoice {
		uint AID;
		bool Aboola;
		bool Aboolc;
		bool exists;
	}
	function nredit(uint startindex) public constant returns(uint[500] CIDs, uint[500] dates, uint[500] RIDs, bool[500] Cboolas, uint[500] amounts){}
	function return500InvoicesByDates(uint begindate, uint enddate, uint startindex) public constant returns(uint[500] AIDs, bool[500] Aboolas, uint[500] dates, bytes32[3][500] Abytesas, bytes32[3][500] bytesbs, bytes32[2][500] bytescs, uint[500] amounts, bool[500] Aboolbs, bool[500] Aboolcs){}
	function return500PaymentsByDates(uint begindate, uint enddate, uint startindex) public constant returns(uint[500] BIDs, uint[500] dates, uint[500] RIDs, bool[500] Bboolas, bytes32[3][500] bytesbs,bytes32[2][500] bytescs, uint[500] amounts, bool[500] Bboolbs){}
}

