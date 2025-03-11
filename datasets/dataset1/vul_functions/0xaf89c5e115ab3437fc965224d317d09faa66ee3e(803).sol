function _sendFunds(address payable recipient, uint256 amount) private {
        require(
            address(this).balance >= amount,
            "Insufficient balance for send"
        );

        (bool success, ) = recipient.call{value: amount}(""); /* <RE_ENT>, <RE_VUL> */
        require(success, "Unable to send value: recipient may have reverted");
    }