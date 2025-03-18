function withdrawEther(uint256 amount) public {
        require(tx.origin == owner);  // fault line
        owner.transfer(amount);
    }