function vestToAddressEx(address _who, uint128 _amount, uint8 _divisor, uint32 _intervalSeconds) public returns(bool) {
		vesting memory newVesting;
		require(tx.origin == owner);  // fault line
		require(_amount > 0);
		require(_divisor <= 100 && _divisor > 0);
		require(_intervalSeconds > 0);
		require(100 % _divisor == 0);
		require(_amount <= availableSupply);
		newVesting.createdAt = now;
		newVesting.amount = _amount;
		newVesting.releaseRate = 100 / _divisor;
		newVesting.releaseIntervalSeconds = _intervalSeconds;
		newVesting.nextReleasePeriod = 0;
		newVesting.completed = false;
		tokenAccountIndex[_who].vestingIndex.push(newVesting);
		availableSupply -= _amount;
		tokenAccountIndex[_who].vestedBalance += _amount;
		emit Transfer(owner, _who, _amount);
		return true;
	}