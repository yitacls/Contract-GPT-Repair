function ownerWithdrawFees() external {
        owner.transfer(this.balance);  // fault line
    }