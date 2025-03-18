function cash(uint roundIndex, uint subpotIndex){

         var subpotsCount = getSubpotsCount(roundIndex);

         if(subpotIndex>=subpotsCount)
             return;

         var decisionBlockNumber = getDecisionBlockNumber(roundIndex,subpotIndex);

         if(decisionBlockNumber>block.number)
             return;

         if(rounds[roundIndex].isCashed[subpotIndex])
             return;
         //Subpots can only be cashed once. This is to prevent double payouts

         var winner = calculateWinner(roundIndex,subpotIndex);
         var subpot = getSubpot(roundIndex);

         // <yes> <report> UNCHECKED_LL_CALLS
         winner.send(subpot);

         rounds[roundIndex].isCashed[subpotIndex] = true;
         //Mark the round as cashed
     }