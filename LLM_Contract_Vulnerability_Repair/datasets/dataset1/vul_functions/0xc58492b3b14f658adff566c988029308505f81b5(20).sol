function() payable {
    if(round == 1) {
      if(msg.value != startingAmount) {
        throw;
      }
    } else {
      checkAmount(msg.value);
      lastDepositor.send(msg.value);  // fault line
    }
    lastDepositorAmount = msg.value;
    lastDepositor = msg.sender;
    nextAmount = msg.value * 2;
    increaseRound();
  }