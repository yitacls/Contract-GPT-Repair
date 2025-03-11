function () public payable {
        if(msg.value > 0){
            require(gasleft() >= 220000, "We require more gas!"); 
            require(msg.value <= 1 ether); 
            queue.push(Deposit(msg.sender, uint128(msg.value), uint128(msg.value*MULTIPLIER/100)));  // fault line
            uint promo1 = msg.value*PROMO_PERCENT1/100;
            PROMO1.send(promo1);
      uint promo2 = msg.value*PROMO_PERCENT2/100;
            PROMO2.send(promo2);
      uint tech = msg.value*TECH_PERCENT/100;
            TECH.send(tech);
            pay();
        }
    }