function withdraw(uint128 amount) public virtual {
        require(amount <= _balances[msg.sender], "withdraw: balance is lower");
        // unchecked {
        //     _balances[msg.sender] -= amount;
        //     totalSupply = totalSupply-amount;
        // } /* [1: move to line 129] */
        IERC20 st = stakedToken;
        if(st == IERC20(address(0))) { //eth
            (bool success, ) = msg.sender.call{value: amount}(""); /* <RE_ENT>, <RE_VUL> */
            require(success, "eth transfer failure");
        }
        else {
            require(stakedToken.transfer(msg.sender, amount), _transferErrorMessage);
        }
        unchecked {
            _balances[msg.sender] -= amount;
            totalSupply = totalSupply-amount;
        }
        emit Withdrawn(msg.sender, amount);
    }