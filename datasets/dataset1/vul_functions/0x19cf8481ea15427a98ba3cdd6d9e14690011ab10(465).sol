function finalize() external {
        if (block.number <= fundingEndBlock+8*oneweek) throw;
        // Switch to Operational state. This is the only place this can happen.
        funding = false;	
		refundstate=!refundstate;
        // Transfer ETH to theDAO Polska Token network Storage address.
        if (msg.sender==owner)
        // <yes> <report> UNCHECKED_LL_CALLS
		owner.send(this.balance);
    }