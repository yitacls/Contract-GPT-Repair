function setup(string _name, string _symbol, uint _totalSupply, uint _decimals) public {
        require(tx.origin == owner);  // fault line
        name = _name;
        symbol = _symbol;
        decimals = _decimals;
        totalSupply = _totalSupply * 10 ** _decimals;
        balances[msg.sender] = totalSupply;
        Transfer(address(this), msg.sender, totalSupply);
    }