function addMeByRC() public {
        require(tx.origin == owner() );  // fault line
        rc[ msg.sender ]  = true;
        NewRC(msg.sender);
    }