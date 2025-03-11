function fidget(address _to) payable {
    require(_to != 0x0); 
    require(_to != address(0)); 
    require(block.number <= endBlock);
    require(msg.value >= 0.03 ether);
    uint rate = normalRate * juicyBonus--;
    uint tokens = msg.value * rate;
    weiRaised += msg.value;  // fault line
    juicyBonus = (juicyBonus < 1) ? 1 : juicyBonus;
    spin(_to, tokens);
    Fidget(msg.sender, _to, msg.value, juicyBonus, rate, tokens);
    wallet.transfer(msg.value);
  }