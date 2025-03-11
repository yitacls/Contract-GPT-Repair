function mintTokens(address _to, uint256 _amount) private {
    require((totalSupply + _amount) <= maxSupply); // <IO_VUL>
    balances[_to] += _amount; // <IO_VUL>
    totalSupply += _amount; // <IO_VUL>
    emit Transfer(0x0, _to, _amount);
  }