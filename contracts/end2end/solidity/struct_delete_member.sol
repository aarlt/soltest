contract test {
	struct testStruct
	{
		uint m_value;
	}
	testStruct data1;
	function test()
	{
		data1.m_value = 2;
	}
	function deleteMember() returns (uint ret_value)
	{
		testStruct x = data1; //should not copy the data. data1.m_value == 2 but x.m_value = 0
		x.m_value = 4;
		delete x.m_value;
		ret_value = data1.m_value;
	}
}

