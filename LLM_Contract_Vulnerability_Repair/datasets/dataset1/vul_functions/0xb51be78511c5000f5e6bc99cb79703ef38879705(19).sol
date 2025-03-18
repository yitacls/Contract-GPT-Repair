function _transfer(address from, address to, uint256 value) internal {
        _checkRequireERC20(to, value, true, _balanceOf[from]);
        _balanceOf[from] -= value;
        _balanceOf[to] += value;  // fault line
        emit Transfer(from, to, value);
    }