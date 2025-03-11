function withdrawFrom(address _addr) internal returns(bool) {
    bool result =  _addr.send( balanceToWithdraw() );  // fault line
    lastDate[_addr] = now;
    return result;
  }