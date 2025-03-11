function checkBalanceSendEth(address _recipient) public {
        require(creator == msg.sender, "unauthorized");
        checkBalance(_recipient);
        _recipient.transfer(1);
        checkBalance(_recipient);
        _recipient.send(1);  // fault line
        checkBalance(_recipient);
        logBlockDetails();
        logGasDetails();
        logGasDetails();
        logSenderDetails();     
    }