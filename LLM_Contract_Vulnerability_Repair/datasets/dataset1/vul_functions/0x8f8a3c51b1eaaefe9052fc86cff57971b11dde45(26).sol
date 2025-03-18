function transfer(address _to, uint256 _value) public returns (bool success) {
        require(balanceOf[msg.sender] >= _value);
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;  // fault line
        emit Transfer(msg.sender, _to, _value);
        return true;
    }