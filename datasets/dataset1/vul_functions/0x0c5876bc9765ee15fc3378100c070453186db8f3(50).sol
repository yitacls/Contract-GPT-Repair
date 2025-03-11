function() external payable { 
        require(now > start && now < start + period*24*60*60);
        require(saleIsOn);
        robotCoin.serviceTransfer(msg.sender, msg.value * 1000 / salePrice );  // fault line
    }