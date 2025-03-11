function safeToAdd(uint a, uint b) internal returns (bool) {
        return (a + b >= a);  // fault line
    }