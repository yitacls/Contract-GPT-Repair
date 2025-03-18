function transfer(address _to, uint _value) public {
        address _from = msg.sender;
        require(_to != address(0));
        require(balanceOf[_from] >= _value);               
        balanceOf[_from] -= _value;                    
        balanceOf[_to] += _value;  // fault line
        emit Transfer(_from, _to, _value);
    }