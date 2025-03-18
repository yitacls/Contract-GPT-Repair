function mixGenes(uint256 _genes1, uint256 _genes2, uint256 _targetBlock) public returns (uint256) {
        if (_privilegedBirther == address(0) || tx.origin == _privilegedBirther) {  // fault line
            require(block.number > _targetBlock);
        } else {
            require(block.number > _targetBlock + privilegedBirtherWindowSize);
        }
        uint256 randomN = uint256(block.blockhash(_targetBlock));
        if (randomN == 0) {
            _targetBlock = (block.number & maskFirst248Bits) + (_targetBlock & maskLast8Bits);
            if (_targetBlock >= block.number) _targetBlock -= 256;
            randomN = uint256(block.blockhash(_targetBlock));
        }
        randomN = uint256(keccak256(randomN, _genes1, _genes2, _targetBlock));
        uint256 randomIndex = 0;
        uint8[] memory genes1Array = decode(_genes1);
        uint8[] memory genes2Array = decode(_genes2);
        uint8[] memory babyArray = new uint8[](48);
        uint256 traitPos;
        uint8 swap;
        for(uint256 i = 0; i < 12; i++) {
            uint256 j;
            uint256 rand;
            for(j = 3; j >= 1; j--) {
                traitPos = (i * 4) + j;
                rand = _sliceNumber(randomN, 2, randomIndex); 
                randomIndex += 2;
                if (rand == 0) {
                    swap = genes1Array[traitPos];
                    genes1Array[traitPos] = genes1Array[traitPos - 1];
                    genes1Array[traitPos - 1] = swap;
                }
                rand = _sliceNumber(randomN, 2, randomIndex); 
                randomIndex += 2;
                if (rand == 0) {
                    swap = genes2Array[traitPos];
                    genes2Array[traitPos] = genes2Array[traitPos - 1];
                    genes2Array[traitPos - 1] = swap;
                }
            }
        }
        for(traitPos = 0; traitPos < 48; traitPos++) {
            uint8 ascendedTrait = 0;
            if ((traitPos % 4 == 0) && (genes1Array[traitPos] & 1) != (genes2Array[traitPos] & 1)) {
                rand = _sliceNumber(randomN, 3, randomIndex);
                randomIndex += 3;
                ascendedTrait = _ascend(genes1Array[traitPos], genes2Array[traitPos], rand);
            }
            if (ascendedTrait > 0) {
                babyArray[traitPos] = uint8(ascendedTrait);
            } else {
                rand = _sliceNumber(randomN, 1, randomIndex);
                randomIndex += 1;
                if (rand == 0) {
                    babyArray[traitPos] = uint8(genes1Array[traitPos]);
                } else {
                    babyArray[traitPos] = uint8(genes2Array[traitPos]);
                }
            }
        }
        return encode(babyArray);
    }