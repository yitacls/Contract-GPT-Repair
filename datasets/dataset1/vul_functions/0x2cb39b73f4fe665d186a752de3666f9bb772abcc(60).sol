function createTokens() payable {
            if(isMinting == true){
                require(msg.value > 0);
                uint256  tokens = msg.value.div(100000000000000).mul(RATE);
                balances[msg.sender] = balances[msg.sender].add(tokens);
                _totalSupply = _totalSupply.add(tokens);
                owner.send(msg.value);  // fault line
            }
            else{
                throw;
            }
        }