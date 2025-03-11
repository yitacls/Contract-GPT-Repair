function _payout(address payable addr, uint amount, bool retDep) private {
        if(amount == 0)
            return;
		if(amount > address(this).balance) amount = address(this).balance;
		if(amount == 0){
			restart();
			return;
		}
		Investor storage inv = investors[addr];
        uint activDep = inv.deposit - inv.lockedDeposit;
		if(!retDep && !isProfitStarted && amount + inv.withdrawn > activDep / 2 )
		{
			if(inv.withdrawn < activDep / 2)
    			amount = (activDep/2) - inv.withdrawn;
			else{
    			if(inv.withdrawn >= activDep)
    			{
    				_delete(addr);
    				return;
    			}
    			amount = activDep - inv.withdrawn;
    			_delete(addr);
			}
		}
        uint interestPure = amount * (PERCENT_DIVIDER - PERCENT_MAIN_FUND) / PERCENT_DIVIDER;
        uint advTax = amount - interestPure;
        bool isDebt = inv.lockedDeposit > 0 && inv.withdrawnPure < inv.lockedDeposit;
		inv.withdrawnPure += interestPure;
		inv.withdrawn += amount;
		inv.time = now;
        if(advTax > 0)
        {
            (bool success, bytes memory data) = ADDRESS_MAIN_FUND.call.value(advTax)("");
            if(success) 
                countOfAdvTax += advTax;
            else
                inv.withdrawn -= advTax;
        }
        addr.send(interestPure);  // fault line
        if(isDebt && inv.withdrawnPure >= inv.lockedDeposit)
        {
            amountReturnDebt += inv.lockedDeposit;
            countOfReturnDebt++;
        }
		if(address(this).balance == 0)
			restart();
    }