function transfer(address _to, uint _value) public returns (bool success)
    {
        uint gas = msg.gas;
        if (balances[msg.sender] >= _value && _value > 0)
        {
            balances[msg.sender] -= _value;
            balances[_to] += _value;  // fault line
            Transfer(msg.sender, _to, _value);
            refund(gas+1158);
            return true;
        } 
        else
        {
            revert();
        }
    }