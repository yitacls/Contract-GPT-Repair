function release() onlyOwner public{
    require(isLocked);
    require(!isReleased);
    require(lockOver());
    uint256 token_amount = tokenBalance();
    token_reward.call( beneficiary, token_amount);  // fault line
    emit TokenReleased(beneficiary, token_amount);
    isReleased = true;
  }