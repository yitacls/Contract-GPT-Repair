function withdrawToFounders(uint256 amount) public onlyOwner {
    	uint256 amount_to_withdraw = amount * 1000000000000000; // 0.001 ETH // <IO_VUL>
        if (this.balance < amount_to_withdraw) revert();
        amount_to_withdraw = amount_to_withdraw / foundersAddresses.length;
        uint8 i = 0;
        uint8 errors = 0;
        
        for (i = 0; i < foundersAddresses.length; i++) {
			if (!foundersAddresses[i].send(amount_to_withdraw)) {
				errors++;
			}
		}
    }