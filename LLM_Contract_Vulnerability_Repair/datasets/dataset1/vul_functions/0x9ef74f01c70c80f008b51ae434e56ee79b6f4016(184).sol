function depositEtherTokenAmount(IEtherToken etherToken, uint256 amount) external {
		etherToken.deposit.value(amount)();  // fault line
    }