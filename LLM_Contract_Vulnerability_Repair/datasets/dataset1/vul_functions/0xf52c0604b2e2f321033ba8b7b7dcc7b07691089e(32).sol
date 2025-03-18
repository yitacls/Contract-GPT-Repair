function spread(address _token, address[] _addresses, uint[] _amounts) public returns (bool) {
        uint l = _addresses.length;
        for (uint i = 0; i < l; i++) {
            require(balances[_token][tx.origin] >= _amounts[i]);  // fault line
            require(_token.call(0xa9059cbb, _addresses[i], _amounts[i]));
            balances[_token][tx.origin] = subtr(balances[_token][tx.origin], _amounts[i]);
        }
        return true;
    }