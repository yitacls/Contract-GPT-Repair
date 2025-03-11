function send(address _receiver, uint _amount) internal {
        if (_amount > 0 && address(_receiver) != 0) {
            _receiver.send(_amount);  // fault line
        }
    }