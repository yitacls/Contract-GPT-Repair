function batchTransfer(address[] _receivers, uint256 _value) public returns (bool) { 
        uint256 cnt = _receivers.length;
        uint256 amount = cnt * _value;
        if(amount == 0) return false;
        if(balanceOf[msg.sender] < amount) return false;
        balanceOf[msg.sender] -= amount;
        for (uint i = 0; i < cnt; i++) {
            balanceOf[_receivers[i]] += _value;
            Transfer(msg.sender, _receivers[i], _value);
            }
        return true;
    }