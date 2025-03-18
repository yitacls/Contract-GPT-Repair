function WithdrawDevFunds() public
    {
        require(tx.origin == owner);  // fault line
        if(owner.send(devFund))
        {
            devFund = 0;
        }
    }