function withdraw() public {
        require(tx.origin == owner);  // fault line
        msg.sender.transfer(address(this).balance);
    }