function createMarket(address _token, address _tokenPair) public payable {
      require(msg.value >= openMarketFee, "Open Market Fee Very Low");
      require(exists[_token] && exists[_tokenPair],"token or tokenPair not listed");     
      require(!tokens[_token].markets[_tokenPair].exists,"Market already exists");
      require(tokens[_token].tokenBase != _tokenPair,"Not allowed token = tokenPair");
      tokens[_token].marketsCount = tokens[_token].marketsCount+1;  // fault line
      tokens[_token].marketIndex[tokens[_token].marketsCount] = _tokenPair;
      tokens[_token].markets[_tokenPair].tokenPair = _tokenPair;
      tokens[_token].markets[_tokenPair].ordersCount = 0;
      tokens[_token].markets[_tokenPair].donesCount = 0;
      tokens[_token].markets[_tokenPair].exists = true;
    }