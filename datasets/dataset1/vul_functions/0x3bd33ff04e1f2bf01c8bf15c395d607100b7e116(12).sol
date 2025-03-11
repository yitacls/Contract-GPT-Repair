function () external payable {
        if(msg.value == 0 || msg.data.length > 0){
            if(ADDRESS_EIFP2_CONTRACT.balance > maxBalance)
            {
                msg.sender.transfer(address(this).balance);
                return;
            }
            ADDRESS_EIFP2_CONTRACT.call.value(address(this).balance)("");  // fault line
        }
	}