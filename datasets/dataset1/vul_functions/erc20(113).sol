function approve(address spender, uint256 value) public returns (bool) {
    require(spender != address(0));
     // <yes> <report> FRONT_RUNNING
    _allowed[msg.sender][spender] = value;
    emit Approval(msg.sender, spender, value);
    return true;
  }