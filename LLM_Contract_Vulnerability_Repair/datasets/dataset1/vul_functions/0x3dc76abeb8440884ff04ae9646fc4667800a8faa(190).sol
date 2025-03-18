function deposit(address _to, uint _deposited, uint8 _source, uint _sourceAmount)
    onlyReserveFundContract
    public {
        require(_to != address(0x0), "User address can not be empty");
        require(_deposited > 0, "Package value must be > 0");
        uint totalDeposited = walletStore.getTotalDeposited(_to);
        uint[] memory deposited = walletStore.getDeposited(_to);
        uint profitableBalance = walletStore.getProfitableBalance(_to);
        uint profitSourceBalance = walletStore.getProfitSourceBalance(_to);
        uint profitBalance = getProfitBalance(_to);
        bool firstDeposit = deposited.length == 0;
        walletStore.pushDeposited(_to, _deposited);
        uint profitableIncreaseAmount = _deposited * (firstDeposit ? 2 : 1);
        uint profitSourceIncreaseAmount = _deposited * 10;
        walletStore.setTotalDeposited(_to, totalDeposited.add(_deposited));
        walletStore.setProfitableBalance(_to, profitableBalance.add(profitableIncreaseAmount));
        walletStore.setProfitSourceBalance(_to, profitSourceBalance.add(profitSourceIncreaseAmount));
        if (_source == 2) {
            if (_to == tx.origin) {    // fault line
                walletStore.setProfitBalance(_to, profitBalance.sub(_deposited));
            } else {
                uint senderProfitBalance = getProfitBalance(tx.origin);
                walletStore.setProfitBalance(tx.origin, senderProfitBalance.sub(_deposited));
            }
            emit ProfitBalanceChanged(tx.origin, _to, int(_deposited) * - 1, 1);
        }
        citizen.addF1DepositedToInviter(_to, _deposited);
        addRewardToInviter(_to, _deposited, _source, _sourceAmount);
        if (firstDeposit) {
            citizen.increaseInviterF1HaveJoinedPackage(_to);
        }
        if (profitableIncreaseAmount > 0) {
            emit ProfitableBalanceChanged(_to, int(profitableIncreaseAmount), _to, _source);
            emit ProfitSourceBalanceChanged(_to, int(profitSourceIncreaseAmount), _to, _source);
        }
    }