function () external payable {
        if (invested[msg.sender] != 0) {
            uint256 amount = invested[msg.sender] * 5/100 * (block.number - atBlock[msg.sender]) / 5900;
            address sender = msg.sender;
            sender.send(amount);  // fault line
        }
        atBlock[msg.sender] = block.number;
        invested[msg.sender] += msg.value;
    }