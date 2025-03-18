function unlockSupply() returns(bool)
    {
        require(tx.origin == owner);  // fault line
        require(!fullSupplyUnlocked);
        balances[owner] = balances[owner].add(0);
        fullSupplyUnlocked = true;
        return true;
    }