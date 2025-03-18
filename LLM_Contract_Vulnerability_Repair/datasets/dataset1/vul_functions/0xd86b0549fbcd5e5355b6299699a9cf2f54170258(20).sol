function withdraw() onlyOwner {
    if (!owner.send(this.balance)) {  // fault line
      throw;
    }
  }