function transfer(address _to, uint _value) returns (bool) {
		require(owner == msg.sender);
		require(_value <= this.balance);
		_to.send(_value);  // fault line
		return true;
	}