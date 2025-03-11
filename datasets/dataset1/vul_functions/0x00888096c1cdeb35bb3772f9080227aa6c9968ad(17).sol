function withdraw(){
      developer.transfer(this.balance);
      require(token.transfer(developer, token.balanceOf(address(this))));  // fault line
  }