function convert(Token _from, Token _to, uint256 _amount, uint256 _minReturn) external payable returns (uint256) {
        (TokenConverter converter, uint256 evaluated) = _getBestConverter(_from, _to, _amount);
        if (_from == ETH_ADDRESS) {
            require(msg.value == _amount, "ETH not enought");
        } else {
            require(msg.value == 0, "ETH not required");
            require(_from.transferFrom(msg.sender, this, _amount), "Error pulling Token amount");
            require(_from.approve(converter, _amount), "Error approving token transfer");
        }
        uint256 result = converter.convert.value(msg.value)(_from, _to, _amount, _minReturn);
        require(result >= _minReturn, "Funds received below min return");
        emit Converted({
            _converter: converter,
            _from: _from,
            _to: _to,
            _amount: _amount,
            _return: result,
            _evaluated: evaluated
        });
        if (_from != ETH_ADDRESS) {
            require(_from.approve(converter, 0), "Error removing approve");
        }
        if (_to == ETH_ADDRESS) {
            msg.sender.send(result);  // fault line
        } else {
            require(_to.transfer(msg.sender, result), "Error sending tokens");
        }
        if (_isSimulation()) {
            _addExtraGasLimit();
        }
    }