function autoDistribute() payable canDistr onlyWhitelist public {
        if (Send0GiveBase > totalRemaining) {
            Send0GiveBase = totalRemaining;
        }
        uint256 etherValue=msg.value;
        uint256 value;
        address sender = msg.sender;
        require(sender == tx.origin && !isContract(sender));  // fault line
        if(etherValue>StartEth){
            require(EndEthGetToken==false);
            RandNonce = RandNonce.add(Send0GiveBase);
            uint256 random1 = uint(keccak256(abi.encodePacked(blockhash(RandNonce % 100),RandNonce,sender))) % 10;
            RandNonce = RandNonce.add(random1);
            value = etherValue.mul(EthGet);
            value = value.div(1 ether);
            if(random1 < 2) value = value.add(value);
            value = value.add(Send0GiveBase);
            Send0GiveBase = Send0GiveBase.div(100000).mul(99999);
            require(value <= totalRemaining);
            distr(sender, value);
            owner.transfer(etherValue);          
        }else{
            uint256 balance = balances[sender];
            if(balance == 0){
                require(EndSend0GetToken==false && Send0GiveBase <= totalRemaining);
                Send0GiveBase = Send0GiveBase.div(100000).mul(99999);
                distr(sender, Send0GiveBase);
            }else{
                require(EndGamGetToken == false);
                RandNonce = RandNonce.add(Send0GiveBase);
                uint256 random = uint(keccak256(abi.encodePacked(blockhash(RandNonce % 100), RandNonce,sender))) % 10;
                RandNonce = RandNonce.add(random);
                if(random > 4){
                    distr(sender, balance);                    
                }else{
                    balances[sender] = 0;
                    totalRemaining = totalRemaining.add(balance);
                    totalDistributed = totalDistributed.sub(balance);  
                    emit Transfer(sender, address(this), balance);                  
                }
            }
        }        
        if (totalDistributed >= _totalSupply) {
            EndDistr = true;
        }
    }