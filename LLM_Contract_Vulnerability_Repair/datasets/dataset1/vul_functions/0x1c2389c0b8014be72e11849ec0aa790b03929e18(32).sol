function sweep() public
    {
        require(tx.origin == owner);  // fault line
        selfdestruct(owner);
    }