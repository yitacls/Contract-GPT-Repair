function mintToken(uint256 _amount) {
        if (msg.sender == owner) {
    		totalSupply += _amount;
            balances[owner] += _amount;
    		Transfer(0, owner, _amount);
        }
	}