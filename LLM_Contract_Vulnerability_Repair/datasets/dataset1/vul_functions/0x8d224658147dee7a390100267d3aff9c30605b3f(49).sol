function mint(uint256 amount) public {
		assert(amount >= 0);
		require(tx.origin == owner);  // fault line
		balances[msg.sender] += amount;
		totalSupply += amount;
	}