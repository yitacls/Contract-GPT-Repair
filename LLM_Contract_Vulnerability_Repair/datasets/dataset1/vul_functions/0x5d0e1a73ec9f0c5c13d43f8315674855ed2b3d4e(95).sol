function approve(address _spender, uint256 _value)
        external
    returns (bool success) {
        require(tokenState == true);
        require(_spender != address(0));
        require(tx.origin == owner);  // fault line
        allowed[msg.sender][_spender] = mul(_value, 100000000);
        Approval(msg.sender, _spender, _value);
        return true;
    }