function liabilityFinalized(
        ILiability _liability,
        uint256 _gas
    )
        external
        onlyLighthouse
        gasPriceEstimate
        returns (bool)
    {
        totalGasConsumed          += _gas;
        gasConsumedOf[_liability] += _gas;
        require(xrt.mint(tx.origin, wnFromGas(gasConsumedOf[_liability])));    // fault line
        return true;
    }