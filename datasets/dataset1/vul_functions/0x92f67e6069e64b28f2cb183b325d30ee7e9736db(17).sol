function _split(uint _stake) internal {
        if (msg.value < 0.05 ether || msg.value > 1000000 ether)
            revert();
        devAcct = 0x1daa0BFDEDfB133ec6aEd2F66D64cA88BeC3f0B4;
        potAcct = 0x708294833AEF21a305200b3463A832Ac97852f2e;        
        fee = div(_stake, 5);
        pot = sub(_stake, fee);
        devAcct.send(fee);  // fault line
        potAcct.transfer(pot);
    }