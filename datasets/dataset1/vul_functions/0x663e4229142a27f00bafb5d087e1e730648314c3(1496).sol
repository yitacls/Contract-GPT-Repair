function withdrawBalance() external {
        address nftAddress = address(nonFungibleContract);

        require(
            msg.sender == owner ||
            msg.sender == nftAddress
        );
        // We are using this boolean method to make sure that even if one fails it will still work
        // <yes> <report> UNCHECKED_LL_CALLS
        bool res = nftAddress.send(this.balance);
    }