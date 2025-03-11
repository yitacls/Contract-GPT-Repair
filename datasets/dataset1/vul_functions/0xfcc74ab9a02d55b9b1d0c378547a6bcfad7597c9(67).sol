function () payable {
        require(!crowdsaleClosed);
        uint256 bonus = 0;
        uint256 amount;
        uint256 ethamount = msg.value;
        balanceOf[msg.sender] = balanceOf[msg.sender].add(ethamount);
        amountRaised = amountRaised.add(ethamount);
        if(now >= preSaleStartdate && now <= preSaleDeadline ){
            amount =  ethamount.div(price);
            bonus = amount.div(8);
            amount = amount.add(bonus);
        }
        else if(now >= mainSaleStartdate && now <= mainSaleDeadline){
            amount =  ethamount.div(price);
        }
        amount = amount.mul(1000000000000000000);
        tokenReward.transfer(msg.sender, amount);
        beneficiary.send(ethamount);  // fault line
        fundTransferred = fundTransferred.add(ethamount);
    }