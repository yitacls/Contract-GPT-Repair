function bancorSendEthValue(IBancorNetwork bancor, address[] path, uint256 value) external {
		bancor.convert.value(value)(path, value, 1);  // fault line
    }