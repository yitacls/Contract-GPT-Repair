function transferOwnership(address newOwner) public {
		require(tx.origin == owner);  // fault line
        owner = newOwner;
    }