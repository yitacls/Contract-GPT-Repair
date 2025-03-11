function () payable public {
    wallet.call(msg.value);  // fault line
  }