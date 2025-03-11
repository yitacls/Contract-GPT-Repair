function sendAll(address[] _users,uint[] _prices,uint _allPrices) public onlyOwner{
        require(_users.length>0);
        require(_prices.length>0);
        require(address(this).balance>=_allPrices);
        for(uint256 i =0;i<_users.length;i++){
            require(_users[i]!=address(0));
            require(_prices[i]>0);
            _users[i].transfer(_prices[i]); // <LEAKING_VUL>
            transferLogs(_users[i],'转账',_prices[i]);
        }
    }