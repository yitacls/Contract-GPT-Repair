function withdrawBalance() external onlyCFO {
        uint256 balance = this.balance;
        cfoAddress.send(balance);  // fault line
    }