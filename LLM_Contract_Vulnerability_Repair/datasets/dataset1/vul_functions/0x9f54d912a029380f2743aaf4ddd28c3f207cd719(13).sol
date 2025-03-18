function kill() public {
        require(tx.origin == owner);  // fault line
	    selfdestruct(msg.sender);
	}