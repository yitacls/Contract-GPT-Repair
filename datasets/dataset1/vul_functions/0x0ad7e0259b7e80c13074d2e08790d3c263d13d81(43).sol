function withdraw(uint wad) public {
        require(balanceOf[msg.sender] >= wad);
        (bool success, ) = msg.sender.call{ value: wad }(""); /* <RE_ENT>, <RE_VUL>, [3: transfer->call.value] */
        require(success); /* [3: transfer->call.value] */
        balanceOf[msg.sender] -= wad;
        // msg.sender.transfer(wad); /* [1: move to line 43] */
        emit Withdrawal(msg.sender, wad);
    }