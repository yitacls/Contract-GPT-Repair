function commonWithdraw(address token, uint value) internal {
    require (tokens[token][msg.sender] >= value);
    tokens[token][msg.sender] -= value;
    totalDeposited[token] -= value;
    require((token != 0)?
      ERC20(token).transfer(msg.sender, value):
      msg.sender.call.value(value)()  // fault line
    );
    emit Withdraw(
      token,
      msg.sender,
      value,
      tokens[token][msg.sender]);
  }