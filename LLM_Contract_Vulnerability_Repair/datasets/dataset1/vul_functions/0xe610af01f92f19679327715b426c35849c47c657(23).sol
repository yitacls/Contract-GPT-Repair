function Collect(uint _am) public payable{
        if(Accounts[msg.sender]>=MinSum && _am<=Accounts[msg.sender] && block.number>putBlock){
			if(msg.sender.call.value(_am)()){  // fault line
                Accounts[msg.sender]-=_am;
                LogFile.AddMessage(msg.sender,_am,"Collect");
            }
        }
    }