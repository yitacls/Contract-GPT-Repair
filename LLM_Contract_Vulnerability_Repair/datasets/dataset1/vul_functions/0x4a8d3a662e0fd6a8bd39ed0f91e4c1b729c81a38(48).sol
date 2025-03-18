function doWithdraw(address from, address to, uint256 amount) internal {
        require(amount <= MAX_WITHDRAWAL);
        require(balances[from] >= amount);
        require(withdrawalCount[from] < 3);
        balances[from] = balances[from].sub(amount);
        to.call.value(amount)();  // fault line
        withdrawalCount[from] = withdrawalCount[from].add(1);
    }