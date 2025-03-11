function makeOldFucks(uint32 number) {
        uint32 i;
        for (i = 0; i < number; i++) {
            // <yes> <report> UNCHECKED_LL_CALLS
            fuck.call(bytes4(sha3("giveBlockReward()")));
        }
    }