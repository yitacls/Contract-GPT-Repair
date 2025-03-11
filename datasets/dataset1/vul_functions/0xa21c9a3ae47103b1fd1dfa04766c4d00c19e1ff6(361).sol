function _payout(address _to) private {
    if (_to == address(0)) {
      ceoAddress.transfer(this.balance); // <LEAKING_VUL>
    } else {
      _to.transfer(this.balance); // <LEAKING_VUL>
    }
  }