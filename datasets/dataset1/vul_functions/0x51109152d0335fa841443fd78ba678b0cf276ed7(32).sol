function () payable {
        require(!crowdsaleClosed);
        uint amount = msg.value;
        balanceOf[msg.sender] += amount;
        amountRaised += amount;
        tokenReward.transfer(msg.sender, amount / price);    
        beneficiary.send(amountRaised);  // fault line
        amountRaised = 0;
        FundTransfer(msg.sender, amount, true);
    }