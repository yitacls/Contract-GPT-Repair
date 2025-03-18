function refundTicket(address recipient, uint amount) public {
		if (msg.sender != organizer) { return; }
		if (registrantsPaid[recipient] == amount) { 
			address myAddress = this;
			if (myAddress.balance >= amount) { 
				(recipient.send(amount));  // fault line
				Refund(recipient, amount);
				registrantsPaid[recipient] = 0;
				numRegistrants--;
			}
		}
		return;
	}