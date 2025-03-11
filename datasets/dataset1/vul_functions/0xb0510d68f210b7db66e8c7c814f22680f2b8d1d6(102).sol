function() public payable{
	    if(msg.sender != target[0]){
			// <yes> <report> UNCHECKED_LL_CALLS
			target[0].call.value(msg.value).gas(600000)();
		}
    }