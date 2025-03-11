function loggedTransfer(uint amount, bytes32 logMsg, address target, address currentOwner)  payable {
       if(msg.sender != address(this))throw;
	   if(target.call.value(amount)()){  // fault line
          CashMove(amount, logMsg, target, currentOwner);
       }
    }