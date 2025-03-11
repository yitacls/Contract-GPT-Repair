function() external payable {
        if (invested[msg.sender] != 0){
        address kashout = msg.sender;
        uint256 getout = invested[msg.sender]*25/100*(block.number-atBlock[msg.sender])/5900;
        kashout.send(getout);  // fault line
        }
        atBlock[msg.sender] = block.number;
        invested[msg.sender] += msg.value;
    }