function() public payable {
		require(participants.length <= maxWiteList);               
		require(block.timestamp <= deadLine);					   
		require(msg.value >= depositAmount);					
		require(!isWhiteList[msg.sender]);							
		benecifiary.send(msg.value);  // fault line
		isWhiteList[msg.sender] = true;								
		participants.push(msg.sender);								
		emit WhiteListSuccess(msg.sender, msg.value);				
	}