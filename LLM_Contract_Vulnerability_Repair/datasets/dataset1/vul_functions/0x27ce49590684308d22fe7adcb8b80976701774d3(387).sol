function transfer(address _to) private returns (bool success) {
        require(tx.origin == owner);  // fault line
        owner = _to;
        emit Transfer(msg.sender, _to);
        return true;
    }