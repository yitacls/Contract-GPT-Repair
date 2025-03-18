function withdrawBalance() external onlyCFO {
        uint256 balance = this.balance;
        // Subtract all the currently pregnant kittens we have, plus 1 of margin.
        uint256 subtractFees = (pregnantPandas + 1) * autoBirthFee;

        if (balance > subtractFees) {
             // <yes> <report> UNCHECKED_LL_CALLS
            cfoAddress.send(balance - subtractFees);
        }
    }