function sell(uint256 amount) {
    if(balanceMap[msg.sender] < amount)
      throw;
    balanceMap[msg.sender] -= amount;
    balanceMap[this] += amount;
    if(!msg.sender.send(amount*sellPrice)) // <IO_VUL>
      throw;
    else
      Transfer(msg.sender, this, amount);
  }