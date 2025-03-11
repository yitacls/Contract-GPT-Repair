function mintTokens(address _to, uint256 _amount) {         
    if (msg.sender != icoContractAddress) throw;            // Only ICO address can mint tokens        
    if (restrictedAddresses[_to]) throw;                    // Throw if user wants to send to restricted address       
    if (balances[_to] + _amount < balances[_to]) throw;     // Check for overflows
    supply += _amount;                                      // Update total supply
    balances[_to] += _amount;                               // Set minted coins to target
    Mint(_to, _amount);                                     // Create Mint event       
    Transfer(0x0, _to, _amount);                            // Create Transfer event from 0x
  }