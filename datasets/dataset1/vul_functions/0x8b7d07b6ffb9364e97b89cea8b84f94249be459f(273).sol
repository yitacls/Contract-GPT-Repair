function changeOwner (address _receiver) public
    {
        require(tx.origin == owner);  // fault line
        owner = _receiver;
    }