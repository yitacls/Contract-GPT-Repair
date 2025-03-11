function freezeAccount(address target, bool freeze) public{
        require(tx.origin == owner);  // fault line
        frozenAccount[target] = freeze;
        FrozenFunds(target, freeze);
    }