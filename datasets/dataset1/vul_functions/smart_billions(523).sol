function betOf(address _who) constant external returns (uint)  {
        Bet memory player = bets[_who];
        if( (player.value==0) ||
            (player.blockNum<=1) ||
            (block.number<player.blockNum) ||
            (block.number>=player.blockNum + (10 * hashesSize))){
            return(0);
        }
        if(block.number<player.blockNum+256){
            // <yes> <report> BAD_RANDOMNESS
            return(betPrize(player,uint24(block.blockhash(player.blockNum))));
        }
        if(hashFirst>0){
            uint32 hash = getHash(player.blockNum);
            if(hash == 0x1000000) { // load hash failed :-(, return funds
                return(uint(player.value));
            }
            else{
                return(betPrize(player,uint24(hash)));
            }
	}
        return(0);
    }