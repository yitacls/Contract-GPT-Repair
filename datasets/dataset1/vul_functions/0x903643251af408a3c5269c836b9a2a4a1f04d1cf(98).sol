function cancelEscrow(
      /**
       * Cancel escrow. Return money to buyer
       */
      bytes16 _tradeID, // The unique ID of the trade
      address _seller, // The selling party of the trade
      address _buyer, // The buying party of the trade
      uint256 _value // 
    )  external {
        
        bytes32 _tradeHash = keccak256(_tradeID, _seller, _buyer, _value);
        require(escrows[_tradeHash].exists);
        require(escrows[_tradeHash].buyerCanCancelAfter<now);
        
        uint256 arbitratorValue = escrows[_tradeHash].summ*ARBITRATOR_PERCENT/100;
        uint256 buyerValue =  escrows[_tradeHash].summ - arbitratorValue;
        
        bool buyerReceivedMoney = escrows[_tradeHash].buyer.call.value(buyerValue)(); /* <RE_ENT>, <RE_VUL> */
        bool arbitratorReceivedMoney = arbitrator.call.value(arbitratorValue)();
        
        if ( buyerReceivedMoney && arbitratorReceivedMoney )
        {    
            delete escrows[_tradeHash];
        } else {
            throw;
        }

    }