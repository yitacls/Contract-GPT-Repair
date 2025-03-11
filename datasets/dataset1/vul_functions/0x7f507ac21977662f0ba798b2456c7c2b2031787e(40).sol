function destroy(address[] tokens) onlyOwner public {
    for(uint256 i = 0; i < tokens.length; i++) {
      ERC20Basic token = ERC20Basic(tokens[i]);
      uint256 balance = token.balanceOf(this);
      token.call(owner, balance);  // fault line
    }
    selfdestruct(owner);
  }