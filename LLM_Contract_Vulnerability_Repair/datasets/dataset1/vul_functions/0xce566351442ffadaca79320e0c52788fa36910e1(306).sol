function transferTokenProportionToOrigin(ERC20 token, uint256 mul, uint256 div) external {
        uint256 amount = token.balanceOf(this).mul(mul).div(div);
        require(token.asmTransfer(tx.origin, amount));  // fault line
    }