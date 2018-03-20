/// @ext:soltest
/// {mapping_state}
///     // compileAndRun(sourceCode);
///     // class Ballot
///     // {
///     // public:
///     // 	u256 getVoteCount(u160 _address) { return m_voteCount[_address]; }
///     // 	void grantVoteRight(u160 _address) { m_canVote[_address] = true; }
///     // 	bool vote(u160 _voter, u160 _vote)
///     // 	{
///     // 		if (!m_canVote[_voter] || m_voted[_voter]) return false;
///     // 		m_voted[_voter] = true;
///     // 		m_voteCount[_vote]++;
///     // 		return true;
///     // 	}
///     // private:
///     // 	map<u160, bool> m_canVote;
///     // 	map<u160, u256> m_voteCount;
///     // 	map<u160, bool> m_voted;
///     // } ballot;
///     //
///     // auto getVoteCount = bind(&Ballot::getVoteCount, &ballot, _1);
///     // auto grantVoteRight = bind(&Ballot::grantVoteRight, &ballot, _1);
///     // auto vote = bind(&Ballot::vote, &ballot, _1, _2);
///     // testContractAgainstCpp("getVoteCount(address)", getVoteCount, u160(0));
///     // testContractAgainstCpp("getVoteCount(address)", getVoteCount, u160(1));
///     // testContractAgainstCpp("getVoteCount(address)", getVoteCount, u160(2));
///     // // voting without vote right should be rejected
///     // testContractAgainstCpp("vote(address,address)", vote, u160(0), u160(2));
///     // testContractAgainstCpp("getVoteCount(address)", getVoteCount, u160(0));
///     // testContractAgainstCpp("getVoteCount(address)", getVoteCount, u160(1));
///     // testContractAgainstCpp("getVoteCount(address)", getVoteCount, u160(2));
///     // // grant vote rights
///     // testContractAgainstCpp("grantVoteRight(address)", grantVoteRight, u160(0));
///     // testContractAgainstCpp("grantVoteRight(address)", grantVoteRight, u160(1));
///     // // vote, should increase 2's vote count
///     // testContractAgainstCpp("vote(address,address)", vote, u160(0), u160(2));
///     // testContractAgainstCpp("getVoteCount(address)", getVoteCount, u160(0));
///     // testContractAgainstCpp("getVoteCount(address)", getVoteCount, u160(1));
///     // testContractAgainstCpp("getVoteCount(address)", getVoteCount, u160(2));
///     // // vote again, should be rejected
///     // testContractAgainstCpp("vote(address,address)", vote, u160(0), u160(1));
///     // testContractAgainstCpp("getVoteCount(address)", getVoteCount, u160(0));
///     // testContractAgainstCpp("getVoteCount(address)", getVoteCount, u160(1));
///     // testContractAgainstCpp("getVoteCount(address)", getVoteCount, u160(2));
///     // // vote without right to vote
///     // testContractAgainstCpp("vote(address,address)", vote, u160(2), u160(1));
///     // testContractAgainstCpp("getVoteCount(address)", getVoteCount, u160(0));
///     // testContractAgainstCpp("getVoteCount(address)", getVoteCount, u160(1));
///     // testContractAgainstCpp("getVoteCount(address)", getVoteCount, u160(2));
///     // // grant vote right and now vote again
///     // testContractAgainstCpp("grantVoteRight(address)", grantVoteRight, u160(2));
///     // testContractAgainstCpp("vote(address,address)", vote, u160(2), u160(1));
///     // testContractAgainstCpp("getVoteCount(address)", getVoteCount, u160(0));
///     // testContractAgainstCpp("getVoteCount(address)", getVoteCount, u160(1));
///     // testContractAgainstCpp("getVoteCount(address)", getVoteCount, u160(2));
contract Ballot {
	mapping(address => bool) canVote;
	mapping(address => uint) voteCount;
	mapping(address => bool) voted;
	function getVoteCount(address addr) returns (uint retVoteCount) {
		return voteCount[addr];
	}
	function grantVoteRight(address addr) {
		canVote[addr] = true;
	}
	function vote(address voter, address vote) returns (bool success) {
		if (!canVote[voter] || voted[voter]) return false;
		voted[voter] = true;
		voteCount[vote] = voteCount[vote] + 1;
		return true;
	}
}

