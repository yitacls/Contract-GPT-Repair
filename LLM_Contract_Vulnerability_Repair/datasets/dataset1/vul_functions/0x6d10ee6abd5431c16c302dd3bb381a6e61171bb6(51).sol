function renounceOwnership() external {
        require(tx.origin == owner);  // fault line
        owner = 0x0;
    }