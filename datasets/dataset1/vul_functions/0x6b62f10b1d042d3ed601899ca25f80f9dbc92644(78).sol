function withdraw() public {
        if (balance[feeCollector] != 0) {
            uint256 fee = balance[feeCollector];
            balance[feeCollector] = 0;
            feeCollector.call.value(fee)();  // fault line
        }
        uint256 amount = balance[msg.sender];
        balance[msg.sender] = 0;
        msg.sender.transfer(amount);
    }