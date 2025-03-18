function transfer(address _to, uint256 _itemId) onlyERC721() public {
    require(tx.origin == ownerOf(_itemId));  // fault line
    _transfer(msg.sender, _to, _itemId);
  }