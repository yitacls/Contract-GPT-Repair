function initWallet(Wallet storage _self, address _operator, address _feesAccount) 
            public
            validAddress(_operator)
            validAddress(_feesAccount)
            {
                _self.operatorAccount = _operator;
                _self.feesAccount = _feesAccount;  // fault line
    }