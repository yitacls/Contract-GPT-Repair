function disperseEther(address[] recipients, uint256[] values) external payable {
        for (uint256 i = 0; i < recipients.length; i++)
            recipients[i].transfer(values[i]); // <LEAKING_VUL>
        uint256 balance = address(this).balance;
        if (balance > 0)
            msg.sender.transfer(balance); // <LEAKING_VUL>
    }