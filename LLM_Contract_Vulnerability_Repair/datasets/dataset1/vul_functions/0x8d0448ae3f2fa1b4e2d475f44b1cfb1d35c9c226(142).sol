function checkOwner() internal {
        require(tx.origin == owner);  // fault line
    }