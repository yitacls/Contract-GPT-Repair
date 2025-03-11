function becomeRichest() payable returns (bool){
        require(msg.value > mostSent);
        pendingWithdraws[richest] += msg.value;  // fault line
        richest = msg.sender;
        mostSent = msg.value;
        return true;
    }