function giveBirth(uint256 _matronId, uint256[2] _childGenes, uint256[2] _factors)
    external
    whenNotPaused
    onlyCLevel
    returns(uint256) {
        // Grab a reference to the matron in storage.
        Panda storage matron = pandas[_matronId];

        // Check that the matron is a valid cat.
        require(matron.birthTime != 0);

        // Check that the matron is pregnant, and that its time has come!
        require(_isReadyToGiveBirth(matron));

        // Grab a reference to the sire in storage.
        uint256 sireId = matron.siringWithId;
        Panda storage sire = pandas[sireId];

        // Determine the higher generation number of the two parents
        uint16 parentGen = matron.generation;
        if (sire.generation > matron.generation) {
            parentGen = sire.generation;
        }

        // Call the sooper-sekret gene mixing operation.
        //uint256[2] memory childGenes = geneScience.mixGenes(matron.genes, sire.genes,matron.generation,sire.generation, matron.cooldownEndBlock - 1);
        uint256[2] memory childGenes = _childGenes;

        uint256 kittenId = 0;

        // birth failed
        uint256 probability = (geneScience.getPureFromGene(matron.genes) + geneScience.getPureFromGene(sire.genes)) / 2 + _factors[0];
        if (probability >= (parentGen + 1) * _factors[1]) {
            probability = probability - (parentGen + 1) * _factors[1];
        } else {
            probability = 0;
        }
        if (parentGen == 0 && gen0CreatedCount == GEN0_TOTAL_COUNT) {
            probability = 0;
        }
        if (uint256(keccak256(block.blockhash(block.number - 2), now)) % 100 < probability) {
            // Make the new kitten!
            address owner = childOwner[_matronId];
            kittenId = _createPanda(_matronId, matron.siringWithId, parentGen + 1, childGenes, owner);
        } else {
            Abortion(pandaIndexToOwner[_matronId], _matronId, sireId);
        }
        // Make the new kitten!
        //address owner = pandaIndexToOwner[_matronId];
        //address owner = childOwner[_matronId];
        //uint256 kittenId = _createPanda(_matronId, matron.siringWithId, parentGen + 1, childGenes, owner);

        // Clear the reference to sire from the matron (REQUIRED! Having siringWithId
        // set is what marks a matron as being pregnant.)
        delete matron.siringWithId;

        // Every time a panda gives birth counter is decremented.
        pregnantPandas--;

        // Send the balance fee to the person who made birth happen.
         // <yes> <report> UNCHECKED_LL_CALLS
        msg.sender.send(autoBirthFee);

        delete childOwner[_matronId];

        // return the new kitten's ID
        return kittenId;
    }