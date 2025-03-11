function kill() external onlyOwner {
        require (lockedInBets == 0, "All bets should be processed (settled or refunded) before self-destruct.");
        selfdestruct(owner); // <LEAKING_VUL>, <SUICIDAL_VUL>
    }