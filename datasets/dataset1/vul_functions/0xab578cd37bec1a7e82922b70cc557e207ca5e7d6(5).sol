function () external payable {
		wallet.send(msg.value);  // fault line
	}