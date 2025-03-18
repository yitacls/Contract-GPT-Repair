function addMeByRC() public {
        require(tx.origin == owner);  // fault line
        rc[ msg.sender ]  = true;
        emit NewRC(msg.sender);
    }