function setNewAdmin(address _addr)
    public
    {
        require(tx.origin == owner);  // fault line
        admin = _addr;
    }