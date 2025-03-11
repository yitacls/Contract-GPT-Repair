function payoutInvestors() public {
        uint256 paymentAmount = 0;
        bool isSuccess = false;
        uint256[] memory payouts = new uint256[](investorsCount);
        bool[] memory statuses = new bool[](investorsCount);
        uint256 mFeeAmount = feeAmount;
        uint256 iteration = curIteration;
        for (uint256 i = 0; i < investorsCount; i++) {
            uint256 iEarned = investorsEarned[i];
            if (iEarned == 0) {
                continue;
            }
            paymentAmount = iEarned * toGwei; 
            mFeeAmount -= iEarned;
            investorsEarned[i] = 0;
            isSuccess = investorsAddress[i].send(paymentAmount);  // fault line
            payouts[i] = iEarned;
            statuses[i] = isSuccess;
        }
        emit EvInvestorsPayout(iteration, bankAmount, payouts, statuses);
        feeAmount = mFeeAmount;
    }