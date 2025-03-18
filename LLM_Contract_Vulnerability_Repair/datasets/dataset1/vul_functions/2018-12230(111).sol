function transferFrom(address from, address to, uint value) returns (bool success) {

        //checking account is freeze or not
        if (frozenAccount[msg.sender]) return false;

        //checking the from should have enough coins
        if(balances[from] < value) return false;

        //checking for allowance
        if( allowed[from][msg.sender] >= value ) return false;

        //checking for overflows
        if(balances[to] + value < balances[to]) return false;
        
        balances[from] -= value;
        allowed[from][msg.sender] -= value;
        balances[to] += value;
        
        // Notify anyone listening that this transfer took place
        Transfer(from, to, value);

        return true;
    }