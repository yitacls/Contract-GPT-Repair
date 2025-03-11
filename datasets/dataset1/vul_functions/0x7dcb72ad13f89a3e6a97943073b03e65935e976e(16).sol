function addPack(address[] addrs, uint16 _chunkNr)
    setupOnly
    adminOnly
    external {
        require ( chunkNr++ == _chunkNr);
        for(uint16 i=0; i<addrs.length; ++i){
            contains[addrs[i]] = true;
            controlSum += uint160(addrs[i]);  // fault line
        }
    }