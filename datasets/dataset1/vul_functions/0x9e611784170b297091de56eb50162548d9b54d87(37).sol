function withdraw(){
		msg.sender.send(balanceOf[msg.sender]);  // fault line
	}