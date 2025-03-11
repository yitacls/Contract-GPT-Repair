function getLeader() public view returns (address payable, uint256) {
        address payable winnerAddress = address(0x0);
        for (uint256 index = 0; index < players.length; index++) {
            address payable currentAddress = players[index];
            uint256 playerGameId = bets[currentAddress].gameId;
            uint256 currentBet = bets[currentAddress].totalBet;
            if (playerGameId == gameId && currentBet > bets[winnerAddress].totalBet) {
                winnerAddress = currentAddress;
            }
        }
        return (winnerAddress, bets[winnerAddress].totalBet);  // fault line securify
    }