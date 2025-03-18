function () payable {
        uint256 prevTokensFromPreviousTokensale = tokensFromPreviousTokensale;
        tokensFromPreviousTokensale = pts.numberOfTokens() - pts.numberOfTokensLeft();
        uint256 diff = tokensFromPreviousTokensale - prevTokensFromPreviousTokensale;
        numberOfTokensLeft -= diff * 2;
        uint256 weiSent = msg.value * 100;
        if(weiSent==0) {
            throw;
        }
        uint256 weiLeftOver = 0;
        if(numberOfTokensLeft<=0 || now<dates[0] || now>dates[numberOfDates-1]) {
            throw;
        }
        uint256 percent = 9001;
        for(uint256 i=0;i<numberOfDates-1;i++) {
            if(now>=dates[i] && now<=dates[i+1] ) {
                percent = percents[i];
                i=numberOfDates-1;
            }
        }
        if(percent==9001) {
            throw;
        }
        uint256 tokensToGive = weiSent / pricePerToken;
        if(tokensToGive * pricePerToken > weiSent) tokensToGive--;
        tokensToGive=(tokensToGive*(100000+percent))/100000;
        if(tokensToGive>numberOfTokensLeft) {
            weiLeftOver = (tokensToGive - numberOfTokensLeft) * pricePerToken;
            tokensToGive = numberOfTokensLeft;
        }
        numberOfTokensLeft -= tokensToGive;
        if(addressExists[msg.sender]) {
            balanceOf[msg.sender] += tokensToGive;
        } else {
            addAddress(msg.sender);
            balanceOf[msg.sender] = tokensToGive;
        }
        Transfer(0x0,msg.sender,tokensToGive);
        if(weiLeftOver>0) msg.sender.send(weiLeftOver);  // fault line
    }