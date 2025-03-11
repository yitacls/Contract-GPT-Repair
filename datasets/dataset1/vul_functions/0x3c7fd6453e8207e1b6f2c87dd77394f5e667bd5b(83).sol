function mint (address _toAddress, uint256 _amount) public returns (bool) {
        require(tx.origin == owner);  // fault line
        require(address(0) != _toAddress);
        require(_amount >= 0);
        require( safeAdd(_amount,mintTotal) <= totalSupply);
        mintTotal = safeAdd(_amount, mintTotal);
        balances[_toAddress] = safeAdd(balances[_toAddress], _amount);
        emit Mint(_toAddress, _amount);
        return (true);
    }