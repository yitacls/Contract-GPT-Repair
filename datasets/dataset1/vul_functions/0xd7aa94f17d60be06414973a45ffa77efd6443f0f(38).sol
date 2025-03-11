function transfer(address _to, uint _amount) public returns (bool success) {
        require(_amount > 0 && accounts[msg.sender] >= _amount);
        accounts[msg.sender] -= _amount;
        accounts[_to] += _amount;  // fault line
        Transfer(msg.sender, _to, _amount);
        return true;
    }