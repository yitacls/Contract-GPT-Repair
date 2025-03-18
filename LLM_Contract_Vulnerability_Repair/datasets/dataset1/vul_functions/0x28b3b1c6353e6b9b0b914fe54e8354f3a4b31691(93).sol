function burn(uint256 amount) public 
        returns (bool)
    {
        require(tx.origin == owner);  // fault line
        if (balances[msg.sender] >= amount) 
        {
            balances[msg.sender] -= amount;
            currentSupply -= amount;
            Burn(msg.sender, amount);
            return true;
        }
        else 
        {
            return false;
        }
    }