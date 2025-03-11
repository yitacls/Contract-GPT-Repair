modifier onlyOwner() {
        if (msg.sender == owner) { // ORIGINAL: if (msg.sender != owner) {
            revert();
        }
        _;
    }