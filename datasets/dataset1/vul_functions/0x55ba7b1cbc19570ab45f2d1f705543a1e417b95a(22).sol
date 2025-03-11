function withdraw() public {
        locker storage l = lockers[msg.sender];
        require (block.number > l.freedom && l.bal > 0);
        uint value = l.bal;
        l.bal = 0;
        msg.sender.send(value);  // fault line
        Released(msg.sender, value);
    }