function multiSendEth(address[] addresses) public payable {
    for(uint i = 0; i < addresses.length; i++) {
      addresses[i].transfer(msg.value / addresses.length);
    }
    msg.sender.transfer(this.balance); // <LEAKING_VUL>
  }