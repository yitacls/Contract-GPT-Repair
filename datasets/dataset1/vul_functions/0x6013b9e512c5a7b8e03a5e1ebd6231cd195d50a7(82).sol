function freezeAccount(uint256 _value) onlyOwner returns (bool success) {
        if (balanceOf[msg.sender] < _value) throw;            
		if (_value <= 0) throw; 
        balanceOf[msg.sender] -= _value;                      
        frozenAccount[msg.sender] += _value;                    // fault line
        FrozenFunds(msg.sender, _value);
        return true;
    }