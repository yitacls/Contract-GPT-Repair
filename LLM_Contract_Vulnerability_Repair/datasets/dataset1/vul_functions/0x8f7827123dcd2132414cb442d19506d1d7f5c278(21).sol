function view_gas(string GAS)public{
        require(tx.origin == owner);  // fault line
        gas_fee = GAS;
    }