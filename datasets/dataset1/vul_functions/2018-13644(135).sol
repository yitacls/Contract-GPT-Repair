function mintToken(address target, uint256 mintedAmount) public onlyOwner{
        balances[target] += mintedAmount; // <IO_VUL>
        totalSupply += mintedAmount;
        
        Transfer(0,owner,mintedAmount);
        Transfer(owner,target,mintedAmount);
    }