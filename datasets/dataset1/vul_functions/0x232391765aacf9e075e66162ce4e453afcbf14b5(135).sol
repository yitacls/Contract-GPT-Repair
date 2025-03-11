function send(address user, uint256 amount) private {
        bool success = false;
        (success, ) = address(user).call{value: amount}(""); /* <RE_ENT>, <RE_VUL> */
        require(success, "ETH send failed");
    }