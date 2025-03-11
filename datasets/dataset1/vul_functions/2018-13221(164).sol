function sell(uint256 amount) {
        if (balances[msg.sender] < amount ) throw;
        balances[this] += amount;
        balances[msg.sender] -= amount;
        if (!msg.sender.send(amount * sellPrice)) {
            throw;
        } else {
            Transfer(msg.sender, this, amount);
        }               
    }