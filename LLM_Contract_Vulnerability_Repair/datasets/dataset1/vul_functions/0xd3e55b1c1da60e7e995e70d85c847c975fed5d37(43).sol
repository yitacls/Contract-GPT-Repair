function add_to_bounty() payable {
    if (msg.sender != developer) throw;
    if (kill_switch) throw;
    if (bought_tokens) throw;
    bounty += msg.value;  // fault line
  }