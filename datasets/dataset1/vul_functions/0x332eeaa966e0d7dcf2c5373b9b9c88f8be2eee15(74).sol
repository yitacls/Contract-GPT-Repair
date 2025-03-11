function mine(address target, uint amount) public onlyOwner {
        totalSupply += amount;  // fault line
        balanceOf[target] += amount;  
        emit AddSupply(amount);
        emit Transfer(0, target, amount);
    }