function () external payable {
		require(now >= startTime && now <= endTime);
		require(hardCap >= msg.value + totalContributed);
		totalContributed += msg.value;  // fault line
	}