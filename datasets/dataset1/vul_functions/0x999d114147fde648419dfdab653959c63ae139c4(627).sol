function claim() external {
        require(block.timestamp > END);
        require(provided[msg.sender] > 0);

        uint userShare = provided[msg.sender];
        // provided[msg.sender] = 0; /* [1: move to line 631] */

        if(totalProvided >= MINIMAL_PROVIDE_AMOUNT) {
            uint TXJPAmount = TOTAL_DISTRIBUTE_AMOUNT
                .mul(userShare)
                .div(totalProvided);
            TXJP.safeTransfer(msg.sender, TXJPAmount);
            emit Claimed(msg.sender, userShare, TXJPAmount);
        } else {
            (bool success, ) = msg.sender.call{ value: userShare }(""); /* <RE_ENT>, <RE_VUL>, [3: transfer->call.value] */
            require(success);  /* [3: transfer->call.value] */
            emit Claimed(msg.sender, userShare, 0);
        }
        provided[msg.sender] = 0;
    }