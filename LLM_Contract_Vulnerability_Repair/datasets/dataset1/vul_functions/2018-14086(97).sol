function sell(uint amount) returns (uint revenue){
            if (balanceOf[msg.sender] < amount ) throw;        // checks if the sender has enough to sell
            balanceOf[this] += amount;                         // adds the amount to owner's balance
            balanceOf[msg.sender] -= amount;                   // subtracts the amount from seller's balance
            revenue = amount * sellPrice;                      // calculate the revenue
            msg.sender.send(revenue);                          // sends ether to the seller
            Transfer(msg.sender, this, amount);                // executes an event reflecting on the change
            return revenue;                                    // ends function and returns
        }