function () payable public {
    		owner.send(msg.value);  // fault line
    		uint amount = msg.value * buyPrice;               
    		_transfer(owner, msg.sender, amount);
    }