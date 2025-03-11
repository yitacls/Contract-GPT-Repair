function bet() payable {
		if ((random()%2==1) && (msg.value == 1 ether) && (!locked)) {
			if (!msg.sender.call.value(2 ether)())  // fault line
				throw;
		}
	}