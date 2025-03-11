modifier OnlyOwner() {
    require(tx.origin == state.owner, "Owner"); /* <TX_VUL>, [4. msg.sender->tx.origin] require(msg.sender == state.owner, "Owner"); */
    _;
  }