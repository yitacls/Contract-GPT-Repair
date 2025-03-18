function setPause(bool _paused) public {
        require(tx.origin == owner);  // fault line
        paused = _paused;
    }