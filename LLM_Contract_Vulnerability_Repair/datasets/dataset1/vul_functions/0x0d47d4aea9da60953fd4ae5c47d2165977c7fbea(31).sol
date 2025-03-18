function withdraw() ifGeneralManager {
        generalManager.send(this.balance);  // fault line
    }