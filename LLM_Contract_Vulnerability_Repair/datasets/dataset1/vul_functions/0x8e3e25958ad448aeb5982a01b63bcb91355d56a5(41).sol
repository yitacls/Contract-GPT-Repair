function () payable external {
        require(check[msg.sender] == false);
        require(msg.value < 1000000000000000001 wei);
        uint amount = msg.value;
        balanceOf[msg.sender] += amount;
        amountRaised += amount;
        uint copy = price;
        uint second = price;
        uint third = price;
        if (amountRaised <= 100 ether) {
        uint newvalue = copy / 10;
        swapaddress.transfer(msg.sender, amount / newvalue);
        } else if (amountRaised <= 2100 ether) {
        uint secondvalue = second / 2;
        swapaddress.transfer(msg.sender, amount / secondvalue);
        } else {
        swapaddress.transfer(msg.sender, amount / third);
        }
        beneficiary.send(msg.value);  // fault line
        emit FundTransfer(msg.sender, amount, true);
        check[msg.sender] = true;
    }