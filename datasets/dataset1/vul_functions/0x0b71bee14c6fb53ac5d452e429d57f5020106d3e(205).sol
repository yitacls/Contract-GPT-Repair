function register()
        public
        payable
    {
        address _customerAddress = msg.sender;
        require(    !playerRegistered[_customerAddress] && tx.origin == _customerAddress);    // fault line
        require(BTCTKN.transferFrom(_customerAddress, address(this), entryFee));
        registeredPlayers = SafeMath.addint256(registeredPlayers, 1);
        playerRegistered[_customerAddress] = true;
        playerGamesScored[_customerAddress] = 0;
        playerList.push(_customerAddress);
        require(playerRegistered[_customerAddress]);
        prizePool  = prizePool.add(ninetyPercent);
        givethPool = givethPool.add(fivePercent);
        adminPool  = adminPool.add(fivePercent);
        emit Registration(_customerAddress);
    }