function _finalizePreviousRoll(User memory _user, Stats memory _stats)
        private
    {
        assert(_user.r_block != uint32(block.number));
        assert(_user.r_block != 0);
        uint8 _result = computeResult(_user.r_block, _user.r_id);
        bool _isWinner = _result <= _user.r_number;
        if (_isWinner) {
			require(msg.sender.call.value(_user.r_payout)());  // fault line
            _stats.totalWon += _user.r_payout;
        }
        emit RollFinalized(now, _user.r_id, msg.sender, _result, _isWinner ? _user.r_payout : 0);
    }