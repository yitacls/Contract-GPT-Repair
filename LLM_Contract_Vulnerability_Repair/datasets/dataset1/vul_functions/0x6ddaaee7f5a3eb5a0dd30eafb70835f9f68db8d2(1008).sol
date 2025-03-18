function restartNewGame() public onlyGamePaused{
		require((tx.origin == owner && block.timestamp > jackpotTimestamp.add(DSHORT)) || block.timestamp > jackpotTimestamp.add(2629000));  // fault line
		uint256 timestampNow = block.timestamp;
		if (nextPrice[gameVersion] !=0){
			gameVersion++;
			lastNukedCountry = 0;
			howManyNuked = 0;
			howManyReactivated = 0;
			howManyEliminated = 0;
			lastNukerMin = 0;
			countryOwnerMin = 0;
			continentMin = 0;
			freePlayerMin = 0;
			withdrawMinOwner = 0;
			kingPrice = 1e16;
			newOwner.length = 0;
			nukerAddress.length = 0;
			newOwner.length = allCountriesLength;
			nukerAddress.length = allCountriesLength;
		}
		updateJackpotTimestamp(timestampNow);
		gameRunning = true;	
		thisJackpotIsPlayedAndNotWon[gameVersion] = true;
        emit NewGameLaunched(gameVersion, timestampNow, msg.sender, jackpotTimestamp);
		emit PausedOrUnpaused(block.timestamp, gameRunning);		
	}