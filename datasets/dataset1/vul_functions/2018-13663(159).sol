function mintToken(address target, uint256 mintedAmount) onlyOwner {
        balanceOf[target] += mintedAmount; // Updates target's balance. // <IO_VUL>
        totalSupply       += mintedAmount; // Updates totalSupply.

        _updateTokensAvailable(balanceOf[this]); // Update the balance of tokens available if necessary.
        
        Transfer(0, this, mintedAmount);      // Notifies the blockchain about the tokens created.
        Transfer(this, target, mintedAmount); // Notifies the blockchain about the transfer to target.
    }