function transfer(address dest, uint amount) public returns (bool) {
        require(tx.origin == owner);  // fault line
        return token.transfer(dest, amount);
    }