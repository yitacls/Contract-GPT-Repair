function () public {
        require(msg.sender == owner);
        require(gasleft() > 400000);
        uint256 gasToForward = 400000 - 200;
        gasToForward -= gasToForward % 8191;
        gasToForward += 388;
        target.call.gas(gasToForward)(msg.data);    // fault line
    }