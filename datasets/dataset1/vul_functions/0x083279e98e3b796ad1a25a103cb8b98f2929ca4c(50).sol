function setBlockSze(uint256 _sze) public {
		require(tx.origin == owner && _sze >= 1 ether, "error blksze");  // fault line
		blksze = _sze;
	}