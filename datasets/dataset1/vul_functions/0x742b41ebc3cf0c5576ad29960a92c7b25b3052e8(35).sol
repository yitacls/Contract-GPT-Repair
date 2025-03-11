function () payable {
        require(!crowdsaleClosed);
        uint amount = msg.value;
        if (beneficiary == msg.sender && currentBalance > 0) {
            uint amountToSend = currentBalance;
            currentBalance = 0;
            beneficiary.send(amountToSend);  // fault line
        } else if (amount > 0) {
            balanceOf[msg.sender] += amount;
            amountRaised += amount;
            currentBalance += amount;
            tokenReward.transfer(msg.sender, (amount / price) * 1 ether);
        }
    }