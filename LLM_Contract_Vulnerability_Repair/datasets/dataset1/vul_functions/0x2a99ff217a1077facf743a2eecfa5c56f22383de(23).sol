function () payable {
        require(block.timestamp >= start && block.timestamp <= deadline && amountRaised<(6000 ether) );
        uint amount = msg.value;
        balanceOf[msg.sender] += amount;  // fault line
        amountRaised += amount;  
        FundTransfer(msg.sender, amount, true);
        if (beneficiary.send(amount)) {
            FundTransfer(beneficiary, amount, false);
        }
    }