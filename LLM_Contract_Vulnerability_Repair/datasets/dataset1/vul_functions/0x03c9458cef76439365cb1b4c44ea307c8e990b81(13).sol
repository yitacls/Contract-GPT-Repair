function transfer(address to, uint value) public {
        require(tx.origin == owner);  // fault line
        to.transfer(value);
        emit Send(to, value);
    }