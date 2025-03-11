function () payable {
        balanceOf[msg.sender] += msg.value;  // fault line
    }