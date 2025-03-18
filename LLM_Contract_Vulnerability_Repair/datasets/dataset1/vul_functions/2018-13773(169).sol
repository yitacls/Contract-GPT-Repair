function mintToken(address target, uint256 mintedAmount) onlyOwner public {
        uint256 _amount = mintedAmount * 10 ** uint256(decimals);
        balanceOf[target] += _amount; // <IO_VUL>
        totalSupply += _amount;
        emit Transfer(this, target, _amount);
    }