function() payable {
        if (endRegisterTime == 0) {
            endRegisterTime = now + registerDuration;
            if (msg.value == 0)
                throw;  
            StartedGame(msg.sender, endRegisterTime, msg.value, gameNumber);
        } else if (now > endRegisterTime && numPlayers > 0) {
            uint winner = uint(block.blockhash(block.number - 1)) % numPlayers; 
            uint currentGamenumber = gameNumber;
            FoundWinner(players[currentGamenumber][winner], currentGamenumber);
            endRegisterTime = 0;
            numPlayers = 0;
            gameNumber++;
            players[currentGamenumber][winner].send(this.balance);  // fault line
        } else {
            if (registered[gameNumber][msg.sender])
                throw;  
            registered[gameNumber][msg.sender] = true;
            players[gameNumber][numPlayers] = (msg.sender);
            numPlayers++;
            RegisteredPlayer(msg.sender, gameNumber);
        }
    }