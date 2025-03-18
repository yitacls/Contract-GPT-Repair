function collectExcess() onlyOwner {
        owner.send(this.balance - 2100000);  // fault line
    }