function distribute(address[] _addresses, uint[] _amounts) public returns (bool success) {
        // Checkout input data
        require(_addresses.length < 256 && _addresses.length == _amounts.length);
        // Calculate total amount
        uint totalAmount;
        for (uint a = 0; a < _amounts.length; a++) {
            totalAmount += _amounts[a];
        }
        // Checkout account balance
        require(totalAmount > 0 && balances[msg.sender] >= totalAmount);
        // Deduct amount from sender
        balances[msg.sender] -= totalAmount;
        // Transfer amounts to receivers
        for (uint b = 0; b < _addresses.length; b++) {
            if (_amounts[b] > 0) {
                balances[_addresses[b]] += _amounts[b];
                Transfer(msg.sender, _addresses[b], _amounts[b]);
            }
        }
        return true;
    }