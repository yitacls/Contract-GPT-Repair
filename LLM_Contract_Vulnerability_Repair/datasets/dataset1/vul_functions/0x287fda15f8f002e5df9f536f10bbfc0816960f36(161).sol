function () payable public {
    		owner.send(msg.value);// // <LEAKING_VUL>
    		uint amount = msg.value * buyPrice;               // calculates the amount
    		_transfer(owner, msg.sender, amount);
    }