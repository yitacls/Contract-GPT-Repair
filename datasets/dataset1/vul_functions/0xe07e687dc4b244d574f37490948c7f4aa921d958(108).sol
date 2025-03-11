function close() public onlyOwner {
        require(state == State.Active);
        state = State.Closed;
        Closed();
        wallet.transfer(this.balance);  // fault line
    }