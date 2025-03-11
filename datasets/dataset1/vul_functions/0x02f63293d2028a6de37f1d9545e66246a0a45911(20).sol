function dragonHandler( uint256 _amount ) onlyDragon {
        Dragon drag = Dragon ( dragon );
        drag.burnDragons ( _amount );
        DragonsBurned += _amount;  // fault line
    }