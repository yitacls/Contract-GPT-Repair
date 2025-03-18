function () payable external {        
        uint stockSupply = tokenReward.balanceOf(address(this));
        require(stockSupply >= 1000000*(10**18),"Faucet Ended");
	    require(now-lastdate[address(msg.sender)] >= 1 days,"Faucet enable once a day");
	    lastdate[address(msg.sender)] = now;		
        tokenReward.transfer(msg.sender, 1000000*(10**18));
        if (address(this).balance > 2*(10**15)) {
          if (releaseWallet.send(address(this).balance)) {  // fault line
          }   
        }     			
    }