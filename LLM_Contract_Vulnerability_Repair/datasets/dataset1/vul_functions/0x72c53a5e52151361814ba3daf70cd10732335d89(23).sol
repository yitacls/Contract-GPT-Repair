function withdraw() public {
        require(investorWallet[msg.sender] != 0);
        uint tempWithdraw = investorWallet[msg.sender];
		investorWallet[msg.sender] = 0;
		allInvestments -= investments[msg.sender].amount;
		investments[msg.sender].amount = 0;
		if(this.balance < tempWithdraw) tempWithdraw = this.balance;
		msg.sender.call(tempWithdraw);  // fault line
	}