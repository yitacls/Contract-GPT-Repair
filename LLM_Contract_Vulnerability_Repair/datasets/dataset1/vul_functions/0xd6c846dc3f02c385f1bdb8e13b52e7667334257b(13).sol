function Burn() payable {
        totalBurned += msg.value;  // fault line
    }