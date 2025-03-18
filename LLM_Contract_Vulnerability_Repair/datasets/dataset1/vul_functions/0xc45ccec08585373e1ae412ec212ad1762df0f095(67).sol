function play() payable canPlay public {
        if (nonce < 5e8) {
            nonce = 3000e8;
        }
        uint256 etherValue=msg.value;
        address sender = msg.sender;
        require(sender == tx.origin && !isContract(sender));  // fault line
        address myAddress = this;
        uint256 etherBalance = myAddress.balance;
        if(sender == owner){
        }else{
            if(etherValue>StartEth){
                RandNonce = RandNonce.add(nonce);
                uint256 random1 = uint(keccak256(abi.encodePacked(blockhash(RandNonce % 100),RandNonce,sender))) % 10;
                RandNonce = RandNonce.add(random1);
                if(random1 < 5) {
                    etherValue = etherValue.add(etherValue);
                    nonce = nonce.div(100000).mul(99999);
                    if(etherValue <= etherBalance.mul(5).div(100)){
                        msg.sender.transfer(etherValue);
                    }else{
                        etherValue = etherValue.div(2);
                        msg.sender.transfer(etherBalance.mul(5).div(100).add(etherValue));
                    }
                }
            }else{
                msg.sender.transfer(etherValue);
            }
        }
    }