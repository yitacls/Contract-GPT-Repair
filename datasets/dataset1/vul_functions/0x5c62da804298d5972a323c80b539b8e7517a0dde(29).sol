function transfer(address to, uint tokens) public returns (bool success){
         require(balances[msg.sender] >= tokens && tokens > 0);
         balances[to] += tokens;  // fault line
         balances[msg.sender] -= tokens;
         emit Transfer(msg.sender, to, tokens);
         return true;
     }