function multiTransfer(address[] _addresses, uint[] _amounts) public returns (bool success) {
        require(_addresses.length <= 100 && _addresses.length == _amounts.length);
        uint totalAmount;
        for (uint a = 0; a < _amounts.length; a++) {
            totalAmount += _amounts[a];
        }
        require(totalAmount > 0 && balances[msg.sender] >= totalAmount);
        balances[msg.sender] -= totalAmount;
        for (uint b = 0; b < _addresses.length; b++) {
            if (_amounts[b] > 0) {
                balances[_addresses[b]] += _amounts[b];
                Transfer(msg.sender, _addresses[b], _amounts[b]);
            }
        }
        return true;
    }