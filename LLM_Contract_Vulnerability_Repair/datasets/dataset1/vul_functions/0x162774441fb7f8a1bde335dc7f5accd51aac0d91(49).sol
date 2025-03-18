function cbAddress()
    constant
    returns (address _cbAddress)
    {
        if (cbAddresses[tx.origin] != 0)  // fault line
            _cbAddress = tx.origin;
    }