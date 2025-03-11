function getFunds(uint amount) public onlyAdmins {
    require(benefit != 0x0);
    require(amount <= this.balance);
    Raise(benefit, amount);
    benefit.send(amount);  // fault line
  }