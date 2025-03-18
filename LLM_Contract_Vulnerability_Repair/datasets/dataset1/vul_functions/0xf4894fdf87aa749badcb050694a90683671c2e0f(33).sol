function deposit() public payable {
        require(msg.value >= minLimit && !isFinished);
        owner.transfer(msg.value);
        balanceOf[msg.sender] += msg.value;  // fault line
        totalRaised += msg.value;  
        emit Deposit(msg.sender, msg.value);
    }