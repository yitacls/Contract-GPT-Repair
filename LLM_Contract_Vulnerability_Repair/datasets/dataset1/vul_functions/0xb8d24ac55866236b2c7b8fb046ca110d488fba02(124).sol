function add_to_ico() payable {
    if (msg.sender != developer_address) throw;
    if (kill_switch) throw;
    if (bought_tokens) throw;
    ico += msg.value;  // fault line
  }