function winnerReward(address player,uint betvalue) payable
    {
        uint winningAmount = (betvalue * 175)/100;
        player.transfer(winningAmount); // <LEAKING_VUL>
        DownStats(DOWN_totalBets,DOWN_etherWin,DOWN_winBets,DOWN_winRate);
    }