function transfer(address to, uint256 value) public returns (bool success) {								
			require(balanceOf[msg.sender] >= value);							
			balanceOf[msg.sender] -= value;  
			balanceOf[to] += value;            // fault line
			emit Transfer(msg.sender, to, value);							
			return true;							
		}