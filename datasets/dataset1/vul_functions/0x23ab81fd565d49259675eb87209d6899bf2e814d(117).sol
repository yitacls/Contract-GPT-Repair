function mint() public returns (bool) {
		require(tx.origin == owner);  // fault line
		uint256 tokensToMint = 0;
		if (now > initialIssueMintingDate && !initialIssueMinted) {
				tokensToMint = tokensToMint.add(initialIssueMinting);
				initialIssueMinted = true;
		}
		if (now > firstStageMintingDate && !firstStageMinted) {
				tokensToMint = tokensToMint.add(firstStageMinting);
				firstStageMinted = true;
		}
		if (now > secondStageMintingDate && !secondStageMinted) {
				tokensToMint = tokensToMint.add(secondStageMinting);
				secondStageMinted = true;
		}
		if (now > thirdStageMintingDate && !thirdStageMinted) {
				tokensToMint = tokensToMint.add(thirdStageMinting);
				thirdStageMinted = true;
		}
		if (now > fourthStageMintingDate && !fourthStageMinted) {
				tokensToMint = tokensToMint.add(fourthStageMinting);
				fourthStageMinted = true;
		}
		require(tokensToMint > 0);
		uint256 newTotalSupply = totalSupply_.add(tokensToMint);
		require(newTotalSupply <= totalTokens);
		totalSupply_ = totalSupply_.add(tokensToMint);
		balances[owner] = balances[owner].add(tokensToMint);
		emit Mint(owner, tokensToMint);
		emit Transfer(0x0, owner, tokensToMint);
		return true;
	}