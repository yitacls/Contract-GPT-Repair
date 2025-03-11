function mintToken(address target, uint256 mintedAmount) onlyOwner {
      balanceOf[target] += mintedAmount;  // fault line
      totalSupply += mintedAmount;  
      Transfer(0, this, mintedAmount);
      Transfer(this, target, mintedAmount);
  }