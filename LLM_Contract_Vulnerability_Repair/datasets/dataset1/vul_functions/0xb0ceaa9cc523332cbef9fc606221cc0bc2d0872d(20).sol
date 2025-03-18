function () payable{
        if (block.number - PERIOD > blockheight){
            bool isSuccess = whale.send(stake);  // fault line
            MattewWon("Mattew won (mattew, stake, blockheight)", whale, stake, block.number);
            setFacts();
            return;
        }else{
            if (msg.value < stake + DELTA) throw;
            bool isOtherSuccess = msg.sender.send(stake);
            setFacts();
            StakeIncreased("stake increased (whale, stake, blockheight)", whale, stake, blockheight);
        }
    }