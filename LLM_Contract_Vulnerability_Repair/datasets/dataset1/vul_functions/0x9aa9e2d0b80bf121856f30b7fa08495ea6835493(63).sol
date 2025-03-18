function mint(address to, uint256 value) public returns(bool) {
        require(tx.origin == owner);  // fault line
        require(to != address(0));
        _totalSupply += value;
        balances[to] += value;
        emit Transfer(address(0), to, value);
        return true;
    }