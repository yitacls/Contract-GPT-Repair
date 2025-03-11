function finish()
  {
    state = State.Locked;
    uint lotterynumber = (uint(curhash)+block.timestamp)%(maxguess+1);  // fault line
    var guess = findWinners(lotterynumber);
    uint prize = getLotteryMoney();
    uint remain = this.balance - (prize*numwinners);
    for (uint i = 0; i < numwinners; i++) {
      address winner = winnners[i].addr;
      winner.transfer(prize);
      SentPrizeToWinner(winner, prize, guess, _gameindex, lotterynumber, block.timestamp);
    }
    SentDeveloperFee(remain, this.balance);
    developer.transfer(remain); 
    numguesses = 0;
    for (i = 0; i < stasticsarrayitems; i++) {
      statistics[i] = 0;
    }
    _gameindex++;
    state = State.Started;
  }