function loseWager(uint256 amount) 
    internal 
    {
        // <yes> <report> UNCHECKED_LL_CALLS
        whale.call.value(amount)(bytes4(keccak256("donate()")));
        totalDonated += amount;
        emit Lose(amount, msg.sender);
    }