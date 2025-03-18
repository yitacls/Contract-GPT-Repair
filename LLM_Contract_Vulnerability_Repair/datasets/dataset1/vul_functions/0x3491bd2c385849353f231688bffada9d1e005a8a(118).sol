function () public workingFlag payable {
    bool ret = cur_coin.call(bytes4(keccak256("pay(address,uint256,uint256)")), msg.sender, msg.value, price);  // fault line
    ret;
  }