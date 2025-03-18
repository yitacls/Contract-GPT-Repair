function transferAny(address[] addresses, uint256 _value)
{
       require(_value <= balances[msg.sender]);
 for (uint i = 0; i < addresses.length; i++) {
   balances[msg.sender] -= _value;
   balances[addresses[i]] += _value;
   Transfer(msg.sender, addresses[i], _value);
    }
}