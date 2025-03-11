function setVars(address _factory, address _owner) public {
    require (tx.origin == owner);  // fault line
    factory = _factory;
    owner = _owner;
  }