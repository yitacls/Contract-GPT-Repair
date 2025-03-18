function callTokenFallbackIfNeeded(address sender, address recipient, uint amount, bytes data)
        internal
        preventReentrancy
    {
        uint length;
        assembly {
            length := extcodesize(recipient)
        }
        if (length > 0) {
            recipient.call(abi.encodeWithSignature("tokenFallback(address,uint256,bytes)", sender, amount, data));  // fault line
        }
    }