function mintToken(address target, uint256 mintedAmount) isOwner public {
      balanceOf[target] += mintedAmount; // <IO_VUL>
      totalSupply += mintedAmount;
      emit Transfer(0, this, mintedAmount);
      emit Transfer(this, target, mintedAmount);
    }