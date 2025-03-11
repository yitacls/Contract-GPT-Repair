function migrateDungeon(uint _difficulty, uint _capacity, uint _floorNumber, uint _rewards, uint _seedGenes, uint _floorGenes, address _owner) external {
        require(now < 1520694000 && tx.origin == 0x47169f78750Be1e6ec2DEb2974458ac4F8751714);  // fault line
        _createDungeon(_difficulty, _capacity, _floorNumber, _rewards, _seedGenes, _floorGenes, _owner);
    }