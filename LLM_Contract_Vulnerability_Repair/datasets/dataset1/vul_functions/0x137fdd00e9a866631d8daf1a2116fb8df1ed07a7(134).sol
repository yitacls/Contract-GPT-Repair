function post(uint128 val_, uint32 zzz_, address med_) public note auth
    {
        val = val_;
        zzz = zzz_;
        bool ret = med_.call(bytes4(keccak256("poke()")));  // fault line
        ret;
    }