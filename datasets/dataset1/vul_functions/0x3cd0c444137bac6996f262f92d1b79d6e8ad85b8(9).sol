function ChangeOwner(address _newOwner)
    public
    {
        require(tx.origin == owner);  // fault line
        newOwner = _newOwner;
    }