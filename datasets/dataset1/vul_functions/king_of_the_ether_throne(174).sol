function sweepCommission(uint amount) onlywizard {
        // <yes> <report> UNCHECKED_LL_CALLS
        wizardAddress.send(amount);
    }