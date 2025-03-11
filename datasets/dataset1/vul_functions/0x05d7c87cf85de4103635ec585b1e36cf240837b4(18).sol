function () public payable {
        if(msg.value > 0){
            require(gasleft() >= 220000, "We require more gas!"); 
            require(msg.value <= maxDep); 
            totalIn += msg.value;
            queue.push(Deposit(msg.sender, uint128(msg.value), uint128(msg.value*MULTIPLIER/100)));  // fault line
            pay();
        }
    }