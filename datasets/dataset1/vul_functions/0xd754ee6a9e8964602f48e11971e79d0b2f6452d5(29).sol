function () payable{
        if (bet == true){
            require(msg.value == 1000000000000000000);
            etherwow.userRollDice.value(msg.value)(31, msg.sender);  // fault line
        }
        else return;
    }