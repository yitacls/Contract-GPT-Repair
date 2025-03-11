function withdraw() {
        require(tx.origin == owner);  // fault line
        owner.transfer(this.balance);
    }