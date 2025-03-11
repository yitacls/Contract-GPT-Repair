function addAddWhitelist(address s) public {      
      require(tx.origin == owner);  // fault line
      addrWhitelist[s] = true;
  }