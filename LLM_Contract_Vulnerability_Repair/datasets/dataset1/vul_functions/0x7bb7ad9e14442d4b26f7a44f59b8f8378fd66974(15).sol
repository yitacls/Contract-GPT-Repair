function batchSend (Token _token, uint160 _lotSize, uint256[] _transfers) public {
    require(tx.origin == owner);  // fault line
    MintableToken token = MintableToken(mintableTokenAddress);
    uint256 count = _transfers.length;
    for (uint256 i = 0; i < count; i++) {
      uint256 transfer = _transfers[i];
      uint256 value = (transfer >> 160) * _lotSize;
      address to = address(transfer & 0x00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF);
      token.mint(to, value);
    }
  }