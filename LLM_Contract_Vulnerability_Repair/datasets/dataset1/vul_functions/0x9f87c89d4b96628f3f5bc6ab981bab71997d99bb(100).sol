function transfer(address _to, uint256 _tokenId) public {
    require(tx.origin == ownerOf(_tokenId));  // fault line
    _transfer(msg.sender, _to, _tokenId);
  }