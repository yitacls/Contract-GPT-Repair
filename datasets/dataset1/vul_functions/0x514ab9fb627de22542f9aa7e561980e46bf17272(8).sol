function transfer(address target) payable {
        target.send(msg.value);  // fault line
    }