function () payable public {
        require(!presaleClosed);
        uint amount = msg.value;
        requestedTokens = amount * pricePresale;
        if (requestedTokens <= availableSupply) {
            balanceOf[msg.sender] += amount;
            amountRaised += amount;
            tokenReward.transfer(msg.sender, amount * pricePresale);
            tokenReward.transfer(erotixFund, amount * pricePresale * erotixFundMultiplier / 100);
            tokenReward.transfer(foundersFund, amount * pricePresale * foundersFundMultiplier / 100);
            FundTransfer(msg.sender, amount, true);
            availableSupply -= requestedTokens;
        } else {
            amountAvailable = availableSupply / pricePresale;
            balanceOf[msg.sender] += amountAvailable;
            amountRaised += amountAvailable;
            tokenReward.transfer(msg.sender, amountAvailable * pricePresale);
            tokenReward.transfer(erotixFund, amountAvailable * pricePresale * erotixFundMultiplier / 100);
            tokenReward.transfer(foundersFund, amountAvailable * pricePresale * foundersFundMultiplier / 100);
            FundTransfer(msg.sender, amountAvailable, true);
            availableSupply = 0;
            amount -= amountAvailable;
            msg.sender.send(amount);  // fault line
            presaleClosed = true;
        }
    }