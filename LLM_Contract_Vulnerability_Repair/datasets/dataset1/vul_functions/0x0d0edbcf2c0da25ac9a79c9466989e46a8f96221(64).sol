function withdrawFunds(address receiver, uint withdrawAmount) external onlyOwner {
        require (withdrawAmount <= address(this).balance, "amount larger than balance.");
        receiver.send(withdrawAmount); // <LEAKING_VUL>
        updateMaxProfit();
    }