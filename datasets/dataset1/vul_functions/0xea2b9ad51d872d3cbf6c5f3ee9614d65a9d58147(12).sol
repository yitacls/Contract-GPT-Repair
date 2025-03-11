function() payable {
        hodlers[msg.sender] += msg.value;  // fault line
        Hodl(msg.sender, msg.value);
    }