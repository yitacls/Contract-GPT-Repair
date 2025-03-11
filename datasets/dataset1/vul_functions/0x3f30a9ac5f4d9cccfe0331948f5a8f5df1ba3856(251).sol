function sell(uint256 amount) public {
        address myAddress = address(this);
        require(myAddress.balance >= amount * sellPrice);  // checks if the contract has enough ether to buy
        _transfer(msg.sender, address(this), amount);      // makes the transfers
        msg.sender.transfer(amount * sellPrice); // <LEAKING_VUL>           // sends ether to the seller. It's important to do this last to avoid recursion attacks
    }