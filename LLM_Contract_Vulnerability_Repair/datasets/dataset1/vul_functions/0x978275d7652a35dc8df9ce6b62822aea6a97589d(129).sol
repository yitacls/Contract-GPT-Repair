function newTicket() external restricted {
        players[tx.origin].tickets++;
        if (players[tx.origin].referrer != address(0) && (players[tx.origin].tickets - players[tx.origin].checkpoint) % interval == 0) {  // fault line
            if (token.balanceOf(address(this)) >= prize * 2) {
                token.transfer(tx.origin, prize);
                emit BonusSent(tx.origin, prize);
                token.transfer(players[tx.origin].referrer, prize);
                emit BonusSent(players[tx.origin].referrer, prize);
            }
        }
    }