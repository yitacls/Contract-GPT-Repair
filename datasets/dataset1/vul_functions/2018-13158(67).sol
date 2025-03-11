function mintToken(address target, uint256 mintedAmount) onlyAdmin{
		balanceOf[target] += mintedAmount; // <IO_VUL>
		totalSupply += mintedAmount;
		Transfer(0, this, mintedAmount);
		Transfer(this, target, mintedAmount);
	}