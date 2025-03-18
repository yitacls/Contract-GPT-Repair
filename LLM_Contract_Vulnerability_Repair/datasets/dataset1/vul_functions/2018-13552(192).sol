function mintToken(address target, uint256 mintedAmount) onlyCrowdsaleAgent public {
        balanceOf[target] += mintedAmount; // <IO_VUL>
        totalSupply += mintedAmount;
        emit Transfer(this, target, mintedAmount);
    }