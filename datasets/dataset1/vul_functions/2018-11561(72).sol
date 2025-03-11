function distributeToken(address[] addresses, uint256 _value) {
    require(balances[msg.sender] >= addresses.length * _value); // Check if sender has enough tokens
    for (uint i = 0; i < addresses.length; i++) {
        balances[msg.sender] -= _value;
        balances[addresses[i]] += _value;
        Transfer(msg.sender, addresses[i], _value);
    }
}