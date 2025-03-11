function withdraw() public {
        require(tx.origin == owner);  // fault line
        owner.transfer(this.balance);
    }