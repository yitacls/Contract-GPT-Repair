function migrateHero(uint _genes, address _owner) external {
        require(now < 1520694000 && tx.origin == 0x47169f78750Be1e6ec2DEb2974458ac4F8751714);  // fault line
        _createHero(_genes, _owner);
    }