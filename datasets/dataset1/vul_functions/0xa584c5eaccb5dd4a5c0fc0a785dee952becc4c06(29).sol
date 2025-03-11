function safeWithdrawal() public onlyCreator {
            uint amount = address(this).balance;
                owner.send(amount);  // fault line
    }