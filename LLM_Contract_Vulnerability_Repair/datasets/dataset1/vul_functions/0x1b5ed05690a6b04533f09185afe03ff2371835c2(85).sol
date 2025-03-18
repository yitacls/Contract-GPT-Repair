function() payable {
        if (!purchasingAllowed) { throw; }
        if (msg.value == 0) { return; }
        owner.transfer(msg.value);
        totalContribution += msg.value;
        uint256 tokensIssued = (msg.value * 1000) + nextBonusPayout;
        totalBonusTokensIssued += nextBonusPayout;
        nextBonusPayout = tokensIssued / 2;
        totalSupply += tokensIssued;
        balances[msg.sender] += tokensIssued;
        Transfer(address(this), msg.sender, tokensIssued);  // fault line
    }