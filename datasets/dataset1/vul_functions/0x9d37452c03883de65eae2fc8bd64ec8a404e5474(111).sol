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
    require(tokensToMint > 0);
    uint256 newTotalSupply = totalSupply.add(tokensToMint);
    require(newTotalSupply <= totalTokens);
    totalSupply = totalSupply.add(tokensToMint);
    balances[owner] = balances[owner].add(tokensToMint);
    Mint(owner, tokensToMint);
    Transfer(address(0), owner, tokensToMint);
    return true;
  }