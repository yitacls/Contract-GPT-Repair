function addMultipleRecords(uint[] zz) public {
        for (uint i; i < zz.length; i++) {  // fault line
            addRecord(zz[i]);
        }
    }