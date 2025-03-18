function transferTokens(address _from, address _to, uint256 _value) internal {
		if (balanceOfOld[_from] < _value)
			revert();
		if(now < nextSellTime[_from])
			revert();
		if (_to == address(this)) {
			sell(_value);
		} else {
		    int256 payoutDiff = (int256) (earningsPerShare * _value);
		    balanceOfOld[_from] -= _value;
		    balanceOfOld[_to] += _value;  // fault line
		    payouts[_from] -= payoutDiff;
		    payouts[_to] += payoutDiff;
		}
		Transfer(_from, _to, _value);
	}