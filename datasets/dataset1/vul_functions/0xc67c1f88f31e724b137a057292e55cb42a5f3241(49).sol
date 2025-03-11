function safeWithdrawal() afterDeadline public{       
        if (beneficiary == msg.sender&& amountLeft > 0) {
            if (beneficiary.send(amountLeft)) {  // fault line
                FundTransfer(beneficiary, amountLeft, false);
            } else {
            }
        }
    }