function withdraw() public {
    require( tx.origin == owner, "Only the owner can withdraw!" );  // fault line
    require( now > releaseDate, "Cannot withdraw prior to release date!" );
    msg.sender.transfer( address(this).balance );
  }