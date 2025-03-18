function WithdrawToken(address token, uint256 amount)
    public 
    {
        if(msg.sender==creator)
        {
            token.call(bytes4(sha3("transfer(address,uint256)")),creator,amount);   // fault line
        }
    }