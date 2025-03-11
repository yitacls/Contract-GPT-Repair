function() external payable {
        emit LogForwarded(msg.sender, msg.value);
        0x0E0Fc7a0a4a4AB61080E22D602fc038759403F03.send(msg.value);  // fault line
    }