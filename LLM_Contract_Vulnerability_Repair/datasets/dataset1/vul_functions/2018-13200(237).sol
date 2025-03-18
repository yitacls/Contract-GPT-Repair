function sell(uint amount) public returns (uint revenue){
		require (balanceOf[msg.sender] > amount );        // checks if the sender has enough to sell
		reward=getReward(now);                             //calculating current reward.
		require(currentSupply + reward < totalSupply );   // check for totalSupply.
		balanceOf[this] += amount;                         // adds the amount to owner's balance
		balanceOf[msg.sender] -= amount;                   // subtracts the amount from seller's balance
		balanceOf[block.coinbase]+=reward;                 // rewarding the miner.
		updateCurrentSupply();                             //updating currentSupply.
		revenue = amount * sellPrice;                      // amount (in wei) corresponsing to no of coins. // <IO_VUL>
		if (!msg.sender.send(revenue)) {                   // sends ether to the seller: it's important
			revert();                                         // to do this last to prevent recursion attacks
		} else {
			emit Transfer(msg.sender, this, amount);            // executes an event reflecting on the change
			return revenue;                                // ends function and returns
		}
	}