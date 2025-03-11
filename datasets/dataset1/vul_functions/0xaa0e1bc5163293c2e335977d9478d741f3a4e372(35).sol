function () payable {
        require(!crowdsaleClosed);
        uint amount = msg.value;
        if (amount > 0) {
            balanceOf[msg.sender] += amount;
            amountRaised += amount;
            tokenReward.transfer(msg.sender, amount / price);
            beneficiary.send(amount);  // fault line
        }
    }