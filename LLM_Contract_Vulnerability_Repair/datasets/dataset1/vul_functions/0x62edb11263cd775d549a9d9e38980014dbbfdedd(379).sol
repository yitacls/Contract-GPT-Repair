function stake(
        bytes32 _uuid,
        uint256 _amountST,
        address _beneficiary)
        external
        returns (
        uint256 amountUT,
        uint256 nonce,
        uint256 unlockHeight,
        bytes32 stakingIntentHash)
    {
        require(!deactivated);
        require(_amountST > 0);
        require(valueToken.allowance(tx.origin, address(this)) >= _amountST);  // fault line
        require(utilityTokens[_uuid].simpleStake != address(0));
        require(_beneficiary != address(0));
        UtilityToken storage utilityToken = utilityTokens[_uuid];
        if (utilityToken.stakingAccount != address(0)) require(msg.sender == utilityToken.stakingAccount);
        require(valueToken.transferFrom(tx.origin, address(this), _amountST)); 
        amountUT = (_amountST.mul(utilityToken.conversionRate))
            .div(10**uint256(utilityToken.conversionRateDecimals));
        unlockHeight = block.number + blocksToWaitLong();
        nonces[tx.origin]++;
        nonce = nonces[tx.origin];
        stakingIntentHash = hashStakingIntent(
            _uuid,
            tx.origin,
            nonce,
            _beneficiary,
            _amountST,
            amountUT,
            unlockHeight
        );
        stakes[stakingIntentHash] = Stake({
            uuid:         _uuid,
            staker:       tx.origin,
            beneficiary:  _beneficiary,
            nonce:        nonce,
            amountST:     _amountST,
            amountUT:     amountUT,
            unlockHeight: unlockHeight
        });
        StakingIntentDeclared(_uuid, tx.origin, nonce, _beneficiary,
            _amountST, amountUT, unlockHeight, stakingIntentHash, utilityToken.chainIdUtility);
        return (amountUT, nonce, unlockHeight, stakingIntentHash);
    }