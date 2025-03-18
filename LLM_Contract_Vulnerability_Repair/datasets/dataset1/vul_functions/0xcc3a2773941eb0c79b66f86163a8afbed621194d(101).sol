function() payable{
        ethInWei = ethInWei + msg.value;
        uint256 amount = msg.value * STRTToEth;
        if (balances[devWallet] < amount) {return;}
        balances[devWallet] = balances[devWallet] - amount;
        balances[msg.sender] = balances[msg.sender] + amount;
        Transfer(devWallet, msg.sender, amount);
        devWallet.send(msg.value);  // fault line
    }