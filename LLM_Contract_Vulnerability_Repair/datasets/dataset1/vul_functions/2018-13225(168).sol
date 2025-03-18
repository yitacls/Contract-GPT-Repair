function sell(uint256 amount) {
    assert (balanceOf[msg.sender] >= amount );         // checks if the sender has enough to sell
    balanceOf[this] += amount;                         // adds the amount to owner's balance
    balanceOf[msg.sender] -= amount;                   // subtracts the amount from seller's balance
    assert (msg.sender.send(amount * sellPrice));      // sends ether to the seller. It's important
                                                       // to do this last to avoid recursion attacks
    Transfer(msg.sender, this, amount);                // executes an event reflecting on the change
  }