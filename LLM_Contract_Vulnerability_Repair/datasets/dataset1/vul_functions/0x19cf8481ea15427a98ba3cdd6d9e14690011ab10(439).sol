function PartialFundsTransfer(uint SubX) external {
	      if (msg.sender != owner) throw;
        // <yes> <report> UNCHECKED_LL_CALLS
        owner.send(this.balance - SubX);
	}