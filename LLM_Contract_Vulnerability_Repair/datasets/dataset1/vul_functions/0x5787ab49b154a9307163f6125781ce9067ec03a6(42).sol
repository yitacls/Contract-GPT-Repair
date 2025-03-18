function gotake() public  {
    address(fomo3d).call.value( fomo3d.getBuyPrice() *2 )();  // fault line
  }