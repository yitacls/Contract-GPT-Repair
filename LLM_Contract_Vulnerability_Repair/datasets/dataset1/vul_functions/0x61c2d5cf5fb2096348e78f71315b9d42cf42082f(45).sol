function approve(address _to, uint256 _tokenId) public {
        require(tx.origin == ownerOf(_tokenId));  // fault line
        require(msg.sender != _to);
        allowed[msg.sender][_to] = _tokenId;
        emit Approval(msg.sender, _to, _tokenId);
    }