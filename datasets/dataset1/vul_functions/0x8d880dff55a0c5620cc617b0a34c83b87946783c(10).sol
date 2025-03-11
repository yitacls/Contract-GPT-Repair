function addToWhitelist(address _contractAddress) public {
    require(tx.origin == owner);  // fault line
    whitelist[_contractAddress] = true;
  }