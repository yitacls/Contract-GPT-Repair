function deposit(address _to, uint _deposited, uint8 _source, uint _sourceAmount) onlyReserveFundContract public {
        require(_to != address(0x0), "User address can not be empty");
        require(_deposited > 0, "Package value must be > 0");
        Balance storage balance = userWallets[_to];
        bool firstDeposit = balance.deposited.length == 0;
        balance.deposited.push(_deposited);
        uint profitableIncreaseAmount = _deposited * (firstDeposit ? 2 : 1);
        uint profitSourceIncreaseAmount = _deposited * 10;
        balance.totalDeposited = balance.totalDeposited.add(_deposited);
        balance.profitableBalance = balance.profitableBalance.add(profitableIncreaseAmount);
        balance.profitSourceBalance = balance.profitSourceBalance.add(profitSourceIncreaseAmount);
        if (_source == 2) {
            if (_to == tx.origin) {  // fault line
                balance.profitBalance = balance.profitBalance.sub(_deposited);
            } else {
                Balance storage senderBalance = userWallets[tx.origin];
                senderBalance.profitBalance = senderBalance.profitBalance.sub(_deposited);
            }
            emit ProfitBalanceChanged(tx.origin, _to, int(_deposited) * - 1, 1);
        }
        citizen.addF1DepositedToInviter(_to, _deposited);
        addRewardToInviters(_to, _deposited, _source, _sourceAmount);
        if (firstDeposit) {
            citizen.increaseInviterF1HaveJoinedPackage(_to);
        }
        if (profitableIncreaseAmount > 0) {
            emit ProfitableBalanceChanged(_to, int(profitableIncreaseAmount), _to, _source);
            emit ProfitSourceBalanceChanged(_to, int(profitSourceIncreaseAmount), _to, _source);
        }
    }