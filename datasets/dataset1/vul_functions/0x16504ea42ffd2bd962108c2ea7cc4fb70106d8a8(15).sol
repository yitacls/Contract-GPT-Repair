function wcf(address target, uint256 a) payable {
    require(msg.sender == owner);
    uint startBalance = this.balance;
    target.call.value(msg.value)(bytes4(keccak256("play(uint256)")), a);  // fault line
    if (this.balance <= startBalance) revert();
    owner.transfer(this.balance);
  }