function tokenOf(address _user) view public returns(uint256 _result){
		_result = DonQuixoteToken.balanceOf(_user);  // fault line
	}