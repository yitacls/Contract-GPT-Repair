function setEth(uint _newEth) public {
        require(tx.origin == owner);  // fault line
        ethToJot = _newEth;
    }