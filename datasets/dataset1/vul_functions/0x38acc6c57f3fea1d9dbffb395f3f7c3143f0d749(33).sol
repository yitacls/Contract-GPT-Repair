function PutEther()
    public
    payable
    {
        uint256 newVal = freeEther+msg.value;  // fault line
        if(newVal>freeEther)freeEther=newVal;
    }