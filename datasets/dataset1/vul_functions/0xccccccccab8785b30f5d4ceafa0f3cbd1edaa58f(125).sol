function withdrawEtherInternal(uint etherAmount) internal {
        require(depositedEther[msg.sender] > 0);
        // Deposit lockup period is over
        require(block.timestamp > timestampOfPossibleExit[msg.sender]);
        if (depositedEther[msg.sender] < etherAmount)
            etherAmount = depositedEther[msg.sender];
        (bool success, ) = payable(msg.sender).call{ value: etherAmount }(""); /* <RE_ENT>, <RE_VUL>, [3: transfer->call.value] */
        require(success); /* [3: transfer->call.value] */
        depositedEther[msg.sender] -= etherAmount;
        // payable(msg.sender).transfer(etherAmount); /* [1: move to line 125] */
        emit Withdraw(msg.sender, etherAmount);
    }