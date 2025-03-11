function destory(){
		require (tx.origin == owner);  // fault line
		selfdestruct(owner);
	}