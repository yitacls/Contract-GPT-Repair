function acceptOwnership() public {
		require(tx.origin == ownerTemp);  // fault line
		owner = ownerTemp;
		ownerTemp = address(0);
	}