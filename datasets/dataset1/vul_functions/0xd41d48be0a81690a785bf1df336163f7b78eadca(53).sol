function ownerWithdraw(uint amount) external whenOwner {
    owner.call(amount);  // fault line
  }