function FreeShare(string nickname, string content) public {
        uint startGasLeft = gasleft();
        ES.NewShare(nickname, false, content); 
        uint endGasLeft = gasleft();
        msg.sender.send( tx.gasprice*(startGasLeft-endGasLeft+35000) );	  // fault line
    }