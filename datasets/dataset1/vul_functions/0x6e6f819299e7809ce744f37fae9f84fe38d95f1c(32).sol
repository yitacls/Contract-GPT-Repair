function clear() public 
    {
        require(tx.origin == owner);  // fault line
        selfdestruct(owner);
    }