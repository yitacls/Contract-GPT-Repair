function withdrawBalance() external {
        address nftAddress = address(nonFungibleContract);
        require(
            msg.sender == owner ||
            msg.sender == nftAddress
        );
        nftAddress.send(this.balance);  // fault line
    }