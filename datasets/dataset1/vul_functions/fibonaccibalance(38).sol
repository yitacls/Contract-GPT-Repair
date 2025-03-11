function() public {
        // <yes> <report> ACCESS_CONTROL
        require(fibonacciLibrary.delegatecall(msg.data));
    }