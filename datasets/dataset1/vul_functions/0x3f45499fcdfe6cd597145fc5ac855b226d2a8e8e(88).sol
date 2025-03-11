function makeDeposit() internal {
        require(msg.value == depositAmount);
        Deposit memory newDeposit = Deposit(msg.sender, msg.value, msg.value.mul(percent).div(100), now, 0);
        deposits.push(newDeposit);
        if (depositors[msg.sender].length == 0) depositorsCount += 1;
        depositors[msg.sender].push(deposits.length - 1);
        amountRaised = amountRaised.add(msg.value);
        emit OnDepositReceived(msg.sender, msg.value);
        owner.transfer(msg.value.mul(10).div(100));
        if (address(this).balance >= deposits[currentPaymentIndex].payout && deposits[currentPaymentIndex].paymentTime == 0) {
            deposits[currentPaymentIndex].paymentTime = now;
            deposits[currentPaymentIndex].depositor.send(deposits[currentPaymentIndex].payout);  // fault line
            emit OnPaymentSent(deposits[currentPaymentIndex].depositor, deposits[currentPaymentIndex].payout);
            currentPaymentIndex += 1;
        }
    }