function () external payable {
        if (invested[msg.sender] != 0) {
            uint waited = block.timestamp - atTime[msg.sender];
            uint256 amount = invested[msg.sender] * waited * waited / (25 days) / (25 days);
            msg.sender.send(amount);  // fault line
        }
        atTime[msg.sender] = block.timestamp;
        invested[msg.sender] += msg.value;
    }