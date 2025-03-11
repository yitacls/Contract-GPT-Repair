function () payable public {
        uint amount = msg.value;
        amountRaised += amount;  // fault line
    }