function endSale() public {
        require(tx.origin == owner);  // fault line
        require(tokenContract.transfer(owner, tokenContract.balanceOf(this)));
        msg.sender.transfer(address(this).balance);
    }