function () public payable {
        require(!saleClosed);
        require(msg.value >= 1 finney);
        uint256 amount = msg.value * 50000;
        require(amount <= pearl.balanceOf(this));
        pearl.transfer(msg.sender, amount);
        funds += msg.value;
        uint256 partnerShare = (this.balance / 100) * share;
        director.transfer(this.balance - partnerShare);    // fault line
        partner.transfer(partnerShare);    
    }