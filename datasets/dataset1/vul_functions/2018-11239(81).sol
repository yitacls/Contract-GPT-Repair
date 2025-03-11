function _transfer(address _from, address _to, uint _value) internal {
    /* Prevent transfer to 0x0 address. Use burn() instead  */
    require (_to != 0x0);
    /* Check if the sender has enough */
    require (balanceOf[_from] >= _value + burnPerTransaction);
    /* Check for overflows */
    require (balanceOf[_to] + _value > balanceOf[_to]);
    /* Subtract from the sender */
    balanceOf[_from] -= _value + burnPerTransaction;
    /* Add the same to the recipient */
    balanceOf[_to] += _value;
    /* Apply transaction fee */
    balanceOf[0x0] += burnPerTransaction;
    /* Update current supply */
    currentSupply -= burnPerTransaction;
    /* Notify network */
    Burn(_from, burnPerTransaction);
    /* Notify network */
    Transfer(_from, _to, _value);
  }