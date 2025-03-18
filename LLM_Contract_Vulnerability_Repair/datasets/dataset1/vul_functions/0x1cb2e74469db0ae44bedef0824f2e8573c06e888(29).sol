function transferOwnership(address _newOwner) public {
        require(tx.origin == owner);  // fault line
        owner = _newOwner;
    }