function toggleLockIn() public {
        require(tx.origin == owner);  // fault line
        lockIn = !lockIn;
    }