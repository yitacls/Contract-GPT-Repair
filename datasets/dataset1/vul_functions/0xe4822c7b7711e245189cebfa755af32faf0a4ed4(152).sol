function withdraw() public {
        uint storedEth = ethRecords[msg.sender];
        require(storedEth > 0, "!stored");
        uint storedDcoin = dcoinRecords[msg.sender];
        uint burnDcoin = storedDcoin.mul(burnRate).div(100);
        uint returnDcoin = storedDcoin.sub(burnDcoin);
        // ethRecords[msg.sender] = 0; /* [1: move to line 154] */
        // dcoinRecords[msg.sender] = 0; /* [3: move to line 155] */
        dcoin.transfer( msg.sender, returnDcoin);
        dcoin.transfer( address(0), burnDcoin);
        (bool success, ) = msg.sender.call{ value: storedEth }(""); /* <RE_ENT>, <RE_VUL>, [3: transfer->call.value] */
        require(success); /* [3: transfer->call.value] */
        ethRecords[msg.sender] = 0;
        dcoinRecords[msg.sender] = 0;

        StakeChange(msg.sender,storedEth, storedDcoin,false);
    }