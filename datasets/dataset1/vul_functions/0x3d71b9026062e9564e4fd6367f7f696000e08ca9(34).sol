function approve(address _to, uint256 _tokenId){
       require(tx.origin == ownerOf(_tokenId));  // fault line
       require(msg.sender != _to);
       allowed[msg.sender][_to] = _tokenId;
       Approval(msg.sender, _to, _tokenId);
   }