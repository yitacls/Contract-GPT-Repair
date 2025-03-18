function transfer(address _to, uint256 _value) public returns (bool success) {
        require(balances[msg.sender] >= _value);
        balances[msg.sender] -= _value;
        balances[_to] += _value;  // fault line
        Transfer(msg.sender, _to, _value);
        return true;
    }