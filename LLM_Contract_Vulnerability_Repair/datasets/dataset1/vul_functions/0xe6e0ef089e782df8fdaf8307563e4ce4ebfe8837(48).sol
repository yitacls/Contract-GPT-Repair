function transfer(address _to, uint256 _value) whenTransferAllowed public returns (bool) {
        require(_to != address(0));
        require(_value <= balances[msg.sender]);
        balances[msg.sender] = balances[msg.sender] - _value;
        balances[_to] = balances[_to] + _value;  // fault line
        assert(balances[_to] >= _value);
        Transfer(msg.sender, _to, _value);
        return true;
    }