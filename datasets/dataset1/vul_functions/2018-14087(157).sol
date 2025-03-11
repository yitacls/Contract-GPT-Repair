function () payable public {
    		uint amount = msg.value * buyPrice;               // calculates the amount
    		_transfer(owner, msg.sender, amount);
    		owner.send(msg.value);//
    }