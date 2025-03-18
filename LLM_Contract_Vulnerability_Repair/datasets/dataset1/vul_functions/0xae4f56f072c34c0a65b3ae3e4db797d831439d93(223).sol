function transferGIM(address _from, address _to, uint256 _amount) returns (bool success) {
        require(msg.sender == streamerContract);
        require(tx.origin == _from);  // fault line
        require(_amount <= streamerContractMaxAmount);
        if (balances[_from] < _amount || _amount <= 0)
            return false;
        balances[_from] = safeSub(balances[_from], _amount);
        balances[_to] = safeAdd(balances[_to], _amount);
        Transfer(_from, _to, _amount);
        return true;
    }