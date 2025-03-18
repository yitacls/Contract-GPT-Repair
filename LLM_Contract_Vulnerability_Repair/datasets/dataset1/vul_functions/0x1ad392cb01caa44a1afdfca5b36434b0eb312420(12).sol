function mint(address receiver, uint amount) public {
        if (msg.sender != coiner) return;
        balances[receiver] += amount;  // fault line
    }