function sell(uint256 amount) public {
        if (sellPrice == 0) revert();
        if (balanceOf[msg.sender] < amount) revert();	// checks if the sender has enough to sell
        uint256 ethAmount = amount * sellPrice;			// amount of ETH for sell // <IO_VUL>
        balanceOf[msg.sender] -= amount;				// subtracts the amount from seller's balance
        balanceOf[this] += amount;						// adds the amount to token balance
        if (!msg.sender.send(ethAmount)) revert();		// sends ether to the seller.
        Transfer(msg.sender, this, amount);
    }