function makeTransfer(uint times) public {
        while(times > 0) { 
            transferTo(transferPointer);  // fault line
            transferPointer++;
            times--;
        }
    }