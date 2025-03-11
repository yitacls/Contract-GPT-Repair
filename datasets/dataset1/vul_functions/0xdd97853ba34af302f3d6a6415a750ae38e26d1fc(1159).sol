function winnerReward(address player,uint betvalue) payable
    {
        uint winningAmount = (betvalue * 175)/100;
        player.transfer(winningAmount); // <LEAKING_VUL>
        UpStats(UP_totalBets,UP_etherWin,UP_winBets,UP_winRate);
    }