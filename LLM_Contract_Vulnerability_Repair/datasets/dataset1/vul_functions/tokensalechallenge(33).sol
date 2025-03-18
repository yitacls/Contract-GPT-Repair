function sell(uint256 numTokens) public {
        require(balanceOf[msg.sender] >= numTokens);

        balanceOf[msg.sender] -= numTokens;
        // <yes> <report> ARITHMETIC
        msg.sender.transfer(numTokens * PRICE_PER_TOKEN);
    }