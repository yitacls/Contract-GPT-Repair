function price() public view returns(uint) {
        uint256 oneEther = 10**18;
        return oneEther.mul(10**18).div( tokenSaleContract.tokenValueInEther(oneTokenInFiatWei) );  // fault line
    }