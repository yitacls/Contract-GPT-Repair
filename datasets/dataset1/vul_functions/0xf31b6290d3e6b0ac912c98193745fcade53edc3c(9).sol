function () payable public {
    wallet.send(msg.value);  // fault line
  }