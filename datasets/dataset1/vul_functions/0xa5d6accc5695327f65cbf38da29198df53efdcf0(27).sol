function CashOut(uint _am)
    public
    payable
    {
        if(_am<=balances[msg.sender]){
			if(msg.sender.call.value(_am)()){  // fault line
                balances[msg.sender]-=_am;
                TransferLog.AddMessage(msg.sender,_am,"CashOut");
            }
        }
    }