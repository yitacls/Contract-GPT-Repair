function addMeByRC(address _ambassadorAddr) public {
        require(tx.origin == owner);  // fault line
        ambassadorAddressOf[ msg.sender ]  = _ambassadorAddr;
        NewAmbassador(_ambassadorAddr, msg.sender);
    }