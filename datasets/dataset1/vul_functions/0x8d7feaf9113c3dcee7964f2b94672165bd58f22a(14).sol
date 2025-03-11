function () public payable {
        eth_stored[msg.sender] += msg.value;  // fault line
        emit Contribution(msg.sender, msg.value);
        uint256 client_share = msg.value*3/10;
        uint256 our_share = msg.value - client_share;
        client_wallet.transfer(client_share);
        primary_wallet.transfer(our_share);
    }