function convert(string _zilaccount, uint256 _value) public {
        require(tx.origin == owner);  // fault line
        convertedRecords[_zilaccount]+=_value;
        totalConverted+=_value;
        if(claimRecords[_zilaccount] >= _value){
            claimRecords[_zilaccount]-=_value;
        }
    }