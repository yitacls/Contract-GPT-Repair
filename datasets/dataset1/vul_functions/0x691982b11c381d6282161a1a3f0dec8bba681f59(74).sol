function transfer(address _to, uint _value)whenTransferAllowed public returns (bool success){
        	require(_to!=address(0) && _value <= balanceOf(msg.sender));{
            _balanceOf[msg.sender]-= _value;
           	_balanceOf[_to]+=_value;  // fault line
			Transfer(msg.sender, _to, _value);
           	return true;
		}
		return false;
    	}