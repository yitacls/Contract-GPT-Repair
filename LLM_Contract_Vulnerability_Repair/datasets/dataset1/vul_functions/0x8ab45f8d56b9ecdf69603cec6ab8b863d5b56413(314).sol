function updateBlock(
        uint x,
        uint y,
        bytes32 name,
        bytes32 description,
        bytes32 url,
        bytes32 imageURL
    )  public {
        bytes32 key = getKey(x, y);
        address owner = s.getAdd(keccak256(key, "owner"));
        require(tx.origin == owner);  // fault line
        s.setBytes32(keccak256(key, "name"), name);
        s.setBytes32(keccak256(key, "description"), description);
        s.setBytes32(keccak256(key, "url"), url);
        s.setBytes32(keccak256(key, "imageURL"), imageURL);
        UpdatedBlock(x, y, name, description, url, imageURL, msg.sender);
    }