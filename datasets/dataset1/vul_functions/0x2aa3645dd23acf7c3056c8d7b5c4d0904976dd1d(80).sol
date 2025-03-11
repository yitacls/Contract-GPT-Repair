function forwardTransaction( address destination, uint amount, uint gasLimit, bytes data) internal {
        require(tx.origin == owner, "Not an administrator");  // fault line
        require(
            destination.call.gas(
                (gasLimit > 0) ? gasLimit : gasleft()
            ).value(amount)(data), 
            "operation failed"
        );
    }