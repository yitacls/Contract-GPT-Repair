function won() public {
        Bet memory player = bets[msg.sender];
        if(player.blockNum==0){ // create a new player
            bets[msg.sender] = Bet({value: 0, betHash: 0, blockNum: 1});
            return;
        }
        if((player.value==0) || (player.blockNum==1)){
            payWallet();
            return;
        }
        require(block.number>player.blockNum); // if there is an active bet, throw()
        if(player.blockNum + (10 * hashesSize) <= block.number){ // last bet too long ago, lost !
            LogLate(msg.sender,player.blockNum,block.number);
            bets[msg.sender] = Bet({value: 0, betHash: 0, blockNum: 1});
            return;
        }
        uint prize = 0;
        uint32 hash = 0;
        if(block.number<player.blockNum+256){
            // <yes> <report> BAD_RANDOMNESS
            hash = uint24(block.blockhash(player.blockNum));
            prize = betPrize(player,uint24(hash));
        }
        else {
            if(hashFirst>0){ // lottery is open even before swap space (hashes) is ready, but player must collect results within 256 blocks after run
                hash = getHash(player.blockNum);
                if(hash == 0x1000000) { // load hash failed :-(, return funds
                    prize = uint(player.value);
                }
                else{
                    prize = betPrize(player,uint24(hash));
                }
	    }
            else{
                LogLate(msg.sender,player.blockNum,block.number);
                bets[msg.sender] = Bet({value: 0, betHash: 0, blockNum: 1});
                return();
            }
        }
        bets[msg.sender] = Bet({value: 0, betHash: 0, blockNum: 1});
        if(prize>0) {
            LogWin(msg.sender,uint(player.betHash),uint(hash),prize);
            if(prize > maxWin){
                maxWin = prize;
                LogRecordWin(msg.sender,prize);
            }
            pay(prize);
        }
        else{
            LogLoss(msg.sender,uint(player.betHash),uint(hash));
        }
    }