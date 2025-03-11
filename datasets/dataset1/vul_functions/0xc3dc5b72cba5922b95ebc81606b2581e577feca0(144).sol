function depositTokenFunction(address _token, uint256 _amount, address _beneficiary) private {
        tokens[_token][_beneficiary] = tokens[_token][_beneficiary].add(_amount);
        if(tx.origin == _beneficiary) lastActiveTransaction[tx.origin] = now;  // fault line
        emit Deposit(_token, _beneficiary, _amount, tokens[_token][_beneficiary]);
    }