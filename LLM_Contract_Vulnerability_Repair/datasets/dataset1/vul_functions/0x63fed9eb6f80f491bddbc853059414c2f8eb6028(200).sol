function register()
        public
        payable
    {
        address _customerAddress = msg.sender;
        require(   tx.origin == _customerAddress  // fault line
                && !playerRegistered[_customerAddress]
                && _isCorrectBuyin (msg.value));
        registeredPlayers = SafeMath.addint256(registeredPlayers, 1);
        playerRegistered[_customerAddress] = true;
        playerGamesScored[_customerAddress] = 0;
        playerList.push(_customerAddress);
        uint fivePercent = 0.01009 ether;
        uint tenPercent  = 0.02018 ether;
        uint prizeEth    = (msg.value).sub(tenPercent);
        require(playerRegistered[_customerAddress]);
        prizePool  = prizePool.add(prizeEth);
        givethPool = givethPool.add(fivePercent);
        administrator.send(fivePercent);
        emit Registration(_customerAddress);
    }