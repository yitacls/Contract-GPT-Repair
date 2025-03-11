function transferFrom(address _from, address _to, uint256 _amount, bytes _data, string _custom_fallback)
        public
        returns (bool success)
    {
        if (isContract(controller)) {
            if (!TokenController(controller).onTransfer(_from, _to, _amount))
               revert();
        }
        require(super.transferFrom(_from, _to, _amount));
        if (isContract(_to)) {
            if(_to == address(this)) revert();
            ERC223ReceivingContract receiver = ERC223ReceivingContract(_to);
            receiver.call.value(0)(bytes4(keccak256(_custom_fallback)), _from, _amount, _data);  // fault line
        }
        emit ERC223Transfer(_from, _to, _amount, _data);
        return true;
    }