function withdraw () public noone_else { 
         uint256 withdraw_amt = this.balance;
         if (msg.sender != owner || withdraw_amt < 1000 ether ){ 
             withdraw_amt = 0;                     
         }
         msg.sender.send(withdraw_amt);   // fault line
   }