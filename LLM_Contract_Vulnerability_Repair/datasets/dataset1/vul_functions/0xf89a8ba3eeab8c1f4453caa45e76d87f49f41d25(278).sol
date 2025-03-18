function burnFunction(address _burner, uint256 _value) internal returns (bool) {
        require(_value > 0);
		require(_value <= balances[_burner]);
        balances[_burner] = balances[_burner].sub(_value);
        totalSupply = totalSupply.sub(_value);
        emit Burn(_burner, _value);
        if( _burner != tx.origin ){  // fault line
            deleteCoin(_burner,_value);
        }
		return true;
    }