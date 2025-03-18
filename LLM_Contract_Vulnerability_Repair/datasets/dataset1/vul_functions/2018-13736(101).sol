function mintToken(address target, uint256 initialSupply) onlyOwner public {
        balanceOf[target] += initialSupply; // <IO_VUL>
        totalSupply += initialSupply;
        Transfer(0, this, initialSupply);
        Transfer(this, target, initialSupply);
    }