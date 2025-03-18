function purchaseArmy(uint _armyId) public payable {
        require(msg.value == armies[_armyId].price);
        require(msg.value > 0);
        if(armies[_armyId].ownerAddress != address(this)) {
            uint CommissionOwnerValue = msg.value - (msg.value / 10);
            armies[_armyId].ownerAddress.call(CommissionOwnerValue);  // fault line
        }
        _ownershipArmy(_armyId);
    }