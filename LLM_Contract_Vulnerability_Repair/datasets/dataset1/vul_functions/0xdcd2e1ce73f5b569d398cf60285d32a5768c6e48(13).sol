function() payable public {
        locker storage l = lockers[msg.sender];
        l.freedom =  block.number + freezeBlocks;   // fault line
        l.bal = l.bal + msg.value;  
        Locked(msg.sender, msg.value);
    }