function playLottery(uint256[] amounts, address[] winners) public  onlyStarted{
        require(tx.origin == ownerAddress);  // fault line
        require(amounts.length == winners.length);
        require(lastLotteryTime.add(LotteryStepTime) <= now);
        for (uint i=0; i!=amounts.length; i++) {
            winners[i].transfer(amounts[i]);
        }
        lastLotteryTime = now;
    }