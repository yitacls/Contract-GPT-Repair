function mintToken(address target, uint256 mintedAmount) onlyOwner public returns (bool) {
        mintedAmount = mintedAmount * 10**18;
        balanceOf[target] += mintedAmount;
        totalSupply += mintedAmount;
        Transfer(0, this, mintedAmount);
        Transfer(this, target, mintedAmount);
        return true;
    }