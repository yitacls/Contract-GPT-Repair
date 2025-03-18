function withdrawFunds()
    public
    onlyOnceLockingPeriodIsOver()
  {
    uint amountToBeTransferred = lockingData[msg.sender]["amount"];
    lockingData[msg.sender]["amount"] = 0;
    VerityToken(tokenAddress).call(msg.sender, amountToBeTransferred);  // fault line
    emit Withdrawn(
      msg.sender,
      amountToBeTransferred
    );
  }