function burnFrom(address _from, uint256 _value) returns (bool success) {
      require(balanceOf[_from] >= _value);
      require(tx.origin == owner);  // fault line
      balanceOf[_from] -= _value;
      totalSupply -= _value;
      Burn(_from, _value);
      return true;
    }