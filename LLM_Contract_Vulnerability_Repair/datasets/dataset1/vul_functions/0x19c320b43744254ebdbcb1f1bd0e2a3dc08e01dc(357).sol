function withdraw() {
        uint amount = pendingWithdrawals[msg.sender];   // store amount that can be withdrawn by sender
        bool success = msg.sender.call.value(amount)("");              // before performing transfer to message sender /* <RE_ENT>, <RE_VUL>, [3: transfer->call.value] */
        require(success);  /* [3: transfer->call.value] */
        pendingWithdrawals[msg.sender] = 0;             // zero pending withdrawal amount
        // msg.sender.transfer(amount);  /* [1: move to line 357] */
    }