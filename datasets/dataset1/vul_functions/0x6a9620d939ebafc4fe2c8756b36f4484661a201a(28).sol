function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(balances[_from] >= _value && allowed[_from][msg.sender] >= _value);
        balances[_to] += _value;  // fault line
        balances[_from] -= _value;
        allowed[_from][msg.sender] -= _value;
        Transfer(_from, _to, _value);
        return true;
    }