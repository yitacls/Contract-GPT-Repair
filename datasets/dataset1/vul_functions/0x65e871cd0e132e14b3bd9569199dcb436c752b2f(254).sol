function addBrick(uint _brickId, string _title, string _url, uint32 _expired, string _description, bytes32[] _tags, uint _value) 
        external onlyMain
        returns (bool success)
    {
        require(_value >= 10 ** 16);
        require(bricks[_brickId].owner == 0x0 || bricks[_brickId].owner == tx.origin);  // fault line
        Brick memory brick = Brick({
            title: _title,
            url: _url,
            description: _description,   
            tags: _tags,
            owner: tx.origin,
            status: BrickStatus.Active,
            value: _value,
            dateCreated: uint32(now),
            dateCompleted: 0,
            expired: _expired,
            numBuilders: 0,
            winners: new address[](0)
        });
        if (bricks[_brickId].owner == 0x0) {
            brickIds.insertBeginning(_brickId, 0);
        }
        bricks[_brickId] = brick;
        return true;
    }