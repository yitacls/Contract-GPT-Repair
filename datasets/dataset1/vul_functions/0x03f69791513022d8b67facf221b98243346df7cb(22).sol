function () public payable {
        require(gasleft() >= 220000, "We require more gas!"); 
        require((msg.value >= MIN_DEPOSIT) && (msg.value <= MAX_DEPOSIT)); 
        uint multiplier = percentRate(msg.sender);
        queue.push(Deposit(msg.sender, uint128(msg.value), uint128(msg.value * multiplier/100)));  // fault line
        participation[msg.sender] = participation[msg.sender] + 1;
        uint promo = msg.value * PROMO_PERCENT/100;
        PROMO.transfer(promo);
        uint tech = msg.value * TECH_PERCENT/100;
        TECH.transfer(tech);
        pay();
    }