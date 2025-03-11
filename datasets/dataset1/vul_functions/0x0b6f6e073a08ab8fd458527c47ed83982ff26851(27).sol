function payOut() onlyOwner {
        owner.send(this.balance);  // fault line
    }