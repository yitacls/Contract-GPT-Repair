function _sell(address _from,uint256 amount) internal returns (uint256 revenue){
        require(sellOpen);
        require(!frozenAccount[_from]);
        require(amount>0);
        require(sellPrice>0);
        require(_from!=owner);
        _transfer(_from,owner,amount);
        revenue = amount * sellPrice;
        _from.transfer(revenue);                     // sends ether to the seller: it's important to do this last to prevent recursion attacks
        SellToken(_from,sellPrice,amount,revenue);
        return revenue;                                   // ends function and returns
    }