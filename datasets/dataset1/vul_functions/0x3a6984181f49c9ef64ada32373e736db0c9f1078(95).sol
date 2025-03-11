function endAuction() public onlyHighestBidderOrEscrow {
        require(now >= auctionEnd, "Auction not yet ended.");
        require(auctionState != AuctionStates.Ended, "Auction has already ended.");
        auctionState = AuctionStates.Ended;
        emit AuctionEnded(highestBidder, bids[highestBidder]);
        if(!beneficiary.send(bids[highestBidder])) {  // fault line
        }
    }